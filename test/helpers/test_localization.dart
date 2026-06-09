import 'package:easy_localization/easy_localization.dart';
// EasyLocalizationController and Localization are not part of the public API,
// but they are the supported way to load real translations in a unit test so
// that `.tr()` calls resolve instead of logging "key not found" warnings.
// ignore: implementation_imports
import 'package:easy_localization/src/easy_localization_controller.dart';
// ignore: implementation_imports
import 'package:easy_localization/src/localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

/// Loads the real `assets/translations` for the `en` locale so that `.tr()`
/// resolves during unit tests on localization-aware view models.
///
/// Call once from `setUpAll`.
Future<void> setupTestLocalization() async {
  // Initializes the binding so RootBundleAssetLoader can read the bundled
  // translation assets. We deliberately skip EasyLocalization.ensureInitialized
  // (it reaches for SharedPreferences, which has no plugin in the test VM);
  // forceLocale + saveLocale: false make the saved-locale lookup unnecessary.
  TestWidgetsFlutterBinding.ensureInitialized();

  final controller = EasyLocalizationController(
    forceLocale: const Locale('en'),
    supportedLocales: const [Locale('en'), Locale('uk')],
    fallbackLocale: const Locale('en'),
    path: 'assets/translations',
    useOnlyLangCode: true,
    useFallbackTranslations: true,
    saveLocale: false,
    onLoadError: (FlutterError e) => throw e,
    assetLoader: const RootBundleAssetLoader(),
  );

  await controller.loadTranslations();

  Localization.load(
    const Locale('en'),
    translations: controller.translations,
    fallbackTranslations: controller.fallbackTranslations,
  );
}
