import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart' hide Theme;
import 'package:rizz/config.dart';
import 'package:rizz/pages/planner/date_planner_page.dart';
import 'package:rizz/pages/request/date_request_page.dart';
import 'package:rizz/theme/theme.dart';

class RizzApp extends StatelessWidget {
  const RizzApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      title: Config.APP_TITLE,
      theme: Theme.dark,
      initialRoute: Config.DATE_REQUEST_PAGE_ROUTE,
      routes: {
        Config.DATE_REQUEST_PAGE_ROUTE: (context) => const DateRequestPage(),
        Config.DATE_PLANNER_PAGE_ROUTE: (context) => const DatePlannerPage(),
      },
    );
  }
}
