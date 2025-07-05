import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/enums/status_enums.dart';
import '../../../../core/gen/assets.gen.dart';
import '../../../../core/localization/i18n/translations.g.dart';
import '../../../../core/routes/go_routes_path.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/dimens.dart';
import '../../../../core/utils/check_desktop_size.dart';
import '../../../../core/utils/secure_pass_validator.dart';
import '../../../../core/widgets/app_scaffold.dart';
import '../../../../core/widgets/app_space.dart';
import '../../../../core/widgets/app_text_form_field.dart';
import '../../../../core/widgets/buttons/app_button.dart';
import '../../../../core/widgets/buttons/app_text_button.dart';
import '../../../../core/widgets/lists/app_single_child_scroll_view.dart';
import '../../../../core/widgets/typography/app_title_large_text.dart';
import '../../data/models/auth_params_model.dart';
import '../../data/models/resend_otp_params.dart';
import '../../data/models/user_model.dart';
import '../../data/models/verify_otp_params.dart';
import '../bloc/authentication_cubit.dart';
import '../widgets/continue_with_sso_widget.dart';
import '../widgets/email_text_form_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    final watch = context.watch<AuthenticationCubit>();
    return AppScaffold(
      showPageGradient: true,
      smallBody: FadeInDown(
        delay: Duration(milliseconds: 150),
        child: AppSingleChildScrollView(
          child: Column(
            spacing: Dimens.largePadding,
            children: [
              AppVSpace(
                space:
                    checkVerySmallDeviceSize(context)
                        ? Dimens.padding
                        : Dimens.largePadding,
              ),
              SizedBox(
                width: 250.0,
                child: Image.asset(
                  Assets.images.authentication.path,
                  fit: BoxFit.fitWidth,
                ),
              ),
              SizedBox.shrink(),
              AppTitleLargeText(t.loginToAcc),
              AppVSpace(),
              Form(
                key: formKey,
                child: Column(
                  spacing: Dimens.largePadding,
                  children: [
                    EmailTextFormField(controller: emailController),
                    AppTextFormField(
                      controller: passwordController,
                      hinText: t.pass,
                      labelText: t.pass,
                      hasValidation: true,
                      prefixIcon: TextFieldIconWidget(Assets.icons.shield),
                      suffixIcon: SizedBox(
                        height: 30,
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              obscurePassword = !obscurePassword;
                            });
                          },
                          icon: TextFieldIconWidget(
                            obscurePassword
                                ? Assets.icons.eyeClosed
                                : Assets.icons.eye,
                          ),
                        ),
                      ),
                      obSecure: obscurePassword,
                      textInputAction: TextInputAction.done,
                      validator: validateSecurePassword,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: Dimens.padding),
                child: Column(
                  children: [
                    AppButton(
                      title: t.signIn,
                      onPressed: onSubmit,
                      borderRadius: Dimens.corners,
                      isLoading: watch.state.loginStatus == Status.loading,
                    ),
                    AppTextButton(
                      title: t.forgotPass,
                      onPressed: () {
                        context.pushNamed(GoRoutesPath.forgotPassword);
                      },
                      verticalMargin: 0,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: Dimens.padding),
                child: ContinueWithSsoWidget(),
              ),
              AppVSpace(space: Dimens.smallPadding),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: Dimens.padding,
                children: [
                  Text(t.doNotHaveAcc),
                  GestureDetector(
                    onTap: () {
                      context.pushReplacementNamed(GoRoutesPath.signUp);
                    },
                    child: Text(
                      t.signUp,
                      style: TextStyle(color: AppColors.primaryColor),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onSubmit() {
    if (formKey.currentState!.validate()) {
      final read = context.read<AuthenticationCubit>();
      read.login(
        authParamModel: AuthParamsModel(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        ),
        onSuccess: (final UserModel userModel) {
          if (userModel.isEmailVerified ?? false) {
            context.goNamed(GoRoutesPath.home);
          } else {
            read.resendOtp(
              resendOTPParams: ResendOTPParams(
                otpVerificationType: OTPVerificationType.login,
                email: emailController.text.trim(),
              ),
              onSuccess: () {
                context.pushNamed(
                  GoRoutesPath.otpVerification,
                  extra: {
                    'email': emailController.text,
                    'OTPVerificationType': OTPVerificationType.login,
                  },
                );
              },
            );
          }
        },
      );
    }
  }
}
