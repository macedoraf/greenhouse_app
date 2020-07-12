import 'package:estufinha_app/home/home_page.dart';
import 'package:flutter/material.dart';

const backgroundColor = Color.fromRGBO(68, 80, 71, 1);
const secondaryColor = Color.fromRGBO(56, 77, 72, 1);
const primaryColor = Color.fromRGBO(81, 152, 114, 1);
const accentColor = Color.fromRGBO(165, 204, 107, 1);
const lightColor = Color.fromRGBO(213, 223, 229, 1);
const bottomAppColor = Color.fromRGBO(172, 191, 164, 1);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: _themeData(),
      home: MainPage(title: 'Estufinha'),
    );
  }

  ThemeData _themeData() {
    return ThemeData(
        textTheme: _textTheme(),
        accentColor: accentColor,
        scaffoldBackgroundColor: backgroundColor,
        primaryColor: secondaryColor);
  }

  TextTheme _textTheme() {
    return TextTheme(
        headline1: TextStyle(fontSize: 36).apply(color: lightColor),
        headline2: TextStyle(fontSize: 34).apply(color: lightColor),
        headline3: TextStyle(fontSize: 32).apply(color: lightColor),
        bodyText1: TextStyle(fontSize: 20).apply(color: lightColor),
        bodyText2: TextStyle(fontSize: 18).apply(color: lightColor));
  }
}
