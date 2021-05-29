import 'package:flutter/material.dart';

class AppImagePath {
  final String path;
  AppImagePath(this.path);

  @override
  String toString() {
    return path;
  }

  Image image() {
    return Image(image: AssetImage(path));
  }
}

/// App Icon assets path 제공
class AppImages {
  static final drawerSeed = AppImagePath("assets/images/drawer_seed.png");
  static final hero = AppImagePath("assets/images/hero.png");
  static final barcode = AppImagePath("assets/images/barcode.png");
  static final device = AppImagePath("assets/images/device.png");
  static final deviceInput = AppImagePath("assets/images/device_input.png");
  static final phoneBarcode = AppImagePath("assets/images/phone_barcode.png");
  static final phonePoint = AppImagePath("assets/images/phone_point.png");
  static final cup = AppImagePath("assets/images/cup_image.PNG");
  static final smileGrey = AppImagePath("assets/images/smile_grey.PNG");
  static final smilePurple = AppImagePath("assets/images/smile_purple.PNG");
  static final point = AppImagePath("assets/images/point.png");

  // Login button에 사용할 로고
  static final appleLogo = AppImagePath("assets/images/apple_logo.png");
  static final googleLogo = AppImagePath("assets/images/google_logo.png");
}
