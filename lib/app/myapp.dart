import 'package:estufinha_app/home/home_page.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.green
      ),
      home: MainPage(title: 'Estufinha'),
    );
  }
}
