import 'package:flutter/material.dart';
import '../../../../../core/localization/i18n/translations.g.dart';
import '../../../../../core/widgets/app_scaffold.dart';

class ExploreTab extends StatelessWidget {
  const ExploreTab({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      showPageGradient: true,
      padding: EdgeInsets.zero,
      smallBody: Center(
        child: Text(t.explore),
      )
    );
  }
}
