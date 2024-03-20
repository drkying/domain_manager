import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;

String environmentCheck() {
  if (kIsWeb) {
    return 'Web';
  } else if (Platform.isAndroid) {
    // print('Android');
    return 'Android';
  } else if (Platform.isIOS) {
    // print('iOS')
    return 'iOS';
  } else {
    // print('Other');
    return 'Other';
  }
}
