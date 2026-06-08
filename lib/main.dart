import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:rizz/app.dart';
import 'package:rizz/data_notifier/date_notifier.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// Init Localization
  await EasyLocalization.ensureInitialized();

  /// Setup orientation
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(
    ChangeNotifierProvider(
      create: (_) => DateNotifier(),
      child: EasyLocalization(
        supportedLocales: [Locale('en'), Locale('uk')],
        path: 'assets/translations',
        fallbackLocale: Locale('en', 'US'),
        child: const RizzApp(),
      ),
    ),
  );
}
