// To parse this JSON data, do
//
//     final attadenceDetails = attadenceDetailsFromJson(jsonString);

import 'dart:convert';


class AttadenceData {
  List<AttadenceDetails> attadenceData;

  AttadenceData({required this.attadenceData});

  factory AttadenceData.fromJson(List<dynamic> json) => AttadenceData(
      attadenceData: json.map((e) => AttadenceDetails.fromJson(e)).toList());


}

class AttadenceDetails {
  String apiStatus;
  List<AttendenceDetailsDatum>? attendenceDetailsData;

  AttadenceDetails({
    required this.apiStatus,
    this.attendenceDetailsData,
  });

  factory AttadenceDetails.fromJson(Map<String, dynamic> json) =>
      json["api_status"] == "1"
          ? AttadenceDetails(
              apiStatus: json["api_status"],
              attendenceDetailsData: List<AttendenceDetailsDatum>.from(
                  json["attendence_details_data"]
                      .map((x) => AttendenceDetailsDatum.fromJson(x))),
            )
          : AttadenceDetails(
              apiStatus: json["api_status"],
            );

}

class AttendenceDetailsDatum {

  String attendenceDate;
  String teacher;
  String attendenceType;

  AttendenceDetailsDatum({
    required this.attendenceDate,
    required this.teacher,
    required this.attendenceType,
  });

  factory AttendenceDetailsDatum.fromJson(Map<String, dynamic> json) =>
      AttendenceDetailsDatum(
        attendenceDate: json["attendence_date"],
        teacher: json["teacher"],
        attendenceType: json["attendence_type"],
      );

}
