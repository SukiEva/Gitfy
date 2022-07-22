import 'package:url_launcher/url_launcher.dart';

Future<void> launch(String urlStr,
    {mode = LaunchMode.externalApplication}) async {
  Uri url = Uri.parse(urlStr);
  if (!await launchUrl(url, mode: mode)) {
    throw 'Could not launch $urlStr';
  }
}
