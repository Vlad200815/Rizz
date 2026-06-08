import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

/// Shared date/time formatting so every screen and the Telegram message
/// render dates and times identically.
class Formatters {
  Formatters._();

  static final DateFormat _date = DateFormat('dd.MM.yyyy');
  static final DateFormat _time = DateFormat('HH:mm');

  /// e.g. `05.03.2026` — day and month are always zero-padded.
  static String date(DateTime date) => _date.format(date);

  /// e.g. `09:05` — 24-hour clock, hour and minute zero-padded.
  static String time(TimeOfDay time) {
    final asDateTime = DateTime(0, 1, 1, time.hour, time.minute);
    return _time.format(asDateTime);
  }
}
