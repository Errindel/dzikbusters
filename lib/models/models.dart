import 'package:flutter/foundation.dart';
import 'dart:io';

class UserLocation {
  final double latitude;
  final double longitude;

  const UserLocation({
    @required this.latitude,
    @required this.longitude,
  });
}

class ReportData {
  final int herdCount;
  final UserLocation location;
  final int selectedBoarType;
  final File pickedImage;
  final String selectedSexAndAge;

  const ReportData({
    @required this.herdCount,
    @required this.location,
    @required this.selectedBoarType,
    @required this.pickedImage,
    @required this.selectedSexAndAge,
  });
}
