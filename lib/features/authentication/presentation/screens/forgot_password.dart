import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/enums/status_enums.dart';
import '../../../../core/localization/i18n/translations.g.dart';
import '../../../../core/routes/go_routes_path.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/dimens.dart';
import '../../../../core/utils/check_desktop_size.dart';
import '../../../../core/utils/check_theme_status.dart';
import '../../../../core/widgets/app_scaffold.dart';
import '../../../../core/widgets/app_space.dart';
import '../../../../core/widgets/buttons/app_button.dart';
import '../../../../core/widgets/lists/app_single_child_scroll_view.dart';
import '../../../../core/widgets/transparent_app_bar.dart';
import '../../../../core/widgets/typography/app_title_large_text.dart';
import '../../data/models/verify_otp_params.dart';
import '../bloc/authentication_cubit.dart';
import '../widgets/auth_illustration.dart';
import '../widgets/email_text_form_field.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
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
                            : Dimens.largePadding,
                  ),
                  Column(
                    children: [
                      AuthIllustration(width: 270),
                      AppTitleLargeText(t.forgotPass),
                      const AppVSpace(),
                      Text(
                        t.forgotPassDesc,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color:
                              checkDarkMode(context)
                                  ? AppColors.descriptionColor
                                  : null,
                        ),
                      ),
                    ],
                  ),
                  AppVSpace(),
                  Form(
                    key: formKey,
                    child: EmailTextFormField(
                      controller: emailController,
                      textInputAction: TextInputAction.done,
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
          borderRadius: Dimens.corners,
          isLoading: watch.state.forgotPasswordStatus == Status.loading,
        ),
      ),
    );
  }

  void onSubmit() {
    if (formKey.currentState!.validate()) {
      final read = context.read<AuthenticationCubit>();
      read.forgotPassword(
        email: emailController.text.trim(),
        onSuccess: () {
          context.pushNamed(
            GoRoutesPath.otpVerification,
            extra: {
              'email': emailController.text,
              'OTPVerificationType': OTPVerificationType.forgotPassword,
            },
          );
        },
      );
    }
  }
}
