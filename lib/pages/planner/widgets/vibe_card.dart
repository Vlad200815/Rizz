import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:rizz/data_notifier/date_notifier.dart';
import 'package:rizz/generated/locale_keys.g.dart';

import 'planner_card.dart';

class VibeCard extends StatelessWidget {
  const VibeCard({super.key});

  static final _vibes = [
    LocaleKeys.date_planner_page_vibes_romantic_tab.tr(),
    LocaleKeys.date_planner_page_vibes_casual_tab.tr(),
    LocaleKeys.date_planner_page_vibes_adventure_tab.tr(),
    LocaleKeys.date_planner_page_vibes_surprise_me_tab.tr(),
  ];

  @override
  Widget build(BuildContext context) {
    final selectedVibe = context.watch<DateNotifier>().vibe;

    return PlannerCard(
      label: '✨ ${LocaleKeys.date_planner_page_vibe_title.tr()}',
      child: Wrap(
        spacing: 8,
        runSpacing: 8,
        children: _vibes.map((vibe) {
          final isActive = vibe == selectedVibe;
          return GestureDetector(
            onTap: () => context.read<DateNotifier>().setVibe(vibe),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
              decoration: BoxDecoration(
                color: isActive
                    ? const Color(0xFFA050C8).withOpacity(0.25)
                    : Colors.white.withOpacity(0.04),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: isActive
                      ? const Color(0xFFA050C8).withOpacity(0.6)
                      : const Color(0xFF3A1A5A).withOpacity(0.4),
                  width: 0.5,
                ),
              ),
              child: Text(
                vibe,
                style: GoogleFonts.dmSans(
                  fontSize: 12,
                  color: isActive
                      ? const Color(0xFFD8A8F0)
                      : const Color(0xFF9060B0),
                  fontWeight: isActive ? FontWeight.w500 : FontWeight.w400,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
