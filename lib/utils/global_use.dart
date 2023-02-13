import 'package:flutter/material.dart';

class GlobalUse {
  static TextTheme appTextTheme(BuildContext context) =>
      Theme.of(context).textTheme;
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
}

// extension TranslationWord on String {
//   String tr(BuildContext context) {
//     return AppLocalizations.of(context)!.translate(this);
//   }
// }
