import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:rizz/generated/locale_keys.g.dart';
import 'package:rizz/services/calendar_service.dart';

class DateNotifier extends ChangeNotifier {
  /// For Date Request Page
  int _noCount = 0;
  Offset _noButtonPosition = const Offset(150, 650);
  String _funnyMessage = '';

  int get noCount => _noCount;
  Offset get noButtonPosition => _noButtonPosition;
  String get funnyMessage => _funnyMessage;

  static final List<String> _funnyMessages = [
    LocaleKeys.date_request_page_rizz_phrases_first.tr(),
    LocaleKeys.date_request_page_rizz_phrases_second.tr(),
    LocaleKeys.date_request_page_rizz_phrases_three.tr(),
    LocaleKeys.date_request_page_rizz_phrases_four.tr(),
    LocaleKeys.date_request_page_rizz_phrases_five.tr(),
    LocaleKeys.date_request_page_rizz_phrases_six.tr(),
  ];

  void onNoPressed(Size screenSize, Size buttonSize) {
    _noCount++;
    final rand = Random();
    final maxX = screenSize.width - buttonSize.width - 32;
    final maxY = screenSize.height - buttonSize.height - 120;
    _noButtonPosition = Offset(
      32 + rand.nextDouble() * maxX,
      100 + rand.nextDouble() * maxY,
    );
    _funnyMessage = _funnyMessages[(_noCount - 1) % _funnyMessages.length];
    notifyListeners();
  }

  /// For Date Planner Page
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;
  String _place = '';
  String _vibe = LocaleKeys.date_planner_page_vibes_romantic_tab.tr();
  String _note = '';

  DateTime? get selectedDate => _selectedDate;
  TimeOfDay? get selectedTime => _selectedTime;
  String get place => _place;
  String get vibe => _vibe;
  String get note => _note;

  bool get canSend =>
      _selectedDate != null && _selectedTime != null && _place.isNotEmpty;

  void setDate(DateTime date) {
    _selectedDate = date;
    notifyListeners();
  }

  void setTime(TimeOfDay time) {
    _selectedTime = time;
    notifyListeners();
  }

  void setPlace(String value) {
    _place = value;
    notifyListeners();
  }

  void setVibe(String value) {
    _vibe = value;
    notifyListeners();
  }

  void setNote(String value) {
    _note = value;
    notifyListeners();
  }

  String buildTelegramMessage() {
    final date = _selectedDate != null
        ? '${_selectedDate!.day}.${_selectedDate!.month}.${_selectedDate!.year}'
        : '—';
    final time = _selectedTime != null
        ? '${_selectedTime!.hour}:${_selectedTime!.minute.toString().padLeft(2, '0')}'
        : '—';

    debugPrint("Tg message date: $date, time: $time");

    return '🗓 ${LocaleKeys.date_planner_page_tg_message_date_text.tr()} $date\n'
        '🕐 ${LocaleKeys.date_planner_page_tg_message_time_text.tr()} $time\n'
        '📍 ${LocaleKeys.date_planner_page_tg_message_place_text.tr()} $_place\n'
        '✨ ${LocaleKeys.date_planner_page_tg_message_vibe_text.tr()} $_vibe\n'
        '💌 $_note';
  }

  Future<void> addToCalendar() async {
    if (_selectedDate == null || _selectedTime == null) return;

    await CalendarService.addDateToCalendar(
      date: _selectedDate!,
      time: _selectedTime!,
      place: _place.isEmpty ? 'TBD' : _place,
      note: _note,
    );
  }
}
