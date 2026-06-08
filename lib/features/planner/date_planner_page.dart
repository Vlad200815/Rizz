import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rizz/features/planner/widgets/widgets.dart';
import 'package:rizz/gen/colors.gen.dart';
import 'package:rizz/generated/locale_keys.g.dart';

class DatePlannerPage extends StatelessWidget {
  const DatePlannerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              ColorName.purpleBackgroundStart,
              ColorName.purpleBackgroundEnd,
              ColorName.purpleBackgroundDeep,
            ],
            stops: [0.0, 0.5, 1.0],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(context),
                const SizedBox(height: 20),
                const DateTimeCard(),
                const SizedBox(height: 12),
                const PlaceCard(),
                const SizedBox(height: 12),
                const VibeCard(),
                const SizedBox(height: 12),
                const NoteCard(),
                const SizedBox(height: 24),
                const CalendarButton(),
                const SizedBox(height: 24),
                const SendButton(),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
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
