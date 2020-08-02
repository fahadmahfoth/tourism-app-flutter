import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class InsidePlaceWidget extends StatefulWidget {
  final title, img;

  InsidePlaceWidget({this.title, this.img});

  @override
  _PlaceWidgetState createState() => _PlaceWidgetState();
}

class _PlaceWidgetState extends State<InsidePlaceWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding:
            EdgeInsets.only(left: 15.0, right: 15.0, top: 10.0, bottom: 10.0),
        child: Stack(children: <Widget>[
          //
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              width: MediaQuery.of(context).size.width ,
              child: CachedNetworkImage(
                 imageUrl: widget.img,
                    fit: BoxFit.cover,
                  ),
            ),
          ),

          Positioned(
            bottom: 0,
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                  color: Color(0xFF092061).withOpacity(0.8),
                  borderRadius: BorderRadius.circular(10)),
              width: MediaQuery.of(context).size.width - 30,
              child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(right: 14),
                      child: Text(
                        widget.title,
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            fontSize: 20.0,
                            wordSpacing: 1.0,
                            fontWeight: FontWeight.w400,
                            color: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 14),
                      child: Row(
                        children: [
                          Icon(Icons.location_on, color: Colors.white),
                          Icon(Icons.favorite, color: Colors.red),
                        ],
                      ),
                    )
                  ]),
            ),
          ),
//          ),
        ]));
  }
}
