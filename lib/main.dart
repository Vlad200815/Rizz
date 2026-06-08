import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:rizz/app.dart';
import 'package:rizz/config.dart';
import 'package:rizz/features/planner/planner_notifier.dart';
import 'package:rizz/features/request/no_button_notifier.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// Init Localization
  await EasyLocalization.ensureInitialized();

  /// Setup orientation
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(
    // Providers
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NoButtonNotifier()),
        ChangeNotifierProvider(create: (_) => PlannerNotifier()),
      ],

      child: EasyLocalization(
        supportedLocales: [Locale(Config.en), Locale(Config.uk)],
        path: 'assets/translations',
        fallbackLocale: Locale(Config.en),
        child: const RizzApp(),
      ),
    ),
  );
}
