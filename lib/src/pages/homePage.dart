import 'package:flutter/material.dart';
import 'package:tourism/src/pages/placeCatogaryPage.dart';
import 'package:tourism/src/widgets/drawer.dart';

import 'favPage.dart';
import 'mapPage.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  

   List pages = [PlaceCatogaryPage(),LocationPage(),FavPage()];
   int selectedPage = 0 ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Text("الدليل السياحي"),
      ),
      drawer: MYdrwer(),

      body: pages[selectedPage],

      // body: Center(child: Text(pages[selectedPage].toString()),),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedPage,
        type: BottomNavigationBarType.fixed,
        onTap: (change){

          setState(() {
            selectedPage = change ;
          });
          



        },
        items: [
          BottomNavigationBarItem(icon:Icon(Icons.home) , title: Text('الرئيسية')),
          BottomNavigationBarItem(icon:Icon(Icons.location_on) , title: Text('الموقع')),
          BottomNavigationBarItem(icon:Icon(Icons.favorite) , title: Text('المفضلة')),
        ]
        ),




        // drawer: ,
    );
  }
}