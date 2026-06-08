import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rizz/config.dart';
import 'package:rizz/data_notifier/date_notifier.dart';
import 'package:rizz/generated/locale_keys.g.dart';
import 'package:rizz/pages/request/widgets/widgets.dart';

class DateRequestPage extends StatefulWidget {
  const DateRequestPage({super.key});

  @override
  State<DateRequestPage> createState() => _DateRequestPageState();
}

class _DateRequestPageState extends State<DateRequestPage> {
  static const _buttonSize = Size(100, 48);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final notifier = context.watch<DateNotifier>();

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Background(),
          SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(),
                Heart(),
                const SizedBox(height: 24),
                Question(),
                const SizedBox(height: 12),
                _buildFunnyMessage(notifier.funnyMessage),
                const SizedBox(height: 40),
                _buildYesButton(context),
                const Spacer(),
              ],
            ),
          ),

          // No button
          AnimatedPositioned(
            duration: const Duration(milliseconds: 150),
            curve: Curves.easeOut,
            left: notifier.noButtonPosition.dx,
            top: notifier.noButtonPosition.dy,
            child: _buildNoButton(context, screenSize),
          ),
        ],
      ),
    );
  }

  Widget _buildNoButton(BuildContext context, Size screenSize) {
    final DateNotifier dateNotifier = context.read<DateNotifier>();
    return GestureDetector(
      onTap: () => dateNotifier.onNoPressed(screenSize, _buttonSize),
      child: Container(
        width: _buttonSize.width,
        height: _buttonSize.height,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFFE8607A), Color(0xFFC0405A)],
          ),
          borderRadius: BorderRadius.circular(28),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFFE8607A).withOpacity(0.35),
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

  Widget _buildYesButton(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, Config.DATE_PLANNER_PAGE_ROUTE),
      child: Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFF6FCF7A), Color(0xFF4DB858)],
          ),
          borderRadius: BorderRadius.circular(28),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF4DB858).withOpacity(0.4),
              blurRadius: 20,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
        child: Text(
          LocaleKeys.date_request_page_yes_button.tr(),
          style: const TextStyle(
            color: Color(0xFF1A3A1E),
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _buildFunnyMessage(String msg) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: Text(
        msg,
        key: ValueKey(msg),
        style: const TextStyle(
          fontSize: 12,
          color: Color(0xFFC87090),
          fontStyle: FontStyle.italic,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
