# Complete Email Authentication Project with Flutter

## Demo image

![Demo](https://raw.githubusercontent.com/ales-dev-studio/flutter_authentication_screens_ui/refs/heads/main/assets/images/Demo-light.png)

![Demo](https://raw.githubusercontent.com/ales-dev-studio/flutter_authentication_screens_ui/refs/heads/main/assets/images/Demo-dark.png)

A fully functional email authentication system built with Flutter, featuring:
- Screens: Sign-up, Login, Password Recovery, OTP Verification, and Profile Management.
- Features:
    - Validation: Form validations for all fields.
    - Multi-language: Supports multiple languages (easy to add more).
    - Dark/Light Themes: Built-in theme switching.
    - State Management: Uses BLoC for clean architecture.
    - Routing: Seamless navigation with GoRouter.
    - Backend-Ready: Designed for easy API integration (uses Dio for HTTP).
 
## Getting Started  
```bash
git clone https://github.com/ales-dev-studio/flutter_authentication_screens_ui.git
cd flutter_authentication_screens_ui
flutter pub get
flutter run
```

## Perfect for:
- Developers needing a production-ready auth flow.
- Projects requiring customizable authentication UI.
- Learning Flutter best practices (BLoC, Dependency Injection, etc.).


## Tech Stack:
- Flutter
- BLoC (State Management)
- Dio (HTTP Client)
- GetIt (Dependency Injection)
- GoRouter (Navigation)
- flutter_gen (Asset Generation)

Try it out! Clone and customize for your next project.

## Repository Structure:
- `core/`: Global utilities, themes, routes.
- `features/`: Auth + Home modules (data, domain, presentation).
- `assets/`: Icons, fonts, and images (auto-generated via `flutter_gen`).



Note: Replace API endpoints with your backend, and you're good to go!
