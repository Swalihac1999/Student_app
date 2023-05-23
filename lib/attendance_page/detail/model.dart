// To parse this JSON data, do
//
//     final attadenceDetails = attadenceDetailsFromJson(jsonString);

import 'dart:convert';

List<AttadenceDetails> attadenceDetailsFromJson(String str) =>
    List<AttadenceDetails>.from(
        json.decode(str).map((x) => AttadenceDetails.fromJson(x)));

//  String attadenceDetailsToJson(List<AttadenceDetails> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

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

  // Map<String, dynamic> toJson() => {
  //     "api_status": apiStatus,
  //     "attendence_details_data": List<dynamic>.from(attendenceDetailsData.map((x) => x.toJson())),
  // };
}

class AttendenceDetailsDatum {
  //  String attendenceDate

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

  Map<String, dynamic> toJson() => {
        // "attendence_date":attendenceDate,
        "attendence_date":attendenceDate,
            // "${attendenceDate.year.toString().padLeft(4, '0')}-${attendenceDate.month.toString().padLeft(2, '0')}-${attendenceDate.day.toString().padLeft(2, '0')}",
        "teacher": teacher,
        "attendence_type": attendenceType,
      };
}








































// import 'dart:convert';

// List<AttadenceDetails> attadenceDetailsFromJson(String str) => List<AttadenceDetails>.from(json.decode(str).map((x) => AttadenceDetails.fromJson(x)));

// String attadenceDetailsToJson(List<AttadenceDetails> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
// class AttadenceData{
//   List<AttadenceDetails> attadenceData;

//   AttadenceData({
//     required this.attadenceData});

//   factory AttadenceData.fromJson(List<dynamic> json) =>
//       AttadenceData(
//           attadenceData:json.map((e) => AttadenceDetails.fromJson(e)).toList()
//       );
// }
// class AttadenceDetails {
//     String apiStatus;
//     List<AttendenceDetailsDatum> attendenceDetailsData;
    
    

//     AttadenceDetails({
//         required this.apiStatus,
//         required this.attendenceDetailsData,
//     });

//     factory AttadenceDetails.fromJson(Map<String, dynamic> json) => AttadenceDetails(
//         apiStatus: json["api_status"],
//         attendenceDetailsData: List<AttendenceDetailsDatum>.from(json["attendence_details_data"].map((x) => AttendenceDetailsDatum.fromJson(x))),
//     );

//     Map<String, dynamic> toJson() => {
//         "api_status": apiStatus,
//         "attendence_details_data": List<dynamic>.from(attendenceDetailsData.map((x) => x.toJson())),
//     };
// }

// class AttendenceDetailsDatum {
//     String attendenceDate;
//     String teacher;
//     String attendenceType;

//     AttendenceDetailsDatum({
//         required this.attendenceDate,
//         required this.teacher,
//         required this.attendenceType,
//     });

//     factory AttendenceDetailsDatum.fromJson(Map<String, dynamic> json) => AttendenceDetailsDatum(
//         attendenceDate: json["attendence_date"],
//         teacher: json["teacher"],
//         attendenceType: json["attendence_type"],
//     );

//     Map<String, dynamic> toJson() => {
//         "attendence_date": attendenceDate,
//         "teacher": teacher,
//         "attendence_type": attendenceType,
//     };
// }
