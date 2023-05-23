import 'dart:convert';

import 'package:http/http.dart' as http;

import 'model.dart';

Future<Examdata> fetchdataClass(
  String studentClass,
  String division,
  String day,
) async {
  final response = await http.post(
      Uri.parse('http://collage.lucidetech.com/api/student/timetable_details'),
      body: {"class": studentClass, "div": division, "day": day});
      // print(studentClass);
      //       print(division);
      //             print(day);



  if (response.statusCode == 200) {
    //  print(response.statusCode);
    final responseData = jsonDecode(response.body);
    // print(response.body);
    final ress = Examdata.fromJson(responseData);
    // print(ress);
    print(Examdata.fromJson(jsonDecode(response.body))
            .examdata[0]
            .timetableDetailsData
            .length
            .toString() +
        '             lll----lllllllllllll0');
    //
    // for (TeacherDetailsDatum datum in responseData.data) {
    //   // print(datum.teacherAddress);
    // print(datum.teacherEmail);
    // print(datum.teacherId);
    // }
    return Examdata.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load data');
  }
}
