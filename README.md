# 📚 LiveEducationApp

Interactive educational application with authorization, course system and adaptive design theme.

---

## 🚀 Features

- Register and login via Email + Firebase Auth
- Saving login status on re-launch
- Display username after authorization
- "Profile" screen with ability to change photo and enable/disable dark theme
- Animated carousel of courses by category
- Onboarding screen on first launch
- UI implemented based on layout from Figma
- Light / Dark Mode support

---

## 🧱 Architecture

- **SwiftUI + MVVM**
- **FirebaseAuth** - for registration and authorization
- **@AppStorage** - for storing state (onboarding, topic, login)
- **TabView** - basic navigation between Home / Courses / Profile
- **CourseCardView** - custom course card component
- **ImagePicker** - to select custom avatar

---

## 📂 Project Structure

Translated with DeepL.com (free version)

LiveEducationApp/
├── AppDelegate.swift
├── LiveEducationAppApp.swift
├── Models/
│   └── Course.swift
├── ViewModel/
│   └── AuthViewModel.swift
├── Views/
│   ├── OnboardingView.swift
│   ├── LoginView.swift
│   ├── SignUpView.swift
│   ├── HomeView.swift
│   ├── CourseCardView.swift
│   ├── ProfileView.swift
│   └── MainTabView.swift
├── Components/
│   └── CustomInputField, PasswordField, SocialLoginButton.swift
├── Assets/
│   └── Картинки, иконки, шрифты
├── Firebase/
│   └── GoogleService-Info.plist


## 🛠 Installation✅ Current functionality
- Firebase authorization and state saving
- Username display
- Dark theme
- Custom TabBar
- Screen with courses and filtering
- Carousel with courses (TabView + PageStyle)
- Profile with ability to change photo
- Preview for all screens

📸 Preview


📬 Feedback
