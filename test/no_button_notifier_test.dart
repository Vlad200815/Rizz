import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rizz/features/request/no_button_notifier.dart';

import 'helpers/test_localization.dart';

void main() {
  late NoButtonNotifier notifier;

  const screenSize = Size(400, 800);
  const buttonSize = Size(100, 48);

  setUpAll(setupTestLocalization);
  setUp(() => notifier = NoButtonNotifier());

  test('starts with zero presses and no message', () {
    expect(notifier.noCount, 0);
    expect(notifier.funnyMessage, isEmpty);
  });

  test('onNoPressed increments the counter, shows a message and notifies', () {
    var notifications = 0;
    notifier.addListener(() => notifications++);

    notifier.onNoPressed(screenSize, buttonSize);

    expect(notifier.noCount, 1);
    expect(notifications, 1);
    expect(notifier.funnyMessage, isNotEmpty);
  });

  test('keeps the button within the screen bounds across many presses', () {
    for (var i = 0; i < 50; i++) {
      notifier.onNoPressed(screenSize, buttonSize);
      final position = notifier.noButtonPosition;

      expect(
        position.dx,
        inInclusiveRange(32, screenSize.width - buttonSize.width),
      );
      expect(position.dy, greaterThanOrEqualTo(100));
      expect(
        position.dy,
        lessThanOrEqualTo(screenSize.height - buttonSize.height),
      );
    }
  });
}
