import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:rizz/features/planner/date_vibe.dart';
import 'package:rizz/generated/locale_keys.g.dart';
import 'package:rizz/services/calendar_service.dart';
import 'package:rizz/services/telegram_service.dart';
import 'package:rizz/utils/formatters.dart';

class PlannerNotifier extends ChangeNotifier {
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;
  String _place = '';
  DateVibe _vibe = DateVibe.romantic;
  String _note = '';

  DateTime? get selectedDate => _selectedDate;
  TimeOfDay? get selectedTime => _selectedTime;
  String get place => _place;
  DateVibe get vibe => _vibe;
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

  void setVibe(DateVibe value) {
    _vibe = value;
    notifyListeners();
  }

  void setNote(String value) {
    _note = value;
    notifyListeners();
  }

  String buildTelegramMessage() {
    final date = _selectedDate != null ? Formatters.date(_selectedDate!) : '—';
    final time = _selectedTime != null ? Formatters.time(_selectedTime!) : '—';

    return '🗓 ${LocaleKeys.date_planner_page_tg_message_date_text.tr()} $date\n'
        '🕐 ${LocaleKeys.date_planner_page_tg_message_time_text.tr()} $time\n'
        '📍 ${LocaleKeys.date_planner_page_tg_message_place_text.tr()} $_place\n'
        '✨ ${LocaleKeys.date_planner_page_tg_message_vibe_text.tr()} ${_vibe.label}\n'
        '💌 $_note';
  }

  Future<void> sendToTelegram() async {
    await TelegramService.sendMessage(buildTelegramMessage());
  }

  Future<void> addToCalendar() async {
    if (_selectedDate == null || _selectedTime == null) return;

    await CalendarService.addDateToCalendar(
      date: _selectedDate!,
      time: _selectedTime!,
      //TODO: add this to localization
      place: _place.isEmpty ? 'To be determined' : _place,
      note: _note,
    );
  }
}
