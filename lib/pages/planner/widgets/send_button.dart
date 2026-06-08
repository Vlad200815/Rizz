import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:rizz/config.dart' as config;
import 'package:rizz/data_notifier/date_notifier.dart';
import 'package:rizz/generated/locale_keys.g.dart';
import 'package:url_launcher/url_launcher.dart';

class SendButton extends StatelessWidget {
  const SendButton({super.key});

  @override
  Widget build(BuildContext context) {
    final notifier = context.watch<DateNotifier>();
    final canSend = notifier.canSend;

    return GestureDetector(
      onTap: canSend ? () => _sendToTelegram(notifier) : null,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: canSend
                ? [const Color(0xFF8040C0), const Color(0xFF6020A0)]
                : [const Color(0xFF3A2A4A), const Color(0xFF2A1A3A)],
          ),
          borderRadius: BorderRadius.circular(28),
          boxShadow: canSend
              ? [
                  BoxShadow(
                    color: const Color(0xFF8040C0).withOpacity(0.4),
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
                color: canSend ? Colors.white : Colors.white.withOpacity(0.4),
                letterSpacing: 0.04,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _sendToTelegram(DateNotifier notifier) async {
    final message = Uri.encodeComponent(notifier.buildTelegramMessage());
    final url = Uri.parse(
      'https://t.me/${config.Config.TELEGRAM_USERNAME}?text=$message',
    );
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    }
  }
}
