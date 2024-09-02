// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future deleteallpowiadomienias() async {
  // Delete all powiadomienias from firestore database "powiadomienia" delete all rows
  try {
    await FirebaseFirestore.instance
        .collection('Powiadomienia')
        .get()
        .then((snapshot) {
      for (DocumentSnapshot doc in snapshot.docs) {
        doc.reference.delete();
      }
    });
    print('All powiadomienias deleted successfully');
  } catch (e) {
    print('Error deleting powiadomienias: $e');
  }
}
