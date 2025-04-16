//
//  GoogleSignInHelper.swift
//  LiveEducationApp
//
//  Created by Bohdan Borysenko on 16.04.2025.
//
//import FirebaseCore
//import Foundation
//import FirebaseAuth
//import GoogleSignIn
//
//class GoogleSignInHelper {
//    static let shared = GoogleSignInHelper()
//
//    func signIn(presenting viewController: UIViewController, completion: @escaping (Result<User, Error>) -> Void) {
//        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
//
//        let config = GIDConfiguration(clientID: clientID)
//
//        GIDSignIn.sharedInstance.signIn(with: config, presenting: viewController) { user, error in
//            if let error = error {
//                completion(.failure(error))
//                return
//            }
//
//            guard let authentication = user?.authentication,
//                  let idToken = authentication.idToken else {
//                completion(.failure(NSError(domain: "GoogleAuth", code: -1)))
//                return
//            }
//
//            let credential = GoogleAuthProvider.credential(withIDToken: idToken,
//                                                           accessToken: authentication.accessToken)
//
//            Auth.auth().signIn(with: credential) { authResult, error in
//                if let error = error {
//                    completion(.failure(error))
//                } else if let user = authResult?.user {
//                    completion(.success(user))
//                }
//            }
//        }
//    }
//}
