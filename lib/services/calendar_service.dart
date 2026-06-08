import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CalendarService {
  static Future<void> addDateToCalendar({
    required DateTime date,
    required TimeOfDay time,
    required String place,
    required String note,
  }) async {
    final startDate = DateTime(
      date.year,
      date.month,
      date.day,
      time.hour,
      time.minute,
    );

    final endDate = startDate.add(const Duration(hours: 2));

    final uri = Uri.https('calendar.google.com', '/calendar/render', {
      'action': 'TEMPLATE',
      'text': '💛 Our Date',
      'dates': '${_formatDate(startDate)}/${_formatDate(endDate)}',
      'details': '📍 $place\n\n💌 $note',
      'location': place,
    });

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  static String _formatDate(DateTime dt) {
    String pad(int n) => n.toString().padLeft(2, '0');
    return '${dt.year}${pad(dt.month)}${pad(dt.day)}'
        'T${pad(dt.hour)}${pad(dt.minute)}00';
  }
}
