import 'package:url_launcher/url_launcher.dart';

///This logic temporarily replaces the twitter authentication.
///
/// This should be replaced whenever a great package for web
/// i.e. twitter_login is supported.

class BuyMeCoffee {
  buyCoffee() async {
    const url = "https://www.buymeacoffee.com/danmakzz";

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw "Can not open $url";
    }
  }
}
