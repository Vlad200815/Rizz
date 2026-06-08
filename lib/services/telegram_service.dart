import 'package:rizz/config.dart';
import 'package:url_launcher/url_launcher.dart';

class TelegramService {
  /// Opens a Telegram chat with [Config.telegramUsername], pre-filling [message].
  static Future<void> sendMessage(String message) async {
    final uri = Uri.parse(
      'https://t.me/${Config.telegramUsername}?text=${Uri.encodeComponent(message)}',
    );

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }
}
