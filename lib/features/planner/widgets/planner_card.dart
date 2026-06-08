import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rizz/gen/colors.gen.dart';

class PlannerCard extends StatelessWidget {
  final String label;
  final Widget child;

  const PlannerCard({super.key, required this.label, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.04),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: ColorName.cardBorder.withValues(alpha: 0.4),
          width: 0.5,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: GoogleFonts.dmSans(
              fontSize: 10,
              color: ColorName.purpleTextMuted,
              letterSpacing: 0.1,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 10),
          child,
        ],
      ),
    );
  }
}
