import 'package:flutter/material.dart';
import 'package:rizz/features/planner/widgets/widgets.dart';
import 'package:rizz/gen/colors.gen.dart';

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
                const HeaderItem(),
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
}
