/// lib/Componts/Location.dart
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationPlacePage extends StatefulWidget {
  final name;
  LocationPlacePage(this.name);
  @override
  _LocationPageState createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPlacePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.name),
        ),
        body: Container(
          child: Center(
            child: Text("الموقع"),
          ),
        ));
  }
}
