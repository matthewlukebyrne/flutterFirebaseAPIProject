import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:x17138744_codebase/models/user.dart';
import 'package:x17138744_codebase/screens/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:x17138744_codebase/services/auth.dart';
import 'package:x17138744_codebase/shared/splash.dart';

// Inititalizing Firebase on start up
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(SplashScreen(localizationInit()));
}

EasyLocalization localizationInit() {
  return EasyLocalization(
    child: MyApp(),
    path: "resources/langs",
    saveLocale: true,
    supportedLocales: [Locale('en', 'EN'), Locale('de', 'DE')],
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<Users>.value(
      value: AuthService().userStream,
      child: MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        home: Wrapper(),
      ),
    );
  }
}
