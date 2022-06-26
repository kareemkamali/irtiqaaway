import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher.dart';

class Utils {
  static Future openLink({
    required String url,
  }) =>
      _launcherUrl(url);

  static Future _launcherUrl(String url) async {
    if (await canLaunch(url)) await launch(url);
  }

  static openEmail({
    required String toEmail,
  }) async {
    final url = "mailto:$toEmail";
    await _launcherUrl(url);
  }

  static Future openPhoneCall({required String phoneNumber}) async {
    final url = "tel:$phoneNumber";
    await _launcherUrl(url);
  }
}