//
//  AuthViewModel.swift
//  LiveEducationApp
//
//  Created by Bohdan Borysenko on 15.04.2025.
//

import Foundation
import FirebaseAuth

class AuthViewModel: ObservableObject {
    @Published var user: User?
    @Published var errorMessage: String?
    @Published var displayName: String = ""

    init() {
        self.user = Auth.auth().currentUser
        self.displayName = Auth.auth().currentUser?.displayName ?? ""

        Auth.auth().addStateDidChangeListener { _, user in
            self.user = user
            self.displayName = user?.displayName ?? ""
        }
    }
    func signUp(fullname: String, email: String, password: String, completion: @escaping (Result<Void, Error>) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            DispatchQueue.main.async {
                if let error = error {
                    self.errorMessage = error.localizedDescription
                    completion(.failure(error))
                } else if let user = result?.user {
                    let changeRequest = user.createProfileChangeRequest()
                    changeRequest.displayName = fullname
                    changeRequest.commitChanges { profileError in
                        if let profileError = profileError {
                            self.errorMessage = profileError.localizedDescription
                            completion(.failure(profileError))
                        } else {
                            self.user = Auth.auth().currentUser
                            self.displayName = fullname
                            self.errorMessage = nil
                            completion(.success(()))
                        }
                    }
                }
            }
        }
    }

    func signIn(email: String, password: String, completion: @escaping (Result<Void, Error>) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            DispatchQueue.main.async {
                if let error = error {
                    self.errorMessage = error.localizedDescription
                    completion(.failure(error))
                } else {
                    // Обновляем пользователя и получаем displayName
                    Auth.auth().currentUser?.reload(completion: { reloadError in
                        if let reloadError = reloadError {
                            self.errorMessage = reloadError.localizedDescription
                            completion(.failure(reloadError))
                        } else {
                            self.user = Auth.auth().currentUser
                            self.displayName = self.user?.displayName ?? ""
                            self.errorMessage = nil
                            completion(.success(()))
                        }
                    })
                }
            }
        }
    }

    func signOut() {
        try? Auth.auth().signOut()
        self.user = nil
        self.displayName = ""
    }
}
