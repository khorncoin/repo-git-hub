
import 'package:flutter/material.dart';
import 'package:luna/utils/constants/app_colors.dart';
import 'package:luna/utils/constants/app_images.dart';
import 'package:luna/views/screens/auth/login_screen/login_screen.dart';
import 'package:luna/views/screens/main_screen/main_screen.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = "/splash_screen";
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      const Duration(seconds: 2),
          () {
        // var lang = localStore.read('lang');
        //
        // if (lang == null || lang == "") {
        //   currectLang = const Locale('en', 'US');
        //   Get.updateLocale(currectLang);
        //   Navigator.pushReplacementNamed(
        //       context, SelectLanguageScreen.routeName);
        // } else {
        //   lan = lang;
        //   https: //stage.cint-cam.com
        //
        //   if (lang == 'kh') {
        //     localStore.write('lang', 'kh');
        //     currectLang = const Locale('kh', 'KH');
        //   } else {
        //     localStore.write('lang', 'en');
        //     currectLang = const Locale('en', 'US');
        //   }
        //   Get.updateLocale(currectLang);
          // Get.to(RecodeScreen());
          Navigator.pushNamedAndRemoveUntil(
              context, MainScreen.routeName, (route) => false);
        // }
      },
    );
    return  Scaffold(

      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: AppColors().primary,
        child: Stack(
          children: [
            Center(

              child: AppImages.logoImage(),
            ),
            Positioned(
                bottom: 40,
                left: 0,
                right: 0,

                child: Text("Copyright TurboTech",textAlign: TextAlign.center,style: TextStyle(color: AppColors().white),))
          ],
        ),
      ),
    );
  }
}
