import 'package:flutter/material.dart';
import 'package:tourism/src/pages/placeCatogaryPage.dart';
import 'package:tourism/src/widgets/drawer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'favPage.dart';
import 'mapPage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List pages = [PlaceCatogaryPage(), LocationPage(), FavPage()];
  int selectedPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xff010101),
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Text("الدليل السياحي"),
      ),
      drawer: MYdrwer(),

      body: pages[selectedPage],

      // body: Center(child: Text(pages[selectedPage].toString()),),
      bottomNavigationBar: BottomNavigationBar(
          // backgroundColor: Color(0xff010101),
          currentIndex: selectedPage,
          type: BottomNavigationBarType.fixed,
          onTap: (change) {
            setState(() {
              selectedPage = change;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.home),
              title: Text('الرئيسية'),
            ),
            BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.searchLocation), title: Text('الموقع')),
            BottomNavigationBarItem(
                icon: FaIcon(Icons.favorite_border), title: Text('المفضلة')),
          ]),

      // drawer: ,
    );
  }
}
