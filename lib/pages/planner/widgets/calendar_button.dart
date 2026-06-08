import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:rizz/data_notifier/date_notifier.dart';
import 'package:rizz/generated/locale_keys.g.dart';

class CalendarButton extends StatelessWidget {
  const CalendarButton({super.key});

  @override
  Widget build(BuildContext context) {
    final canAdd = context.watch<DateNotifier>().canSend;

    return GestureDetector(
      onTap: canAdd
          ? () async {
              await context.read<DateNotifier>().addToCalendar();
              if (context.mounted) _showSnackbar(context);
            }
          : null,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.04),
          borderRadius: BorderRadius.circular(28),
          border: Border.all(
            color: canAdd
                ? const Color(0xFF8040C0).withOpacity(0.5)
                : const Color(0xFF3A1A5A).withOpacity(0.3),
            width: 0.5,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.calendar_month_rounded,
              size: 18,
              color: canAdd
                  ? const Color(0xFFD0A0F0)
                  : const Color(0xFF9060B0).withOpacity(0.4),
            ),
            const SizedBox(width: 10),
            Text(
              LocaleKeys.date_planner_page_add_to_calendar_button.tr(),
              style: GoogleFonts.dmSans(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: canAdd
                    ? const Color(0xFFD0A0F0)
                    : const Color(0xFF9060B0).withOpacity(0.4),
                letterSpacing: 0.04,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Text('📅 ', style: TextStyle(fontSize: 16)),
            Text(
              LocaleKeys.date_planner_page_open_calendar_message.tr(),
              style: GoogleFonts.dmSans(color: Colors.white),
            ),
          ],
        ),
        backgroundColor: const Color(0xFF2A1A4A),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
