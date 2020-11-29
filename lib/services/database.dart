
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';


class Database {
  static final FirebaseFirestore _db = FirebaseFirestore.instance;

  static Future<void> saveReportABoar(Map<String, dynamic> data) async {
    await _db
        .collection('reported_cases')
        .add({...data, 'createdAt': FieldValue.serverTimestamp() });
  }

  // static getReport() async {
  //   await _db
  //       .collection('reported_cases')
  //       .get()
  //   .catchError((error) => print("Failed to add user: $error"));
  // }
}