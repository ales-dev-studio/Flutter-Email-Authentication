import 'package:flutter/material.dart';
import '../../../../../core/localization/i18n/translations.g.dart';
import '../../../../../core/widgets/app_scaffold.dart';

class TicketsTab extends StatelessWidget {
  const TicketsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      showPageGradient: true,
      padding: EdgeInsets.zero,
      smallBody: Center(child: Text(t.tickets)),
    );
  }
}
