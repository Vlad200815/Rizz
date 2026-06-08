import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:rizz/features/planner/planner_notifier.dart';
import 'package:rizz/gen/colors.gen.dart';
import 'package:rizz/generated/locale_keys.g.dart';

class SendButton extends StatelessWidget {
  const SendButton({super.key});

  @override
  Widget build(BuildContext context) {
    final notifier = context.watch<PlannerNotifier>();
    final canSend = notifier.canSend;

    return GestureDetector(
      onTap: canSend ? notifier.sendToTelegram : null,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: canSend
                ? [ColorName.purpleAccent, ColorName.purpleAccentDark]
                : [ColorName.purpleDisabledStart, ColorName.purpleDisabledEnd],
          ),
          borderRadius: BorderRadius.circular(28),
          boxShadow: canSend
              ? [
                  BoxShadow(
                    color: ColorName.purpleAccent.withValues(alpha: 0.4),
                    blurRadius: 24,
                    offset: const Offset(0, 6),
                  ),
                ]
              : [],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.send_rounded, color: Colors.white, size: 18),
            const SizedBox(width: 10),
            Text(
              LocaleKeys.date_planner_page_send_via_telegram_button.tr(),
              style: GoogleFonts.dmSans(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: canSend
                    ? Colors.white
                    : Colors.white.withValues(alpha: 0.4),
                letterSpacing: 0.04,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
