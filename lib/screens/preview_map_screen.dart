import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PreviewMapScreen extends StatefulWidget {
  static const routeName = '/preview';

  PreviewMapScreen();

  @override
  _PreviewMapScreenState createState() => _PreviewMapScreenState();
}

class _PreviewMapScreenState extends State<PreviewMapScreen> {

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
      ),
    );
  }
}
