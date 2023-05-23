// To parse this JSON data, do
//
//     final classTimeTalbe = classTimeTalbeFromJson(jsonString);

import 'dart:convert';

List<ClassTimeTalbe> classTimeTalbeFromJson(String str) => List<ClassTimeTalbe>.from(json.decode(str).map((x) => ClassTimeTalbe.fromJson(x)));

String classTimeTalbeToJson(List<ClassTimeTalbe> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
class Examdata{
  List<ClassTimeTalbe> examdata;

  Examdata({
    required this.examdata});

  factory Examdata.fromJson(List<dynamic> json) =>
      Examdata(
          examdata:json.map((e) => ClassTimeTalbe.fromJson(e)).toList()
      );
}

class ClassTimeTalbe {
    String apiStatus;
    List<TimetableDetailsDatum> timetableDetailsData;

    ClassTimeTalbe({
        required this.apiStatus,
        required this.timetableDetailsData,
    });

    factory ClassTimeTalbe.fromJson(Map<String, dynamic> json) => ClassTimeTalbe(
        apiStatus: json["api_status"],
        timetableDetailsData: List<TimetableDetailsDatum>.from(json["timetable_details_data"].map((x) => TimetableDetailsDatum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "api_status": apiStatus,
        "timetable_details_data": List<dynamic>.from(timetableDetailsData.map((x) => x.toJson())),
    };
}

class TimetableDetailsDatum {
    String subjectName;
    String startTime;
    String endTime;

    TimetableDetailsDatum({
        required this.subjectName,
        required this.startTime,
        required this.endTime,
    });

    factory TimetableDetailsDatum.fromJson(Map<String, dynamic> json) => TimetableDetailsDatum(
        subjectName: json["subject_name"],
        startTime: json["start_time"],
        endTime: json["end_time"],
    );

    Map<String, dynamic> toJson() => {
        "subject_name": subjectName,
        "start_time": startTime,
        "end_time": endTime,
    };
}
