// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes, avoid_renaming_method_parameters, constant_identifier_names

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader {
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String, dynamic> _en = {
    "date_request_page": {
      "no_button": "No ✗",
      "yes_button": "Yes ✓",
      "main_offer": "Will you go on a\ndate with me?",
      "rizz_phrases": {
        "first": "Come on, I made a Flutter app for this 🥺",
        "second": "Your finger slipped, right? Try again",
        "three": "Error 404: Good reason to say No",
        "four": "Button malfunction. Please press Yes.",
        "five": "Are you sure? Yes button is nicer 👉👈",
        "six": "Okay but... the Yes button misses you",
      },
    },
    "date_planner_page": {
      "header_title": "Plan our date 🌙",
      "header_subtitle": "make it special",
      "when_title": "When",
      "where_title": "Where",
      "where_hint_text": "cozy rooftop cafe downtown...",
      "vibe_title": "Vibe",
      "vibes": {
        "romantic_tab": "Romantic",
        "casual_tab": "Casual",
        "adventure_tab": "Adventure",
        "surprise_me_tab": "Surprise me",
      },
      "note_title": "Note",
      "note_hint_text": "I will be the one smiling too much...",
      "add_to_calendar_button": "Add to Calendar",
      "send_via_telegram_button": "Send via Telegram",
      "tg_message": {
        "date_text": "Date: ",
        "time_text": "Time: ",
        "place_text": "Place",
        "vibe_text": "Vibe: ",
      },
      "open_calendar_message": "Opening calendar...",
      "pick_date_text": "Pick date",
      "pick_time_text": "Pick time",
    },
  };
  static const Map<String, dynamic> _uk = {
    "date_request_page": {
      "no_button": "Ні ✗",
      "yes_button": "Так ✓",
      "main_offer": "Підеш зі мною на\nпобачення?",
      "rizz_phrases": {
        "first": "Ну давай, я ж заради цього цілий Flutter додаток написав 🥺",
        "second": "Палець зісковзнув, так? Спробуй ще раз",
        "three": "Помилка 404: Вагомої причини сказати «Ні» не знайдено",
        "four": "Збій у роботі кнопки. Будь ласка, натисніть «Так».",
        "five": "Ти впевнена? Кнопка «Так» набагато симпатичніша 👉👈",
        "six": "Ну добре, але... кнопка «Так» сумує за тобою",
      },
    },
    "date_planner_page": {
      "header_title": "Сплануй наше побачення 🌙",
      "header_subtitle": "зроби його особливим",
      "when_title": "Коли",
      "where_title": "Де",
      "where_hint_text": "затишне кафе на даху в центрі...",
      "vibe_title": "Вайб",
      "vibes": {
        "romantic_tab": "Романтичний",
        "casual_tab": "Повсякденний",
        "adventure_tab": "Пригодний",
        "surprise_me_tab": "Здивуй мене",
      },
      "note_title": "Нотатка",
      "note_hint_text":
          "Я буду тою самою дівчиною, яка занадто багато посміхається...",
      "add_to_calendar_button": "Додати в Календар",
      "send_via_telegram_button": "Надіслати в Telegram",
      "tg_message": {
        "date_text": "Дата: ",
        "time_text": "Час: ",
        "place_text": "Місце",
        "vibe_text": "Вайб: ",
      },
      "open_calendar_message": "Відкриваю календар...",
      "pick_date_text": "Вибери дату",
      "pick_time_text": "Вибери час",
    },
  };
  static const Map<String, Map<String, dynamic>> mapLocales = {
    "en": _en,
    "uk": _uk,
  };
}
