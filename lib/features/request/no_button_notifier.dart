import 'dart:math';
import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:rizz/generated/locale_keys.g.dart';

class NoButtonNotifier extends ChangeNotifier {
  int _noCount = 0;
  Offset _noButtonPosition = const Offset(150, 650);
  String _funnyMessageKey = '';

  int get noCount => _noCount;
  Offset get noButtonPosition => _noButtonPosition;

  /// Localized message, resolved against the current locale on each access.
  String get funnyMessage =>
      _funnyMessageKey.isEmpty ? '' : _funnyMessageKey.tr();

  static const List<String> _funnyMessageKeys = [
    LocaleKeys.date_request_page_rizz_phrases_first,
    LocaleKeys.date_request_page_rizz_phrases_second,
    LocaleKeys.date_request_page_rizz_phrases_three,
    LocaleKeys.date_request_page_rizz_phrases_four,
    LocaleKeys.date_request_page_rizz_phrases_five,
    LocaleKeys.date_request_page_rizz_phrases_six,
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
    _funnyMessageKey =
        _funnyMessageKeys[(_noCount - 1) % _funnyMessageKeys.length];
    notifyListeners();
  }
}
