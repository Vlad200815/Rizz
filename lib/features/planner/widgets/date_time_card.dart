import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:rizz/features/planner/planner_notifier.dart';
import 'package:rizz/gen/colors.gen.dart';
import 'package:rizz/generated/locale_keys.g.dart';
import 'package:rizz/utils/formatters.dart';

import 'planner_card.dart';

class DateTimeCard extends StatelessWidget {
  const DateTimeCard({super.key});

  @override
  Widget build(BuildContext context) {
    final notifier = context.watch<PlannerNotifier>();

    return PlannerCard(
      label: '📅 ${LocaleKeys.date_planner_page_when_title.tr()}',
      child: Row(
        children: [
          _chip(
            context,
            icon: Icons.calendar_today_rounded,
            text: notifier.selectedDate != null
                ? Formatters.date(notifier.selectedDate!)
                : LocaleKeys.date_planner_page_pick_date_text.tr(),
            onTap: () async {
              final picked = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime.now(),
                lastDate: DateTime.now().add(const Duration(days: 365)),
                builder: (context, child) => _datePickerTheme(context, child),
              );
              if (picked != null && context.mounted) {
                context.read<PlannerNotifier>().setDate(picked);
              }
            },
          ),
          const SizedBox(width: 8),
          _chip(
            context,
            icon: Icons.access_time_rounded,
            text: notifier.selectedTime != null
                ? notifier.selectedTime!.format(context)
                : LocaleKeys.date_planner_page_pick_time_text.tr(),
            onTap: () async {
              final picked = await showTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
                builder: (context, child) => _datePickerTheme(context, child),
              );
              if (picked != null && context.mounted) {
                context.read<PlannerNotifier>().setTime(picked);
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _chip(
    BuildContext context, {
    required IconData icon,
    required String text,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: ColorName.purpleChip.withValues(alpha: 0.15),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: ColorName.purpleChip.withValues(alpha: 0.4),
            width: 0.5,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 14, color: ColorName.chipActive),
            const SizedBox(width: 6),
            Text(
              text,
              style: GoogleFonts.dmSans(
                fontSize: 13,
                color: ColorName.chipActive,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _datePickerTheme(BuildContext context, Widget? child) {
    return Theme(
      data: Theme.of(context).copyWith(
        colorScheme: const ColorScheme.dark(
          primary: ColorName.purpleAccent,
          onPrimary: Colors.white,
          surface: ColorName.purpleBackgroundEnd,
          onSurface: ColorName.purpleTextPrimary,
        ),
      ),
      child: child!,
    );
  }
}
