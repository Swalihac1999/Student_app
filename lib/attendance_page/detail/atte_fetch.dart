// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'model.dart';

Future<AttadenceData> attendanceFetch( String user_id , String from, String to ) async {
  final response = await http.post(
    Uri.parse('http://collage.lucidetech.com/api/student/attendence_details'),
    body: {"user_id": user_id, "from":from, "to": to}
  );

  if (response.statusCode == 200) {
    final responseData = jsonDecode(response.body);
    final ress = AttadenceData.fromJson(responseData);
    print(response.body.toString()+'........................');
    return ress;
  } else {
    throw Exception('Failed to load data');
  }
}