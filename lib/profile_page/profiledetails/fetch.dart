import 'dart:convert';

import 'package:http/http.dart' as http;

import 'model.dart';

Future<ProfileData> fetchProfiledata(
  String user_id,
) async {
  final response = await http.post(
      Uri.parse('http://collage.lucidetech.com/api/student/student_details'),
      body: {"user_id": user_id});
      print(user_id);

  if (response.statusCode == 200) {
    print(response.statusCode);
    final responseData = jsonDecode(response.body);
    final ress = ProfileData.fromJson(responseData);
    print(ress);
    print(ProfileData.fromJson(jsonDecode(response.body))
            .profileData[0]
            .studentDetailsData
            .length
            .toString() +
        '             lll----lllllllllllll0');
    //
    // for (TeacherDetailsDatum datum in responseData.data) {
    //   // print(datum.teacherAddress);
    // print(datum.teacherEmail);
    // print(datum.teacherId);
    // }
    return ProfileData.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load data');
  }
}
