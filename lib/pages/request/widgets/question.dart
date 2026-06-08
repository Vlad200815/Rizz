import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rizz/generated/locale_keys.g.dart';

class Question extends StatelessWidget {
  const Question({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Text(
        LocaleKeys.date_request_page_main_offer.tr(),
        textAlign: TextAlign.center,
        style: GoogleFonts.playfairDisplay(
          fontSize: 28,
          fontStyle: FontStyle.italic,
          color: const Color(0xFFF5D0D8),
          height: 1.4,
          letterSpacing: 0.01,
        ),
      ),
    );
  }
}
