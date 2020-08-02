import 'package:flutter/material.dart';
import 'package:tourism/src/widgets/insidePlaceWidget.dart';

class InsidePlacePage extends StatefulWidget {
  @override
  _InsidePlacePageState createState() => _InsidePlacePageState();
}

class _InsidePlacePageState extends State<InsidePlacePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("العنوان"),
        centerTitle: true,
      ),

      body: Column(
        children: [
         
          
          Container(


    child :Expanded(
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: 4,
            itemBuilder: (context,index){
              return InsidePlaceWidget(title: 'مقهى العالمي',img: 'https://images.wallpaperscraft.com/image/city_rocks_mountains_134667_800x600.jpg',);
            }),
    )
          
    ),
        ],
      )
    );
  }
}