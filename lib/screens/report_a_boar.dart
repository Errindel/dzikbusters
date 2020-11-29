import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../services/database.dart';
import '../widgets/image_input.dart';
import '../widgets/location_input.dart';
import '../models/models.dart';
import './to_do_after_screen.dart';

class ReportABoar extends StatefulWidget {
  static const routeName = '/report';

  @override
  _ReportABoarState createState() => _ReportABoarState();
}

class _ReportABoarState extends State<ReportABoar> {
  final _titleController = TextEditingController();
  int selectedBoarType;
  int herdCount= 0;
  String selectedSexAndAge;
  int _currentStep = 0;
  File _pickedImage;
  dynamic _pickedLocation;

  void _selectImage(File pickedImage) {
    _pickedImage = pickedImage;
  }

  void _selectPlace(double lat, double lng) {
    _pickedLocation = UserLocation(latitude: lat, longitude: lng);
  }

  Future<void> _getInitialLocation() async {
    try {
      final locData = await Location().getLocation();
      _pickedLocation = UserLocation(
          latitude: locData.latitude, longitude: locData.longitude);
    } catch (error) {
      return;
    }
  }

  void _sendReport() {
    if (_pickedLocation == null) {
      return;
    }
    Database.saveReportABoar({
      'herdCount': herdCount,
      'location': GeoPoint(
        _pickedLocation.latitude,
        _pickedLocation.longitude,
      ),
      'selectedBoarType': selectedBoarType,
      'selectedSexAndAge': selectedSexAndAge,
    });
    Navigator.of(context).pushNamed(ToDoAfter.routeName);

  }

  void _selectAgeAndSex(String val) {
    setState(() {
      selectedSexAndAge = val;
    });
  }

  @override
  void initState() {
    super.initState();
    selectedBoarType = 0;
    _getInitialLocation();
  }

  setSelectedBoarType(int val) {
    setState(() {
      selectedBoarType = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Zgłoś dzika'),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Stepper(
                  controlsBuilder: (BuildContext context,
                      {VoidCallback onStepContinue,
                      VoidCallback onStepCancel}) {
                    return Row(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 12, 0),
                          child: RaisedButton(
                            disabledColor: Colors.grey.shade200,
                            disabledTextColor: Colors.grey.shade500,
                            color: Colors.grey.shade300,
                            onPressed: _currentStep <= 0
                                ? null
                                : () {
                                    setState(() {
                                      _currentStep -= 1;
                                    });
                                  },
                            child: const Text('Poprzedni'),
                          ),
                        ),
                        RaisedButton(
                          color: Colors.green.shade200,
                          onPressed: () {
                            if (_currentStep >= 4) return _sendReport();
                            setState(() {
                              _currentStep += 1;
                            });
                          },
                          child: _currentStep >= 4
                              ? const Text('Wyślij zgłoszenie')
                              : const Text('Następny'),
                        ),
                      ],
                    );
                  },
                  currentStep: _currentStep,
                  steps: <Step>[
                    Step(
                      title: Text('Wybierz stan dzika'),
                      content: Column(
                        children: <Widget>[
                          RadioListTile(
                            value: 0,
                            groupValue: selectedBoarType,
                            onChanged: setSelectedBoarType,
                            title: Text("Martwy dzik"),
                          ),
                          RadioListTile(
                            value: 1,
                            groupValue: selectedBoarType,
                            onChanged: setSelectedBoarType,
                            title: Text("Żywy dzik"),
                            subtitle: Text("Pojedynczy dzik lub stado dzików"),
                          ),
                        ],
                      ),
                    ),
                    Step(
                      title: Text('Dodaj zdjęcia (opcjonalne)'),
                      content: ImageInput(_selectImage),
                    ),
                    Step(
                      title: Text('Dodaj miejsce zaobserwowania dzika'),
                      content: LocationInput(_selectPlace),
                    ),
                    Step(
                      title: Text('Określ płeć (opcjonalne)'),
                      content: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 12, 12),
                            child: ListTile(
                              title: Text("Dorosły samiec"),
                              leading: Image.asset("assets/dzik.png",
                                  width: 60, height: 60),
                              selected: selectedSexAndAge == 'grown up male',
                              selectedTileColor: Colors.grey.shade300,
                              tileColor: Colors.grey.shade200,
                              onTap: () {
                                _selectAgeAndSex('grown up male');
                              },
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 12, 12),
                            child: ListTile(
                              title: Text("Dorosła samica"),
                              leading: Image.asset("assets/locha.png",
                                  width: 60, height: 60),
                              selected: selectedSexAndAge == 'grown up female',
                              selectedTileColor: Colors.grey.shade300,
                              tileColor: Colors.grey.shade200,
                              onTap: () {
                                _selectAgeAndSex('grown up female');
                              },
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 12, 12),
                            child: ListTile(
                              title: Text("Warchlak"),
                              leading: Image.asset("assets/mlode.png",
                                  width: 60, height: 60),
                              selected: selectedSexAndAge == 'young',
                              selectedTileColor: Colors.grey.shade300,
                              tileColor: Colors.grey.shade200,
                              onTap: () {
                                _selectAgeAndSex('young');
                              },
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 12, 12),
                            child: ListTile(
                              title: Text("Stado dzików"),
                              leading:
                                  Image.asset("assets/stado.png", height: 40),
                              selected: selectedSexAndAge == 'herd',
                              selectedTileColor: Colors.grey.shade300,
                              tileColor: Colors.grey.shade200,
                              onTap: () {
                                _selectAgeAndSex('herd');
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Step(
                      title: Text('Dodaj liczebność'),
                      content: TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'Liczebność stada',
                        ),
                        onChanged: (value) {
                          setState(() {
                            herdCount = int.parse(value);
                          });
                        },
                        onSaved: (value) {
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
