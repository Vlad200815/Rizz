import 'package:easy_localization/easy_localization.dart';
import 'package:rizz/generated/locale_keys.g.dart';

enum DateVibe {
  romantic(LocaleKeys.date_planner_page_vibes_romantic_tab),
  casual(LocaleKeys.date_planner_page_vibes_casual_tab),
  adventure(LocaleKeys.date_planner_page_vibes_adventure_tab),
  surprise(LocaleKeys.date_planner_page_vibes_surprise_me_tab);

  const DateVibe(this.localeKey);

  final String localeKey;

  /// Localized label, resolved against the current locale on each access.
  String get label => localeKey.tr();
}
