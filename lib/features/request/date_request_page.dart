import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rizz/features/request/no_button_notifier.dart';
import 'package:rizz/features/request/widgets/widgets.dart';
import 'package:rizz/gen/colors.gen.dart';

class DateRequestPage extends StatefulWidget {
  const DateRequestPage({super.key});

  @override
  State<DateRequestPage> createState() => _DateRequestPageState();
}

class _DateRequestPageState extends State<DateRequestPage> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final notifier = context.watch<NoButtonNotifier>();

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          BackgroundView(),
          SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(),
                const HeartItem(),
                const SizedBox(height: 24),
                const QuestionItem(),
                const SizedBox(height: 12),
                _buildFunnyMessage(notifier.funnyMessage),
                const SizedBox(height: 40),
                const YesButtonItem(),
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
            child: NoButtonItem(screenSize: screenSize),
          ),
        ],
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
          color: ColorName.roseTextMuted,
          fontStyle: FontStyle.italic,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
