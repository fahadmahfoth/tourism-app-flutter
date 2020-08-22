import 'package:animated_icon_button/animated_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InsidePlaceWidget extends StatefulWidget {
  final title, img, favName;

  InsidePlaceWidget({this.title, this.img, this.favName});

  @override
  _PlaceWidgetState createState() => _PlaceWidgetState();
}

class _PlaceWidgetState extends State<InsidePlaceWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 265,
      child: Padding(
          padding:
              EdgeInsets.only(left: 15.0, right: 15.0, top: 10.0, bottom: 10.0),
          child: Stack(children: <Widget>[
            //
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: widget.img != null
                    ? CachedNetworkImage(
                        imageUrl: widget.img,
                        fit: BoxFit.cover,
                      )
                    : SizedBox(),
              ),
            ),

            Positioned(
              bottom: 0,
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor.withOpacity(0.8),
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
                    ]),
              ),
            ),
//          ),
          ])),
    );
  }
}
