import 'package:flutter/material.dart';
import '../../../../core/localization/i18n/translations.g.dart';
import '../../../../core/widgets/app_scaffold.dart';
import '../../../../core/widgets/app_space.dart';
import '../../../../core/widgets/typography/app_title_large_text.dart';

class NotFoundScreen extends StatelessWidget {
  const NotFoundScreen({super.key});

  @override
  Widget build(final BuildContext context) {
    return AppScaffold(
      smallBody: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [const AppVSpace(), AppTitleLargeText(t.notFound)],
        ),
      ),
    );
  }
}
