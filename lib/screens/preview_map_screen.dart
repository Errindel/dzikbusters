import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PreviewMapScreen extends StatefulWidget {
  static const routeName = '/preview';

  PreviewMapScreen();

  @override
  _PreviewMapScreenState createState() => _PreviewMapScreenState();
}

class _PreviewMapScreenState extends State<PreviewMapScreen> {
  Set<Marker> markers = Set();

  Future<String> _loadFromAsset() async {
    return await rootBundle.loadString("assets/res.json");
  }

  Future parseJson() async {
    String json = await _loadFromAsset();
    final parsed = jsonDecode(json).cast<Map<String, dynamic>>();
    dynamic data = parsed.forEach((dynamic item) => Marker(
            markerId: MarkerId(item['adns']),
            position: LatLng(double.parse(item['latitude']),
                double.parse(item['longitude'])))
      );
    print(data);
    markers.addAll(data);
      setState(() {
        final markers = data;
      });
    // print(_data[0]);
  }

  @override
  void initState() {
    print('DUUPPAPODAPDOAPDOD');
    super.initState();
    parseJson();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mapa zgłoszeń'),
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(
            51.7592,
            19.4560,
          ),
          zoom: 5.5,
        ),
        markers: Set<Marker>.of(markers),
      ),
    );
  }
}
