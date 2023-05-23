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
print(from);
print(to);
print(user_id);
print(response.statusCode);

  if (response.statusCode == 200) {
    print(response.statusCode);
    final responseData = jsonDecode(response.body);
     print(responseData);
 print(response.body.toString()+"       ggggggggggggggg");
    final ress = AttadenceData.fromJson(responseData);
print(ress.attadenceData.length.toString()+'haaaa........................');
   // final data = ClassDatum.fromJson(jsonDecode(response.body));
    // print(ClassDatum.fromJson(jsonDecode(response.body))
    //         .className[0]
    //         .length
    // .toString() +
    //     '        lll----lllllllllllll0');

    return ress;
  } else {
    throw Exception('Failed to load data');
  }
}