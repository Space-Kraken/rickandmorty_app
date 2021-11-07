import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rickandmorty_app/app_bindings.dart';
import 'package:rickandmorty_app/routes.dart';

import 'screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: Routes.splashScreen,
      routes: {
        Routes.splashScreen: (_) => const SplashScreen(),
      },
      initialBinding: AppBindings(),
      debugShowCheckedModeBanner: false,
    );
  }
}