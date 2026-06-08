import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rizz/features/planner/date_vibe.dart';
import 'package:rizz/features/planner/planner_notifier.dart';

void main() {
  late PlannerNotifier notifier;

  setUp(() => notifier = PlannerNotifier());

  group('canSend', () {
    test('is false initially', () {
      expect(notifier.canSend, isFalse);
    });

    test('is false when place is still empty', () {
      notifier.setDate(DateTime(2026, 12, 25));
      notifier.setTime(const TimeOfDay(hour: 19, minute: 30));

      expect(notifier.canSend, isFalse);
    });

    test('is true when date, time and place are all set', () {
      notifier.setDate(DateTime(2026, 12, 25));
      notifier.setTime(const TimeOfDay(hour: 19, minute: 30));
      notifier.setPlace('Cinema');

      expect(notifier.canSend, isTrue);
    });
  });

  group('vibe', () {
    test('defaults to romantic', () {
      expect(notifier.vibe, DateVibe.romantic);
    });

    test('setVibe updates the selected vibe', () {
      notifier.setVibe(DateVibe.adventure);

      expect(notifier.vibe, DateVibe.adventure);
    });
  });

  test('setPlace updates state and notifies listeners', () {
    var notifications = 0;
    notifier.addListener(() => notifications++);

    notifier.setPlace('Park');

    expect(notifier.place, 'Park');
    expect(notifications, 1);
  });

  group('buildTelegramMessage', () {
    test('includes the formatted date, time, place and note', () {
      notifier.setDate(DateTime(2026, 12, 25));
      notifier.setTime(const TimeOfDay(hour: 9, minute: 5));
      notifier.setPlace('Rooftop bar');
      notifier.setNote('Wear the blue dress');

      final message = notifier.buildTelegramMessage();

      expect(message, contains('25.12.2026'));
      expect(message, contains('09:05')); // 24h clock, hour & minute padded
      expect(message, contains('Rooftop bar'));
      expect(message, contains('Wear the blue dress'));
    });

    test('uses an em dash when date and time are missing', () {
      notifier.setPlace('Somewhere');

      expect(notifier.buildTelegramMessage(), contains('—'));
    });
  });
}
