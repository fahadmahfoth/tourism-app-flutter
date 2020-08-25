import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class PlaceWidget extends StatelessWidget {
  final myicon, title, img;

  PlaceWidget({this.title, this.img, this.myicon});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 265,
      child: Padding(
          padding:
              EdgeInsets.only(left: 15.0, right: 15.0, top: 10.0, bottom: 10.0),
          child: Stack(children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                height: 256,
                width: MediaQuery.of(context).size.width,
                child: CachedNetworkImage(
                  imageUrl: img,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Center(child: CircularProgressIndicator()),
        errorWidget: (context, url, error) => Center(child: Icon(Icons.error)),
                ),
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
                          title,
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              fontSize: 20.0,
                              wordSpacing: 1.0,
                              fontWeight: FontWeight.w400,
                              color: Colors.white),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 14, top: 6, bottom: 6),
                        child: CachedNetworkImage(
                          imageUrl: myicon,
                        ),
                      )
                    ]),
              ),
            ),
//          ),
          ])),
    );
  }
}
