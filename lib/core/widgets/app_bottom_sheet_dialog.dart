import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/localization/i18n/translations.g.dart';
import '../../core/theme/colors.dart';
import '../../core/theme/dimens.dart';
import '../../core/utils/check_theme_status.dart';
import '../../core/widgets/app_divider.dart';
import '../../core/widgets/app_space.dart';
import '../../core/widgets/app_timer.dart';
import '../../core/widgets/buttons/app_text_button.dart';
import '../../core/widgets/lists/app_single_child_scroll_view.dart';

Future<void> appModalBottomSheetDialog(
  final BuildContext context,
  final String? title,
  final String? message, {
  final WidgetBuilder? builder,
  final Widget? child,
  final bool isDismiss = true,
  final bool enableDrag = true,
  final bool showDragHandle = true,
  final bool showCloseIcon = false,
  final bool isScrollControlled = true,
  final bool useSafeArea = false,
  final EdgeInsets? padding,

  /// use this flag for show snack bar in front of bottom sheet,
  final bool useGlobalScaffold = true,

  /// use this flag for config height of bottom sheet on local scaffold mode,
  /// when keyboard is open
  final double maxHeightRatio = 0.82,

  /// use this flag for config height of bottom sheet on local scaffold mode,
  /// when keyboard is close
  final double initialHeightRatio = 0.57,
  final double? initialHeight,
}) async {
  Widget globalScaffoldBuilder(final BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        left: Dimens.largePadding,
        right: Dimens.largePadding,
      ),
      child: AppModalBottomSheetDialogHeader(
        title,
        message,
        showCloseIcon: showCloseIcon,
        padding: padding,
        child: child,
      ),
    );
  }

  Widget localScaffoldBuilder(final BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenHeight = mediaQuery.size.height;
    final bottomPadding = mediaQuery.viewInsets.bottom;
    return ClipRRect(
      borderRadius: BorderRadius.circular(Dimens.corners),
      child: AnimatedContainer(
        constraints: BoxConstraints(
          maxHeight:
              initialHeight ??
              (bottomPadding > 0
                  ? screenHeight * maxHeightRatio
                  : screenHeight * initialHeightRatio),
        ),
        duration: const Duration(milliseconds: 100),
        child: Scaffold(
          body: AppModalBottomSheetDialogHeader(
            title,
            message,
            showCloseIcon: showCloseIcon,
            padding: padding,
            child: child,
          ),
        ),
      ),
    );
  }

  await showModalBottomSheet<void>(
    showDragHandle: showDragHandle,
    context: context,
    constraints: const BoxConstraints(maxWidth: 640),
    isDismissible: isDismiss,
    enableDrag: enableDrag,
    useSafeArea: useSafeArea,
    backgroundColor:
        checkDarkMode(context) ? AppColors.textFieldBackgroundColorDark : null,
    isScrollControlled: isScrollControlled,
    builder:
        builder ??
        (useGlobalScaffold ? globalScaffoldBuilder : localScaffoldBuilder),
  );
}

class AppModalBottomSheetDialogHeader extends StatelessWidget {
  const AppModalBottomSheetDialogHeader(
    this.title,
    this.message, {
    super.key,
    this.child,
    this.padding,
    this.showCloseIcon = false,
    this.sCtl,
    this.isCenter = false,
  });

  final String? title;
  final String? message;
  final Widget? child;
  final EdgeInsets? padding;
  final bool showCloseIcon;
  final bool isCenter;
  final ScrollController? sCtl;

  @override
  Widget build(final BuildContext context) {
    return Padding(
      padding:
          padding ??
          const EdgeInsets.symmetric(horizontal: Dimens.largePadding),
      child: AppSingleChildScrollView(
        controller: sCtl,
        physics: const ScrollPhysics(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment:
              isCenter ? CrossAxisAlignment.center : CrossAxisAlignment.start,
          children: [
            if (showCloseIcon) ...[
              const AppVSpace(),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const AppCircleCloseBtn(),
                      if (title != null && title != '')
                        Text(title!, style: const TextStyle(fontSize: 20)),
                      const SizedBox(width: 50.0),
                    ],
                  ),
                  const AppVSpace(),
                  AppDivider(),
                  if (message != null && message != '')
                    Padding(
                      padding: const EdgeInsets.only(
                        bottom: Dimens.mediumPadding,
                        top: Dimens.mediumPadding,
                      ),
                      child: Text(
                        message!,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                ],
              ),
            ] else
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (title != null && title != '')
                    Text(title!, style: const TextStyle(fontSize: 20)),
                  const AppVSpace(),
                  AppDivider(),
                  if (message != null && message != '')
                    Padding(
                      padding: const EdgeInsets.only(
                        bottom: Dimens.mediumPadding,
                        top: Dimens.mediumPadding,
                      ),
                      child: Text(
                        message!,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                ],
              ),
            child ?? const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}

Future<void> appConfirmModalBottomSheetDialog(
  final BuildContext context,
  final String title,
  final String? message, {
  final GestureTapCallback? confirmOnTap,
  final String? confirmTxt,
  final String? closeTxt,
  final Duration? timerDuration,
}) async {
  await appModalBottomSheetDialog(
    context,
    title,
    message,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        if (timerDuration != null)
          AppTimer(duration: timerDuration)
        else
          confirmTxt != null
              ? AppTextButton(onPressed: confirmOnTap, title: confirmTxt)
              : const SizedBox(),
        AppTextButton(
          onPressed: () {
            context.pop();
          },
          title: closeTxt ?? t.cancel,
        ),
      ],
    ),
  );
}

class AppCircleCloseBtn extends StatelessWidget {
  const AppCircleCloseBtn({super.key});

  @override
  Widget build(final BuildContext context) {
    return IconButton(
      onPressed: () {
        context.pop();
      },
      icon: Icon(Icons.close),
    );
  }
}
