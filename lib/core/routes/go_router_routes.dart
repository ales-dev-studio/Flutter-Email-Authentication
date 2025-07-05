import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/routes/go_routes_path.dart';
import '../../features/authentication/presentation/screens/authentication_screen.dart';
import '../../features/authentication/presentation/screens/create_new_password.dart';
import '../../features/authentication/presentation/screens/edit_profile_screen.dart';
import '../../features/authentication/presentation/screens/forgot_password.dart';
import '../../features/authentication/presentation/screens/login_screen.dart';
import '../../features/authentication/presentation/screens/otp_verification_screen.dart';
import '../../features/authentication/presentation/screens/register_screen.dart';
import '../../features/home_feature/presentation/screens/home_screen.dart';
import '../../features/home_feature/presentation/screens/not_found_screen.dart';
import '../../features/home_feature/presentation/screens/splash_screen.dart';

final GoRouter routes = GoRouter(
  errorBuilder: (final BuildContext context, final GoRouterState state) {
    return const NotFoundScreen();
  },
  routes: <RouteBase>[
    GoRoute(
      path: GoRoutesPath.splash,
      name: GoRoutesPath.splash,
      builder: (final BuildContext context, final GoRouterState state) {
        return const SplashScreen();
      },
    ),
    GoRoute(
      path: GoRoutesPath.authentication,
      name: GoRoutesPath.authentication,
      builder: (final BuildContext context, final GoRouterState state) {
        return const AuthenticationScreen();
      },
    ),
    GoRoute(
      path: GoRoutesPath.home,
      name: GoRoutesPath.home,
      builder: (final BuildContext context, final GoRouterState state) {
        return const HomeScreen();
      },
    ),
    GoRoute(
      path: GoRoutesPath.signUp,
      name: GoRoutesPath.signUp,
      builder: (final BuildContext context, final GoRouterState state) {
        return const RegisterScreen();
      },
    ),
    GoRoute(
      path: GoRoutesPath.signIn,
      name: GoRoutesPath.signIn,
      builder: (final BuildContext context, final GoRouterState state) {
        return const LoginScreen();
      },
    ),
    GoRoute(
      path: GoRoutesPath.forgotPassword,
      name: GoRoutesPath.forgotPassword,
      builder: (final BuildContext context, final GoRouterState state) {
        return const ForgotPassword();
      },
    ),
    GoRoute(
      path: GoRoutesPath.createNewPassword,
      name: GoRoutesPath.createNewPassword,
      builder: (final BuildContext context, final GoRouterState state) {
        try {
          Map extra = state.extra as Map;
          return CreateNewPassword(email: extra['email'], code: extra['code']);
        } catch (e) {
          return const NotFoundScreen();
        }
      },
    ),
    GoRoute(
      path: GoRoutesPath.otpVerification,
      name: GoRoutesPath.otpVerification,
      builder: (final BuildContext context, final GoRouterState state) {
        try {
          Map extra = state.extra as Map;
          return OtpVerificationScreen(
            email: extra['email'],
            otpVerificationType: extra['OTPVerificationType'],
          );
        } catch (e) {
          return const NotFoundScreen();
        }
      },
    ),
    GoRoute(
      path: GoRoutesPath.editProfile,
      name: GoRoutesPath.editProfile,
      builder: (final BuildContext context, final GoRouterState state) {
        return const EditProfileScreen();
      },
    ),
  ],
);
