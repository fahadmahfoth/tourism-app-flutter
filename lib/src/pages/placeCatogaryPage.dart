import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tourism/src/pages/placeDetail.dart';
import 'package:tourism/src/pages/placePage.dart';
import 'package:tourism/src/repo/category_repo.dart';
import 'package:tourism/src/repo/place_repo.dart';
import 'package:tourism/src/widgets/PlaceWidget.dart';
import 'package:tourism/src/widgets/insidePlaceWidget.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class PlaceCatogaryPage extends StatefulWidget {
  @override
  _PlacePageState createState() => _PlacePageState();
}

class _PlacePageState extends State<PlaceCatogaryPage> {
  CategoryRepo categoryRepo = new CategoryRepo();
  PlaceRepo placeRepo = new PlaceRepo();
  String textField = '';
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 90,
          child: Center(
            child: Container(
              height: 42,
              width: MediaQuery.of(context).size.width - 100,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black,
                        offset: Offset(1, 2),
                        blurRadius: 3)
                  ]),
              child: Stack(
                children: [
                  Positioned(
                    child: Icon(
                      Icons.search,
                      color: Theme.of(context).primaryColor,
                    ),
                    left: 6,
                    top: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 6, right: 6, top: 20),
                    child: TextFormField(
                      style: TextStyle(color: Theme.of(context).primaryColor),
                      onChanged: (change) {
                        setState(() {
                          textField = change;
                        });
                      },
                      decoration: InputDecoration(
                          hintStyle:
                              TextStyle(color: Theme.of(context).primaryColor),
                          border: InputBorder.none,
                          hintText: "البحث"),
                    ),
                  ),
                ],
              ),
            ),
          ),
          decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(35),
                  bottomRight: Radius.circular(35))),
        ),
        Expanded(
            child: FutureBuilder(
                future: textField.isEmpty
                    ? categoryRepo.categorylist()
                    : placeRepo.placeslist(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return textField.isEmpty
                        ? ListView.builder(
                            physics: BouncingScrollPhysics(),
                            itemCount: snapshot.data.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      CupertinoPageRoute(
                                        builder: (context) {
                                          return InsidePlacePage(
                                            snapshot.data[index]['places'],
                                            snapshot.data[index]['name'],
                                          );
                                        },
                                      ),
                                    );
                                  },
                                  child: PlaceWidget(
                                    title: snapshot.data[index]['name'],
                                    myicon: '${snapshot.data[index]['icon']}',
                                    img: '${snapshot.data[index]['image']}',
                                  ));
                            })
                        : ListView.builder(
                            physics: BouncingScrollPhysics(),
                            itemCount: snapshot.data.length,
                            itemBuilder: (context, index) {
                              return snapshot.data[index]
                                      .toString()
                                      .contains(textField)
                                  ? GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          CupertinoPageRoute(
                                            builder: (context) {
                                              return PlaceDetails(
                                                snapshot.data[index],
                                              );
                                            },
                                          ),
                                        );
                                      },
                                      child: InsidePlaceWidget(
                                        title: snapshot.data[index]['name'],
                                        img: snapshot.data[index]['image'],
                                      ),
                                    )
                                  : SizedBox(
                                      height: 0,
                                    );
                            });
                  } else {
                    return Center(
                        child: SpinKitCircle(
                      color: Theme.of(context).primaryColor,
                    ));
                  }
                }))
      ],
    );
  }
}
