import "package:easy_localization/easy_localization.dart";
import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "package:rizz/features/request/no_button_notifier.dart";
import "package:rizz/gen/colors.gen.dart";
import "package:rizz/generated/locale_keys.g.dart";

class NoButtonItem extends StatelessWidget {
  final Size screenSize;

  const NoButtonItem({super.key, required this.screenSize});

  @override
  Widget build(BuildContext context) {
    const buttonSize = Size(100, 48);
    final NoButtonNotifier noButtonNotifier = context.read<NoButtonNotifier>();

    return GestureDetector(
      onTap: () => noButtonNotifier.onNoPressed(screenSize, buttonSize),
      child: Container(
        width: buttonSize.width,
        height: buttonSize.height,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [ColorName.accentRed, ColorName.pinkAccent],
          ),
          borderRadius: BorderRadius.circular(28),
          boxShadow: [
            BoxShadow(
              color: ColorName.roseAccent.withValues(alpha: 0.35),
              blurRadius: 16,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        alignment: Alignment.center,
        child: Text(
          LocaleKeys.date_request_page_no_button.tr(),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
