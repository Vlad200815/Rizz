import "package:easy_localization/easy_localization.dart";
import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import "package:rizz/gen/colors.gen.dart";
import "package:rizz/generated/locale_keys.g.dart";

class HeaderItem extends StatelessWidget {
  const HeaderItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.06),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: ColorName.cardBorder.withValues(alpha: 0.5),
                width: 0.5,
              ),
            ),
            child: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: ColorName.chipActive,
              size: 16,
            ),
          ),
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              LocaleKeys.date_planner_page_header_title.tr(),
              style: GoogleFonts.playfairDisplay(
                fontSize: 22,
                color: ColorName.purpleTextPrimary,
              ),
            ),
            Text(
              LocaleKeys.date_planner_page_header_subtitle.tr(),
              style: GoogleFonts.dmSans(
                fontSize: 11,
                color: ColorName.purpleTextMuted,
                letterSpacing: 0.08,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
