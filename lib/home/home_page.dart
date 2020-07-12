import 'package:estufinha_app/app/myapp.dart';
import 'package:estufinha_app/ferramentas/tools_page.dart';
import 'package:estufinha_app/green_house/green_house_page.dart';
import 'package:estufinha_app/plant/plant_page.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  MainPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageView(),
      bottomNavigationBar: AnimatedBuilder(
          animation: pageController,
          builder: (_, __) {
            return _bottomNavigation();
          }),
    );
  }

  _pageView() => PageView(
        controller: pageController,
        children: <Widget>[GreenHousePage(), PlantPage(), ToolsPage()],
      );

  _bottomNavigation() => BottomNavigationBar(
          backgroundColor: bottomAppColor,
          onTap: (index) {
            pageController.animateToPage(index,
                duration: Duration(milliseconds: 100), curve: Curves.easeInOut);
          },
          currentIndex: pageController?.page?.round() ?? 0,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.toys), title: Text("Estufa")),
            BottomNavigationBarItem(
                icon: Icon(Icons.spa), title: Text("Plantas")),
            BottomNavigationBarItem(
                icon: Icon(Icons.build), title: Text("Ferramentas"))
          ]);
}
