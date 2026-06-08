import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:rizz/features/planner/date_vibe.dart';
import 'package:rizz/features/planner/planner_notifier.dart';
import 'package:rizz/gen/colors.gen.dart';
import 'package:rizz/generated/locale_keys.g.dart';

import 'planner_card.dart';

class VibeCard extends StatelessWidget {
  const VibeCard({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedVibe = context.watch<PlannerNotifier>().vibe;

    return PlannerCard(
      label: '✨ ${LocaleKeys.date_planner_page_vibe_title.tr()}',
      child: Wrap(
        spacing: 8,
        runSpacing: 8,
        children: DateVibe.values.map((vibe) {
          final isActive = vibe == selectedVibe;
          return GestureDetector(
            onTap: () => context.read<PlannerNotifier>().setVibe(vibe),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
              decoration: BoxDecoration(
                color: isActive
                    ? ColorName.purpleChip.withValues(alpha: 0.25)
                    : Colors.white.withValues(alpha: 0.04),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: isActive
                      ? ColorName.purpleChip.withValues(alpha: 0.6)
                      : ColorName.cardBorder.withValues(alpha: 0.4),
                  width: 0.5,
                ),
              ),
              child: Text(
                vibe.label,
                style: GoogleFonts.dmSans(
                  fontSize: 12,
                  color: isActive
                      ? ColorName.purpleTextActive
                      : ColorName.purpleTextMuted,
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
