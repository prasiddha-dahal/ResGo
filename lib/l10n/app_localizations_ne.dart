// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Nepali (`ne`).
class AppLocalizationsNe extends AppLocalizations {
  AppLocalizationsNe([String locale = 'ne']) : super(locale);

  @override
  String get welcomeBack => 'फेरि स्वागत छ';

  @override
  String get loginSubtitle => 'किनमेल जारी राख्न लगइन गर्नुहोस्';

  @override
  String get email => 'इमेल';

  @override
  String get emailHint => 'आफ्नो इमेल लेख्नुहोस्';

  @override
  String get password => 'पासवर्ड';

  @override
  String get passwordHint => 'आफ्नो पासवर्ड लेख्नुहोस्';

  @override
  String get login => 'लगइन';

  @override
  String get noAccount => 'खाता छैन?';

  @override
  String get register => 'दर्ता गर्नुहोस्';

  @override
  String get emailRequired => 'इमेल आवश्यक छ';

  @override
  String get emailInvalid => 'मान्य इमेल लेख्नुहोस्';

  @override
  String get passwordRequired => 'पासवर्ड आवश्यक छ';

  @override
  String get passwordMinLength => 'पासवर्ड कम्तीमा ६ अक्षरको हुनुपर्छ';
}
