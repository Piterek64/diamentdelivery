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

import 'dart:async';
import 'package:clear_all_notifications/clear_all_notifications.dart';

Future<void> newCustomAction() async {
  // Uruchom funkcję w tle, aby nie blokować głównej pętli zdarzeń aplikacji
  Future.microtask(() async {
    while (true) {
      await Future.delayed(Duration(minutes: 2));
      await ClearAllNotifications.clear();
    }
  });

  // Zwróć natychmiastowe zakończenie funkcji
  return Future.value();
}
