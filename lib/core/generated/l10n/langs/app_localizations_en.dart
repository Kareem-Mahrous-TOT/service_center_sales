import 'app_localizations.dart';

/// The translations for English (`en`).
class AppLangEn extends AppLang {
  AppLangEn([String locale = 'en']) : super(locale);

  @override
  String get somethingWentWrongMsg => 'Sorry, something went wrong!';

  @override
  String get availableDates => 'Available Dates';

  @override
  String get appointmentCreatedSuccessfullyMsg => 'Appointment Created Successfully';

  @override
  String get subscriptionCreatedSuccessfullyMsg => 'Subscription Created Successfully';

  @override
  String get subscribe => 'Subscribe';

  @override
  String get login => 'Login';

  @override
  String get register => 'Register';

  @override
  String get name => 'Name';

  @override
  String get email => 'Email';

  @override
  String get city => 'City';

  @override
  String get status => 'Status';

  @override
  String get lead => 'Lead';

  @override
  String get leads => 'Leads';

  @override
  String get cancelled => 'Cancelled';

  @override
  String get customer => 'Customer';

  @override
  String get submit => 'Submit';
}
