import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/enums/status_enums.dart';
import '../../../../core/localization/i18n/translations.g.dart';
import '../../../../core/routes/go_routes_path.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/dimens.dart';
import '../../../../core/utils/app_snack_bar.dart';
import '../../../../core/utils/check_desktop_size.dart';
import '../../../../core/utils/check_theme_status.dart';
import '../../../../core/widgets/app_scaffold.dart';
import '../../../../core/widgets/app_space.dart';
import '../../../../core/widgets/buttons/app_button.dart';
import '../../../../core/widgets/buttons/app_text_button.dart';
import '../../../../core/widgets/lists/app_single_child_scroll_view.dart';
import '../../../../core/widgets/transparent_app_bar.dart';
import '../../../../core/widgets/typography/app_title_large_text.dart';
import '../../data/models/resend_otp_params.dart';
import '../../data/models/verify_otp_params.dart';
import '../bloc/authentication_cubit.dart';
import '../bloc/resend_otp_cubit.dart';
import '../widgets/app_pin_input.dart';
import '../widgets/auth_illustration.dart';
import 'package:pinput/pinput.dart';

class OtpVerificationScreen extends StatelessWidget {
  const OtpVerificationScreen({
    super.key,
    required this.email,
    required this.otpVerificationType,
  });

  final String email;
  final OTPVerificationType otpVerificationType;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ResendOtpCubit>(
      create: (context) => ResendOtpCubit(),
      child: _OtpVerificationScreen(
        email: email,
        otpVerificationType: otpVerificationType,
      ),
    );
  }
}

class _OtpVerificationScreen extends StatefulWidget {
  const _OtpVerificationScreen({
    required this.email,
    required this.otpVerificationType,
  });

  final String email;
  final OTPVerificationType otpVerificationType;

  @override
  State<_OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<_OtpVerificationScreen> {
  TextEditingController codeTextEditingController = TextEditingController();

  @override
  void initState() {
    context.read<ResendOtpCubit>().setResendCodeTime();
    super.initState();
  }

  @override
  void dispose() {
    codeTextEditingController.dispose();
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
                children: [
                  AppVSpace(
                    space:
                        checkVerySmallDeviceSize(context)
                            ? Dimens.padding
                            : Dimens.largePadding,
                  ),
                  Column(
                    spacing: Dimens.largePadding,
                    children: [
                      AppVSpace(),
                      AuthIllustration(),
                      AppTitleLargeText(t.verifyOtp),
                      const AppVSpace(),
                      Text(
                        t.verifyOtpDec,
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
                  AppVSpace(space: Dimens.padding),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: Dimens.largePadding,
                      ),
                      child: AppPinInput(
                        controller: codeTextEditingController,
                        focusNode: FocusNode(),
                      ),
                    ),
                  ),
                  BlocBuilder<ResendOtpCubit, ResendOtpState>(
                    builder: (context, state) {
                      return Column(
                        children: [
                          if (state.timeCounter != 0)
                            AppVSpace(space: Dimens.largePadding),
                          if (state.timeCounter == 0)
                            AppTextButton(
                              title: t.resendOtpCode,
                              onPressed: resendOtpCode,
                            )
                          else
                            Text(
                              '${formatDuration(state.timeCounter)} ${t.remainTimeOtp}',
                              style: TextStyle(
                                color:
                                    checkDarkMode(context)
                                        ? AppColors.descriptionColor
                                        : null,
                              ),
                            ),
                        ],
                      );
                    },
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
          isLoading: watch.state.verifyOTPStatus == Status.loading,
          borderRadius: Dimens.corners,
        ),
      ),
    );
  }

  String formatDuration(final int totalSeconds) {
    final minutes = totalSeconds ~/ 60; // Integer division for minutes
    final seconds = totalSeconds % 60; // Remainder for seconds
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  void resendOtpCode() {
    codeTextEditingController.clear();
    context.read<ResendOtpCubit>().setResendCodeTime();
    final read = context.read<AuthenticationCubit>();
    read.resendOtp(
      resendOTPParams: ResendOTPParams(
        otpVerificationType: widget.otpVerificationType,
        email: widget.email,
      ),
      onSuccess: () {
        showSnackBar(t.OTPResendSuccessful, snackBarType: SnackBarType.success);
      },
    );
  }

  void onSubmit() {
    if (codeTextEditingController.length == 6) {
      if (widget.otpVerificationType == OTPVerificationType.forgotPassword) {
        context.pushNamed(
          GoRoutesPath.createNewPassword,
          extra: {
            'email': widget.email,
            'code': codeTextEditingController.text.trim(),
          },
        );
      } else {
        final read = context.read<AuthenticationCubit>();
        read.verifyOTP(
          params: VerifyOTPParams(
            otpVerificationType: widget.otpVerificationType,
            email: widget.email,
            code: codeTextEditingController.text.trim(),
          ),
          onSuccess: () {
            context.goNamed(GoRoutesPath.home);
          },
        );
      }
    }
  }
}
