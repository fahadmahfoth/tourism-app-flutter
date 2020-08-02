import 'package:flutter/material.dart';
import 'package:tourism/src/pages/placePage.dart';
import 'package:tourism/src/widgets/PlaceWidget.dart';
import 'package:page_transition/page_transition.dart';


class PlaceCatogaryPage extends StatefulWidget {
  
  @override
  _PlacePageState createState() => _PlacePageState();
}

class _PlacePageState extends State<PlaceCatogaryPage> {

  
  @override
  Widget build(BuildContext context) {



    
    return Column(
      children: [


        Container(
      height: 90,
      
      child: Center(
        child: Container(
          height: 42,
          width: MediaQuery.of(context).size.width-100,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25),
            boxShadow: [
              BoxShadow(
                color: Colors.black,offset: Offset(1, 2),blurRadius: 3
              )
            ]
          ),

          child: Stack(
            children: [
              Positioned(
                child: Icon(Icons.search),
                left: 6,
                top: 10,

                
              ),
              Padding(
                padding: const EdgeInsets.only(left: 6,right: 6,top: 20),
                child: TextFormField(
                  decoration: InputDecoration(
                     border: InputBorder.none,
                     
                     
                    hintText: "البحث"
                    
                    

                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      decoration: BoxDecoration(
        color: Color(0xFF092061),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(35),
          bottomRight: Radius.circular(35)
        )
      ),
    ),

       

        
       Expanded(
                  child: ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: 4,
            itemBuilder: (context,index){
              return GestureDetector(
                onTap: (){
                  Navigator.push(
                        context,
                        PageTransition(
                          duration: Duration(milliseconds: 170),
                          type: PageTransitionType.rightToLeft,
                          child: InsidePlacePage(),
                        ),
                      );
                    
                },
                child: PlaceWidget(title: 'مقهى', myicon: Icons.fastfood,img: 'https://images.wallpaperscraft.com/image/city_rocks_mountains_134667_800x600.jpg',));
            }),
        )
  
      ],
    );
  }
}

