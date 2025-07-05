import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../core/gen/assets.gen.dart';
import '../../core/theme/dimens.dart';
import '../../core/utils/check_desktop_size.dart';
import '../../core/utils/check_theme_status.dart';
import '../../core/utils/sized_context.dart';
import '../../core/widgets/lists/app_list_view.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({
    super.key,
    this.scaffoldKey,
    this.appBar,
    this.body,
    this.secondaryBody,
    this.smallBody,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.floatingActionButtonAnimator,
    this.onDrawerChanged,
    this.endDrawer,
    this.onEndDrawerChanged,
    this.bottomNavigationBar,
    this.bottomSheet,
    this.resizeToAvoidBottomInset,
    this.drawerDragStartBehavior = DragStartBehavior.start,
    this.bodyFlex = 2,
    this.secondaryBodyFlex = 1,
    this.safeAreaLeft = true,
    this.safeAreaTop = true,
    this.safeAreaRight = true,
    this.safeAreaBottom = true,
    this.safeAreaMinimum = EdgeInsets.zero,
    this.safeAreaMaintainBottomViewPadding = false,
    this.padding,
    this.extendBody = false,
    this.extendBodyBehindAppBar = false,
    this.backgroundColor,
    this.alignment = Alignment.center,
    this.hasBottomSheetPadding = true,
    this.showPageGradient = false,
  });

  final PreferredSizeWidget? appBar;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final FloatingActionButtonAnimator? floatingActionButtonAnimator;
  final DrawerCallback? onDrawerChanged;
  final Widget? endDrawer;
  final DrawerCallback? onEndDrawerChanged;
  final Widget? bottomNavigationBar;
  final Widget? bottomSheet;
  final bool? resizeToAvoidBottomInset;
  final DragStartBehavior drawerDragStartBehavior;
  final Widget? body;
  final Widget? secondaryBody;
  final Widget? smallBody;
  final int bodyFlex;
  final int secondaryBodyFlex;
  final bool safeAreaLeft;
  final bool safeAreaTop;
  final bool safeAreaRight;
  final bool safeAreaBottom;
  final EdgeInsets safeAreaMinimum;
  final bool safeAreaMaintainBottomViewPadding;
  final EdgeInsets? padding;
  final bool extendBody;
  final bool extendBodyBehindAppBar;
  final Key? scaffoldKey;
  final Color? backgroundColor;
  final Alignment alignment;
  final bool hasBottomSheetPadding;
  final bool showPageGradient;

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: appBar,
      backgroundColor: backgroundColor,
      body:
          showPageGradient
              ? Stack(
                alignment: Alignment.topCenter,
                children: [
                  if (checkDarkMode(context))
                    Positioned(
                      top: 0,
                      child: SizedBox(
                        width:
                            checkMediumDeviceSize(context)
                                ? Dimens.mediumDeviceBreakPoint
                                : context.widthPx,
                        child: Opacity(
                          opacity: checkDarkMode(context) ? 1.0 : 0.6,
                          child: Assets.images.pageGradient.image(
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      ),
                    ),
                  responsiveBody(context),
                ],
              )
              : responsiveBody(context),
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: floatingActionButtonLocation,
      floatingActionButtonAnimator: floatingActionButtonAnimator,
      onDrawerChanged: onDrawerChanged,
      endDrawer: endDrawer,
      onEndDrawerChanged: onEndDrawerChanged,
      bottomNavigationBar: bottomNavigationBar,
      bottomSheet:
          bottomSheet == null
              ? null
              : Padding(
                padding:
                    hasBottomSheetPadding
                        ? const EdgeInsets.all(Dimens.largePadding)
                        : EdgeInsets.zero,
                child: bottomSheet,
              ),
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      drawerDragStartBehavior: drawerDragStartBehavior,
      extendBodyBehindAppBar: extendBodyBehindAppBar,
      extendBody: extendBody,
    );
  }

  Widget responsiveBody(final BuildContext context) => SafeArea(
    left: safeAreaLeft,
    top: safeAreaTop,
    right: safeAreaRight,
    bottom: safeAreaBottom,
    minimum: safeAreaMinimum,
    maintainBottomViewPadding: safeAreaMaintainBottomViewPadding,
    child: Padding(
      padding:
          padding ??
          EdgeInsets.symmetric(
            horizontal:
                checkVerySmallDeviceSize(context)
                    ? Dimens.padding
                    : Dimens.largePadding,
          ),
      child:
          smallBody != null
              ? (checkDesktopSize(context)
                  ? Align(
                    alignment: alignment,
                    child: SizedBox(
                      width: Dimens.mediumDeviceBreakPoint,
                      child: smallBody,
                    ),
                  )
                  : smallBody)
              : checkDesktopSize(context)
              ? Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    flex: bodyFlex,
                    child: body ?? const SizedBox.shrink(),
                  ),
                  if (secondaryBody == null)
                    const SizedBox.shrink()
                  else
                    Expanded(flex: secondaryBodyFlex, child: secondaryBody!),
                ],
              )
              : secondaryBody == null
              ? body ?? const SizedBox.shrink()
              : AppListView(
                shrinkWrap: true,
                children: [
                  body ?? const SizedBox.shrink(),
                  secondaryBody ?? const SizedBox.shrink(),
                ],
              ),
    ),
  );
}
