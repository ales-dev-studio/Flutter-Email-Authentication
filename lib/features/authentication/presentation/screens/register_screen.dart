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
import '../../../../core/widgets/lists/app_single_child_scroll_view.dart';
import '../../../../core/widgets/typography/app_title_large_text.dart';
import '../../data/models/auth_params_model.dart';
import '../../data/models/user_model.dart';
import '../../data/models/verify_otp_params.dart';
import '../bloc/authentication_cubit.dart';
import '../widgets/continue_with_sso_widget.dart';
import '../widgets/email_text_form_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final FocusNode confirmPasswordFocusNode = FocusNode();

  bool obscurePassword = true;
  bool obscureConfirmPassword = true;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
              AppTitleLargeText(t.createAccount),
              AppVSpace(),
              Form(
                key: formKey,
                child: Column(
                  spacing: Dimens.veryLargePadding,
                  children: [
                    EmailTextFormField(controller: emailController),
                    AppTextFormField(
                      controller: passwordController,
                      hinText: t.pass,
                      labelText: t.pass,
                      nextFocusNode: confirmPasswordFocusNode,
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
                      textInputAction: TextInputAction.next,
                      validator: validateSecurePassword,
                    ),
                    AppTextFormField(
                      controller: confirmPasswordController,
                      hinText: t.ConfirmPassword,
                      labelText: t.ConfirmPassword,
                      focusNode: confirmPasswordFocusNode,
                      hasValidation: true,
                      prefixIcon: TextFieldIconWidget(Assets.icons.shield),
                      suffixIcon: SizedBox(
                        height: 30,
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              obscureConfirmPassword = !obscureConfirmPassword;
                            });
                          },
                          icon: TextFieldIconWidget(
                            obscureConfirmPassword
                                ? Assets.icons.eyeClosed
                                : Assets.icons.eye,
                          ),
                        ),
                      ),
                      obSecure: obscureConfirmPassword,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return t.confirmPass;
                        }
                        if (value != passwordController.text) {
                          return t.passwordsDoNotMatch;
                        }
                        return null;
                      },
                      textInputAction: TextInputAction.done,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: Dimens.padding),
                child: AppButton(
                  title: t.signUp,
                  onPressed: onSubmit,
                  borderRadius: Dimens.corners,
                  isLoading:
                      context
                          .watch<AuthenticationCubit>()
                          .state
                          .registerStatus ==
                      Status.loading,
                ),
              ),
              AppVSpace(space: Dimens.padding),
              ContinueWithSsoWidget(),
              Padding(
                padding: const EdgeInsets.only(top: Dimens.padding),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: Dimens.padding,
                  children: [
                    Text(t.alreadyHaveAcc),
                    GestureDetector(
                      onTap: () {
                        context.pushReplacementNamed(GoRoutesPath.signIn);
                      },
                      child: Text(
                        t.signIn,
                        style: TextStyle(color: AppColors.primaryColor),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onSubmit() {
    if (formKey.currentState!.validate()) {
      context.read<AuthenticationCubit>().register(
        authParamModel: AuthParamsModel(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        ),
        onSuccess: (final UserModel userModel) {
          context.pushNamed(
            GoRoutesPath.otpVerification,
            extra: {
              'email': emailController.text,
              'OTPVerificationType': OTPVerificationType.register,
            },
          );
        },
      );
    }
  }
}
