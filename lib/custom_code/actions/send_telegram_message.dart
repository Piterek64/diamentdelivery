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

import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> sendTelegramMessage(String message) async {
  final token = '7203965673:AAGI_Rkc4Lfq0odeDl9nU2FF5KNpCPZyDgg';
  final chatId = '-1002219048381';

  final url = Uri.parse('https://api.telegram.org/bot$token/sendMessage');

  final response = await http.post(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json',
    },
    body: jsonEncode(<String, dynamic>{
      'chat_id': chatId,
      'text': message,
    }),
  );

  if (response.statusCode != 200) {
    throw Exception('Failed to send message');
  }
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
