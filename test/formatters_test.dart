import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rizz/utils/formatters.dart';

void main() {
  group('Formatters.date', () {
    test('formats a date as dd.MM.yyyy', () {
      final result = Formatters.date(DateTime(2026, 12, 25));

      expect(result, '25.12.2026');
    });

    test('zero-pads single-digit days and months', () {
      final result = Formatters.date(DateTime(2026, 3, 5));

      expect(result, '05.03.2026');
    });
  });

  group('Formatters.time', () {
    test('formats a time as HH:mm on a 24-hour clock', () {
      final result = Formatters.time(const TimeOfDay(hour: 19, minute: 30));

      expect(result, '19:30');
    });

    test('zero-pads single-digit hours and minutes', () {
      final result = Formatters.time(const TimeOfDay(hour: 9, minute: 5));

      expect(result, '09:05');
    });

    test('formats midnight as 00:00', () {
      final result = Formatters.time(const TimeOfDay(hour: 0, minute: 0));

      expect(result, '00:00');
    });
  });
}
