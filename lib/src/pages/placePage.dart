import 'package:flutter/material.dart';
import 'package:tourism/src/pages/placeDetail.dart';
import 'package:tourism/src/widgets/insidePlaceWidget.dart';
import 'package:flutter/cupertino.dart';

class InsidePlacePage extends StatefulWidget {
  final places, name;
  InsidePlacePage(this.places, this.name);
  @override
  _InsidePlacePageState createState() => _InsidePlacePageState();
}

class _InsidePlacePageState extends State<InsidePlacePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.name.toString()),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Container(
                child: Expanded(
              child: widget.places.length != 0
                  ? ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount: widget.places.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              CupertinoPageRoute(
                                fullscreenDialog: true,
                                builder: (context) {
                                  return PlaceDetails(
                                    widget.places[index],
                                  );
                                },
                              ),
                            );
                          },
                          child: InsidePlaceWidget(
                            title: widget.places[index]['name'],
                            img: widget.places[index]['image'],
                          ),
                        );
                      })
                  : Center(
                      child: Text('لاتوجد اماكن حالياً'),
                    ),
            )),
          ],
        ));
  }
}
