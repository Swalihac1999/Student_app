// To parse this JSON data, do
//
//     final studentsDetails = studentsDetailsFromJson(jsonString);

import 'dart:convert';

List<StudentsDetails> studentsDetailsFromJson(String str) => List<StudentsDetails>.from(json.decode(str).map((x) => StudentsDetails.fromJson(x)));

String studentsDetailsToJson(List<StudentsDetails> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
class ProfileData{
  List<StudentsDetails> profileData;

  ProfileData({
    required this.profileData});

  factory ProfileData.fromJson(List<dynamic> json) =>
      ProfileData(
          profileData:json.map((e) => StudentsDetails.fromJson(e)).toList()
      );
}

class StudentsDetails {
    String apiStatus;
    List<StudentDetailsDatum> studentDetailsData;

    StudentsDetails({
        required this.apiStatus,
        required this.studentDetailsData,
    });

    factory StudentsDetails.fromJson(Map<String, dynamic> json) => StudentsDetails(
        apiStatus: json["api_status"],
        studentDetailsData: List<StudentDetailsDatum>.from(json["student_details_data"].map((x) => StudentDetailsDatum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "api_status": apiStatus,
        "student_details_data": List<dynamic>.from(studentDetailsData.map((x) => x.toJson())),
    };
}

class StudentDetailsDatum {
    String studentId;
    String studentRollNo;
    String studentAdmissionNo;
    String studentFirstname;
    dynamic studentMiddlename;
    String studentLastname;
    String studentImage;
    String studentMobileno;
    String studentEmail;
    dynamic studentState;
    dynamic studentCity;
    dynamic studentPincode;
    String studentReligion;
    String studentCast;
    String studentDob;
    String studentGender;
    String studentCurrentAddress;
    String studentPermanentAddress;
    String studentClass;
    String studentDiv;

    StudentDetailsDatum({
        required this.studentId,
        required this.studentRollNo,
        required this.studentAdmissionNo,
        required this.studentFirstname,
        this.studentMiddlename,
        required this.studentLastname,
        required this.studentImage,
        required this.studentMobileno,
        required this.studentEmail,
        this.studentState,
        this.studentCity,
        this.studentPincode,
        required this.studentReligion,
        required this.studentCast,
        required this.studentDob,
        required this.studentGender,
        required this.studentCurrentAddress,
        required this.studentPermanentAddress,
        required this.studentClass,
        required this.studentDiv,
    });

    factory StudentDetailsDatum.fromJson(Map<String, dynamic> json) => StudentDetailsDatum(
        studentId: json["student_id"],
        studentRollNo: json["student_roll_no"],
        studentAdmissionNo: json["student_admission_no"],
        studentFirstname: json["student_firstname"],
        studentMiddlename: json["student_middlename"],
        studentLastname: json["student_lastname"],
        studentImage: json["student_image"],
        studentMobileno: json["student_mobileno"],
        studentEmail: json["student_email"],
        studentState: json["student_state"],
        studentCity: json["student_city"],
        studentPincode: json["student_pincode"],
        studentReligion: json["student_religion"],
        studentCast: json["student_cast"],
        studentDob: json["student_dob"],
        studentGender: json["student_gender"],
        studentCurrentAddress: json["student_current_address"],
        studentPermanentAddress: json["student_permanent_address"],
        studentClass: json["student_class"],
        studentDiv: json["student_div"],
    );

    Map<String, dynamic> toJson() => {
        "student_id": studentId,
        "student_roll_no": studentRollNo,
        "student_admission_no": studentAdmissionNo,
        "student_firstname": studentFirstname,
        "student_middlename": studentMiddlename,
        "student_lastname": studentLastname,
        "student_image": studentImage,
        "student_mobileno": studentMobileno,
        "student_email": studentEmail,
        "student_state": studentState,
        "student_city": studentCity,
        "student_pincode": studentPincode,
        "student_religion": studentReligion,
        "student_cast": studentCast,
        "student_dob": studentDob,
        "student_gender": studentGender,
        "student_current_address": studentCurrentAddress,
        "student_permanent_address": studentPermanentAddress,
        "student_class": studentClass,
        "student_div": studentDiv,
    };
}





































// To parse this JSON data, do
//
//     final studentsDetails = studentsDetailsFromJson(jsonString);

// import 'dart:convert';

// List<StudentsDetails> studentsDetailsFromJson(String str) => List<StudentsDetails>.from(json.decode(str).map((x) => StudentsDetails.fromJson(x)));

// String studentsDetailsToJson(List<StudentsDetails> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
// class ProfileData{
//   List<StudentsDetails> profileData;

//   ProfileData({
//     required this.profileData});

//   factory ProfileData.fromJson(List<dynamic> json) =>
//       ProfileData(
//           profileData:json.map((e) => StudentsDetails.fromJson(e)).toList()
//       );
// }

// class StudentsDetails {
//     String apiStatus;
//     List<StudentDetailsDatum> studentDetailsData;

//     StudentsDetails({
//         required this.apiStatus,
//         required this.studentDetailsData,
//     });

//     factory StudentsDetails.fromJson(Map<String, dynamic> json) => StudentsDetails(
//         apiStatus: json["api_status"],
//         studentDetailsData: List<StudentDetailsDatum>.from(json["student_details_data"].map((x) => StudentDetailsDatum.fromJson(x))),
//     );

//     Map<String, dynamic> toJson() => {
//         "api_status": apiStatus,
//         "student_details_data": List<dynamic>.from(studentDetailsData.map((x) => x.toJson())),
//     };
// }

// class StudentDetailsDatum {
//     String studentId;
//     String studentRollNo;
//     String studentAdmissionNo;
//     String studentFirstname;
//     dynamic studentMiddlename;
//     String studentLastname;
//     String studentImage;
//     String studentMobileno;
//     String studentEmail;
//     dynamic studentState;
//     dynamic studentCity;
//     dynamic studentPincode;
//     String studentReligion;
//     String studentCast;
//     DateTime studentDob;
//     String studentGender;
//     String studentCurrentAddress;
//     String studentPermanentAddress;

//     StudentDetailsDatum({
//         required this.studentId,
//         required this.studentRollNo,
//         required this.studentAdmissionNo,
//         required this.studentFirstname,
//         this.studentMiddlename,
//         required this.studentLastname,
//         required this.studentImage,
//         required this.studentMobileno,
//         required this.studentEmail,
//         this.studentState,
//         this.studentCity,
//         this.studentPincode,
//         required this.studentReligion,
//         required this.studentCast,
//         required this.studentDob,
//         required this.studentGender,
//         required this.studentCurrentAddress,
//         required this.studentPermanentAddress,
//     });

//     factory StudentDetailsDatum.fromJson(Map<String, dynamic> json) => StudentDetailsDatum(
//         studentId: json["student_id"],
//         studentRollNo: json["student_roll_no"],
//         studentAdmissionNo: json["student_admission_no"],
//         studentFirstname: json["student_firstname"],
//         studentMiddlename: json["student_middlename"],
//         studentLastname: json["student_lastname"],
//         studentImage: json["student_image"],
//         studentMobileno: json["student_mobileno"],
//         studentEmail: json["student_email"],
//         studentState: json["student_state"],
//         studentCity: json["student_city"],
//         studentPincode: json["student_pincode"],
//         studentReligion: json["student_religion"],
//         studentCast: json["student_cast"],
//         studentDob: DateTime.parse(json["student_dob"]),
//         studentGender: json["student_gender"],
//         studentCurrentAddress: json["student_current_address"],
//         studentPermanentAddress: json["student_permanent_address"],
//     );

//     Map<String, dynamic> toJson() => {
//         "student_id": studentId,
//         "student_roll_no": studentRollNo,
//         "student_admission_no": studentAdmissionNo,
//         "student_firstname": studentFirstname,
//         "student_middlename": studentMiddlename,
//         "student_lastname": studentLastname,
//         "student_image": studentImage,
//         "student_mobileno": studentMobileno,
//         "student_email": studentEmail,
//         "student_state": studentState,
//         "student_city": studentCity,
//         "student_pincode": studentPincode,
//         "student_religion": studentReligion,
//         "student_cast": studentCast,
//         "student_dob": "${studentDob.year.toString().padLeft(4, '0')}-${studentDob.month.toString().padLeft(2, '0')}-${studentDob.day.toString().padLeft(2, '0')}",
//         "student_gender": studentGender,
//         "student_current_address": studentCurrentAddress,
//         "student_permanent_address": studentPermanentAddress,
//     };
// }
