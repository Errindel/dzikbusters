
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';


class Database {
  static final FirebaseFirestore _db = FirebaseFirestore.instance;

  static Future<void> saveReportABoar(Map<String, dynamic> data) async {
    await _db
        .collection('tasks')
        .add({...data, 'createdAt': FieldValue.serverTimestamp() });
  }
}