import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Future<DateTime?> appDatePickerDialog({
  required BuildContext context,
  required DateTime initialDate,
  DateTime? firstDate,
  DateTime? lastDate,
  DatePickerEntryMode initialEntryMode = DatePickerEntryMode.calendar,
  String? helpText,
  String? cancelText,
  String? confirmText,
  Locale? locale,
  bool useRootNavigator = true,
  RouteSettings? routeSettings,
  TextDirection? textDirection,
  TransitionBuilder? builder,
  DatePickerMode initialDatePickerMode = DatePickerMode.day,
  String? errorFormatText,
  String? errorInvalidText,
  String? fieldHintText,
  String? fieldLabelText,
}) async {
  final ThemeData theme = Theme.of(context);
  final bool isDarkMode = theme.brightness == Brightness.dark;

  return await showDatePicker(
    context: context,
    initialDate: initialDate,
    firstDate: firstDate ?? DateTime(1900),
    lastDate: lastDate ?? DateTime.now(),
    initialEntryMode: initialEntryMode,
    helpText: helpText ?? 'Select date',
    cancelText: cancelText ?? 'Cancel',
    confirmText: confirmText ?? 'OK',
    locale: locale,
    useRootNavigator: useRootNavigator,
    routeSettings: routeSettings,
    initialDatePickerMode: initialDatePickerMode,
    builder:
        builder ??
        (BuildContext context, Widget? child) {
          return Theme(
            data: theme.copyWith(
              colorScheme: theme.colorScheme.copyWith(
                primary: theme.colorScheme.primary,
                onPrimary: theme.colorScheme.onPrimary,
                surface: isDarkMode ? Colors.grey[900] : Colors.white,
                onSurface: isDarkMode ? Colors.white : Colors.black,
              ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  foregroundColor: theme.colorScheme.primary,
                ),
              ),
            ),
            child: child!,
          );
        },
    errorFormatText: errorFormatText ?? 'Invalid format',
    errorInvalidText: errorInvalidText ?? 'Date out of range',
    fieldHintText: fieldHintText ?? 'MM/DD/YYYY',
    fieldLabelText: fieldLabelText ?? 'Date',
  );
}
