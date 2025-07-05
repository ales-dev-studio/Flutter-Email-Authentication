import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/enums/status_enums.dart';
import '../../../../core/gen/assets.gen.dart';
import '../../../../core/localization/i18n/translations.g.dart';
import '../../../../core/routes/go_routes_path.dart';
import '../../../../core/theme/dimens.dart';
import '../../../../core/utils/app_snack_bar.dart';
import '../../../../core/utils/check_desktop_size.dart';
import '../../../../core/utils/secure_pass_validator.dart';
import '../../../../core/widgets/app_scaffold.dart';
import '../../../../core/widgets/app_space.dart';
import '../../../../core/widgets/app_text_form_field.dart';
import '../../../../core/widgets/buttons/app_button.dart';
import '../../../../core/widgets/lists/app_single_child_scroll_view.dart';
import '../../../../core/widgets/transparent_app_bar.dart';
import '../../../../core/widgets/typography/app_title_large_text.dart';
import '../../data/models/reset_password_params.dart';
import '../bloc/authentication_cubit.dart';
import '../widgets/auth_illustration.dart';

class CreateNewPassword extends StatefulWidget {
  const CreateNewPassword({super.key, required this.email, required this.code});

  final String email;
  final String code;

  @override
  State<CreateNewPassword> createState() => _CreateNewPasswordState();
}

class _CreateNewPasswordState extends State<CreateNewPassword> {
  final formKey = GlobalKey<FormState>();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final FocusNode confirmPasswordFocusNode = FocusNode();
  bool obscurePassword = true;
  bool obscureConfirmPassword = true;

  @override
  void dispose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final watch = context.watch<AuthenticationCubit>();
    return AppScaffold(
      showPageGradient: true,
      smallBody: Stack(
        children: [
          FadeInDown(
            delay: Duration(milliseconds: 150),
            child: AppSingleChildScrollView(
              child: Column(
                spacing: Dimens.largePadding,
                children: [
                  AppVSpace(
                    space:
                        checkVerySmallDeviceSize(context)
                            ? Dimens.padding
                            : Dimens.extraLargePadding,
                  ),
                  AuthIllustration(),
                  AppTitleLargeText(t.createPass),
                  AppVSpace(),
                  Form(
                    key: formKey,
                    child: Column(
                      spacing: Dimens.veryLargePadding,
                      children: [
                        AppTextFormField(
                          controller: passwordController,
                          hinText: t.pass,
                          labelText: t.pass,
                          hasValidation: true,
                          nextFocusNode: confirmPasswordFocusNode,
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
                                  obscureConfirmPassword =
                                      !obscureConfirmPassword;
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
                  AppVSpace(space: 100),
                ],
              ),
            ),
          ),
          TransparentAppBar(),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(Dimens.largePadding),
        child: AppButton(
          title: t.submit,
          onPressed: onSubmit,
          isLoading: watch.state.resetPasswordStatus == Status.loading,
          borderRadius: Dimens.corners,
        ),
      ),
    );
  }

  void onSubmit() {
    if (formKey.currentState!.validate()) {
      context.read<AuthenticationCubit>().resetPassword(
        params: ResetPasswordParams(
          code: widget.code,
          email: widget.email,
          newPassword: passwordController.text.trim(),
        ),
        onSuccess: () {
          showSnackBar(
            t.passChangeSuccessful,
            snackBarType: SnackBarType.success,
          );
          context.goNamed(GoRoutesPath.signIn);
        },
      );
    }
  }
}
