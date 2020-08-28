// /// lib/Componts/Location.dart
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:provider/provider.dart';
import 'package:tourism/src/utls/theme.dart';
import 'placeDetail.dart';



class LocationPage extends StatefulWidget {
  @override
  _LocationPageState createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {

  GoogleMapController mapController ;
  BitmapDescriptor pinLocationIcon;

  String _mapStyle;
  String _mapdarkStyle;

  LatLng latlng = LatLng(
    36.340000,
    43.130001,
  );
  Iterable markers = [];

  @override
  void initState() {
    super.initState();

     BitmapDescriptor.fromAssetImage(
         ImageConfiguration(devicePixelRatio: 2.5),
         'assets/imags/marker.png').then((onValue) {
            pinLocationIcon = onValue;
         });

    getData();

      rootBundle.loadString('assets/map_style.txt').then((string) {
    _mapStyle = string;
  });
        rootBundle.loadString('assets/map_style_dark.txt').then((string) {
    _mapdarkStyle = string;
  });

  }

  getData() async {
    try {
      final response =
          await http.get('https://tourismnineveh.codeforiraq.org/api/places');

      final int statusCode = response.statusCode;

      if (statusCode == 201 || statusCode == 200) {
        Map responseBody = json.decode(response.body);
        List results = responseBody["data"];

        Iterable _markers = Iterable.generate(results.length, (index) {
          Map result = results[index];
          Map location = result;
          LatLng latLngMarker = LatLng(double.parse(location["map_lat"]), double.parse(location["map_lng"]));

          return Marker(markerId: MarkerId("marker$index"),infoWindow: InfoWindow(
            title: location['name'],
            onTap: (){
              Navigator.push(context, CupertinoPageRoute(builder: (context){
                return PlaceDetails(
                  location
                );
              }));
            }
          ),position: latLngMarker,
          icon: pinLocationIcon
          
          );
        });

        setState(() {
          markers = _markers;
        });
      } else {
        throw Exception('Error');
      }
    } catch(e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {

    return Consumer<ThemeNotifier>(
                  builder: (context, notifier, child) => GoogleMap(
        markers: Set.from(
          markers,
        ),
        initialCameraPosition: CameraPosition(target: latlng, zoom: 12.0),
         mapType: MapType.normal,
        onMapCreated: (GoogleMapController controller) {
    mapController = controller;
    notifier.darkTheme? mapController.setMapStyle(_mapStyle) :mapController.setMapStyle(_mapdarkStyle);
  }
      ) );
    
  }
}

