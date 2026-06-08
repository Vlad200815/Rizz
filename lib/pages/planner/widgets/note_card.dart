import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:rizz/data_notifier/date_notifier.dart';
import 'package:rizz/generated/locale_keys.g.dart';

import 'planner_card.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({super.key});

  @override
  Widget build(BuildContext context) {
    return PlannerCard(
      label: '💌 ${LocaleKeys.date_planner_page_note_title.tr()}',
      child: TextFormField(
        onChanged: context.read<DateNotifier>().setNote,
        maxLines: 3,
        style: GoogleFonts.dmSans(fontSize: 13, color: const Color(0xFFE8D0F0)),
        decoration: InputDecoration(
          hintText: LocaleKeys.date_planner_page_note_hint_text.tr(),
          hintStyle: GoogleFonts.dmSans(
            fontSize: 13,
            color: const Color(0xFF9060B0),
            fontStyle: FontStyle.italic,
          ),
          filled: true,
          fillColor: Colors.white.withOpacity(0.03),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: const Color(0xFF3A1A5A).withOpacity(0.5),
              width: 0.5,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: const Color(0xFF3A1A5A).withOpacity(0.5),
              width: 0.5,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Color(0xFF8040C0), width: 1),
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 14,
            vertical: 12,
          ),
        ),
      ),
    );
  }
}
