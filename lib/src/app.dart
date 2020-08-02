import 'package:flutter/material.dart';

import 'pages/homePage.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
              textTheme: TextTheme(
                
        title: TextStyle(color: Colors.white ,fontFamily: "Amiri"),
        subtitle: TextStyle(color: Color(0xffF2F5EA),fontFamily: "Amiri"),),
        primaryColor: Color(0xFF092061),
        
      ),
      builder: (context, child) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: child,
        );
      },
      home: HomePage(),
    );
  }
}
