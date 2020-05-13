import 'package:estufinha_app/ferramentas/tools_page.dart';
import 'package:estufinha_app/green_house/green_house_page.dart';
import 'package:estufinha_app/plantas/plantas_page.dart';
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
        body: PageView(
          controller: pageController,
          children: <Widget>[
            GreenHousePage(),
            PlantasPage(),
            ToolsPage()
          ],
        ),
        bottomNavigationBar: AnimatedBuilder(
            animation: pageController,
            builder: (_, __) {
              return BottomNavigationBar(
                  onTap: (index) {
                    pageController.animateToPage(index,
                        duration: Duration(milliseconds: 100),
                        curve: Curves.easeInOut);
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
            }),
        appBar: AppBar(title: Text(widget.title)));
  }
}
