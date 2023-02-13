import 'package:flutter/material.dart';

class AppImages {
  static const String logo = 'assets/images/logo_app.png';
  static const String logo_google = 'assets/images/logo_google.png';
  static const String logo_facebook = 'assets/images/logo_facebook.png';

  static Widget logoImage() => Hero(
        tag: 'imagelogo',
        child: Image.asset(
          AppImages.logo,
          width: 180,
          height: 180,
          fit: BoxFit.fill,
        ),
      );
}
