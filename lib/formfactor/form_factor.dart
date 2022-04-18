import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

enum ScreenType { desktop, tablet, handset, watch }

class FormFactor {
  static double desktop = 900;
  static double tablet = 600;
  static double handset = 300;

  static ScreenType getFormFactor(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.shortestSide;
    if (deviceWidth > desktop) return ScreenType.desktop;
    if (deviceWidth > tablet) return ScreenType.tablet;
    if (deviceWidth > handset) return ScreenType.handset;
    return ScreenType.watch;
  }
}

///For device segmentation.
bool get isMobileDevice => !kIsWeb && (Platform.isIOS || Platform.isAndroid);
bool get isDesktopDevice =>
    !kIsWeb && (Platform.isMacOS || Platform.isWindows || Platform.isLinux);
bool get isMobileDeviceOrWeb => kIsWeb || isMobileDevice;
bool get isDesktopDeviceOrWeb => kIsWeb || isDesktopDevice;
