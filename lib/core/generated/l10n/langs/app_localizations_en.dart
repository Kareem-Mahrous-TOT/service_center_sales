import 'app_localizations.dart';

/// The translations for English (`en`).
class AppLangEn extends AppLang {
  AppLangEn([String locale = 'en']) : super(locale);

  @override
  String get somethingWentWrongMsg => 'Sorry, something went wrong!';

  @override
  String get availableDates => 'Available Dates';
}
