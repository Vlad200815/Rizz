import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:rizz/config.dart';
import 'package:rizz/features/planner/date_planner_page.dart';
import 'package:rizz/features/request/date_request_page.dart';

import 'resource/app_theme.dart';

class RizzApp extends StatelessWidget {
  const RizzApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      title: Config.appTitle,
      theme: AppTheme.dark,
      initialRoute: Config.dateRequestPageRoute,
      routes: {
        Config.dateRequestPageRoute: (context) => const DateRequestPage(),
        Config.datePlannerPageRoute: (context) => const DatePlannerPage(),
      },
    );
  }
}
