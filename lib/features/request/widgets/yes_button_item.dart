import "package:easy_localization/easy_localization.dart";
import "package:flutter/material.dart";
import "package:rizz/config.dart";
import "package:rizz/gen/colors.gen.dart";
import "package:rizz/generated/locale_keys.g.dart";

class YesButtonItem extends StatelessWidget {
  const YesButtonItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, Config.datePlannerPageRoute),
      child: Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [ColorName.accentGreenStart, ColorName.accentGreenEnd],
          ),
          borderRadius: BorderRadius.circular(28),
          boxShadow: [
            BoxShadow(
              color: ColorName.lightGreen.withValues(alpha: 0.4),
              blurRadius: 20,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
        child: Text(
          LocaleKeys.date_request_page_yes_button.tr(),
          style: TextStyle(
            color: ColorName.darkGreen,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
