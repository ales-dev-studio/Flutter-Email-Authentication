import 'package:flutter/material.dart';

import '../../../../core/gen/assets.gen.dart';
import '../../../../core/localization/i18n/translations.g.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/dimens.dart';
import '../../../../core/widgets/app_svg_viewer.dart';
import '../../../../core/widgets/user_profile_image.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: MediaQuery.of(context).viewPadding.top),
      decoration: BoxDecoration(
        color: AppColors.headerColor.withValues(alpha: 0.9),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(Dimens.corners * 2),
          bottomRight: Radius.circular(Dimens.corners * 2),
        ),
      ),
      child: Column(
        spacing: Dimens.largePadding,
        children: [
          ListTile(
            leading: UserProfileImage(
              defaultIconPadding: 2,
              width: 45,
              height: 45,
              hasBorder: false,
            ),
            title: Padding(
              padding: const EdgeInsets.symmetric(horizontal: Dimens.padding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(t.welcome),
                  Text(
                    'Ales Dev',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            trailing: InkWell(
              onTap: () {},
              borderRadius: BorderRadius.circular(Dimens.corners),
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: AppColors.descriptionColor.withValues(alpha: 0.3),
                  borderRadius: BorderRadius.circular(Dimens.corners),
                ),
                padding: EdgeInsets.all(Dimens.padding),
                child: AppSvgViewer(
                  Assets.icons.bell,
                  color: AppColors.whiteColor,
                  setDefaultColor: false,
                ),
              ),
            ),
          ),
          SizedBox.shrink(),
          SizedBox.shrink(),
        ],
      ),
    );
  }
}
