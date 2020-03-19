import 'package:devo/values/strings.dart';
import 'package:flutter/material.dart';

import 'module/splash/splash_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Strings.appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'MontserratSubrayada',
        brightness: Brightness.light,
      ),
      themeMode: ThemeMode.system,
      darkTheme: ThemeData(
        fontFamily: 'MontserratSubrayada',
        brightness: Brightness.dark,
      ),
      home: SplashScreen(),
    );
  }
}
