// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:student_app/attendance_page/detail/atte_fetch.dart';
import 'package:student_app/attendance_page/detail/model.dart';
import 'package:student_app/attendance_page/detail/model.dart';
import 'package:student_app/profile_page/profiledetails/model.dart';

import '../detail/model.dart';
import '../detail/model.dart';
import '../detail/model.dart';

class Attendance_page extends StatefulWidget {
  const Attendance_page({super.key});

  @override
  State<Attendance_page> createState() => _Attendance_pageState();
}

Future<String?> getFirmId() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? userid = await prefs.getString('user_id').toString();

  print(userid);
  return userid;
}

class _Attendance_pageState extends State<Attendance_page> {
  List<AttendenceDetailsDatum> list_class = [];

  // AttendenceDetailsDatum classDatum = AttendenceDetailsDatum(attendenceDate: d, attendenceType: "0", teacher: "0");

  TextEditingController _data1controller = TextEditingController();
  TextEditingController _data2controller = TextEditingController();
  TextEditingController _data3controller = TextEditingController();
  TextEditingController _userIdcontroller = TextEditingController();
  TextEditingController _fromcontroller = TextEditingController();
  TextEditingController _tocontroller = TextEditingController();

  String? _data1;
  String? _data2;
  String? _data3;

  String? userid;
  Future<String?> getFirmId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userid = await prefs.getString('user_id').toString();
    print(userid);
    return userid;
  }

  String? from;
  String? to;
  @override
  void initState() {
    super.initState();
    getFirmId().then((value) {
      setState(() {
        userid = value!;
      });
    });
  }

  // List<AttendenceDetailsDatum> data = [];
  // bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 46, 58, 80),
        title: Text('Attendance'),
      ),
      body: Column(
        children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                DefaultTabController(
                  length: 2, // length of tabs
                  initialIndex: 0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Container(
                        color: Colors.red,
                        child: TabBar(
                          unselectedLabelColor: Colors.black,
                          tabs: [
                            Tab(text: 'Single day'),
                            Tab(text: 'Multiple day 2'),
                          ],
                        ),
                      ),
                      Container(
                        height: 400, //height of TabBarView
                        decoration: BoxDecoration(
                          border: Border(
                            top: BorderSide(
                              color: Colors.grey,
                              width: 0.5,
                            ),
                          ),
                        ),
                        child: TabBarView(
                          children: <Widget>[
                            Container(
                              height: height * 1,
                              width: width * 3,
                              color: Colors.white,
                              child: Column(
                                children: [
                                  Container(
                                    height: height * 0.3,
                                    width: width * 4,
                                    color: Color.fromARGB(255, 150, 120, 233),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: height * 0.090,
                                          ),
                                          Text(
                                            'if you want to check another attendance details, selet the date and check. ',
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.white),
                                          ),
                                          SizedBox(
                                            height: height * 0.015,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                right: width * 0.40),
                                            child: Container(
                                              width: width * 0.90,
                                              height: height * 0.05,
                                              color: Colors.black12,
                                              child: IntrinsicHeight(
                                                child: Row(
                                                  children: [
                                                    Image.asset(
                                                      'assets/images/pass-removebg-preview.png',
                                                      height: 25,
                                                    ),
                                                    Text(
                                                      'Present',
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    ),
                                                    VerticalDivider(
                                                      thickness: 1,
                                                      color: Colors.white,
                                                    ),
                                                    Image.asset(
                                                        'assets/images/fail-removebg-preview.png'),
                                                    Text(
                                                      'Absent',
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    ),
                                                    SizedBox(
                                                      height: height * 0.020,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: height * 0.02,
                                                right: width * 0.5),
                                            child: Container(
                                              height: height * 0.05,
                                              width: width * 0.44,
                                              child: GestureDetector(
                                                onTap: () async {
                                                  DateTime? pickedDate =
                                                      await showDatePicker(
                                                    context: context,
                                                    initialDate: DateTime.now(),
                                                    firstDate: DateTime(2000),
                                                    lastDate: DateTime(2050),
                                                  );
                                                  if (pickedDate != null) {
                                                    String formatDate =
                                                        DateFormat(
                                                      "yyyy-MM-dd",
                                                    ).format(
                                                      pickedDate,
                                                    );
                                                    setState(() {
                                                      _data1 =
                                                          formatDate.toString();
                                                      print(_data1.toString() +
                                                          "hhhhhhhhhhhhhhh"
                                                              .toString());
                                                    });
                                                  } else {}
                                                },
                                                child: Row(
                                                  children: [
                                                    SizedBox(
                                                      width: width * 0.01,
                                                    ),
                                                    Text(
                                                      _data1.toString(),
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 18,
                                                      ),
                                                    ),
                                                    IconButton(
                                                        onPressed: () {
                                                          attendanceFetch(
                                                              userid.toString(),
                                                              _data1!
                                                                  .toString(),
                                                              to.toString());
                                                        },
                                                        icon: Icon(
                                                            Icons
                                                                .calendar_month,
                                                            color:
                                                                Colors.white))
                                                  ],
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: width * 2,
                                    height: height * 0.040,
                                    color: Colors.black12,
                                    child: Text(
                                      'Attendance Details',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ),
                                  SizedBox(
                                    height: height * 0.090,
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.only(left: width * 0.060),
                                    child: Container(
                                      child: Row(
                                        children: [
                                          Text(
                                            '22 oct 2002',
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 150, 147, 147),
                                                fontWeight: FontWeight.bold,
                                                fontSize: 23),
                                          ),
                                          SizedBox(
                                            width: width * 0.5,
                                          ),
                                          Image.asset(
                                            'assets/images/pass-removebg-preview.png',
                                            height: 25,
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              height: height * 1,
                              color: Colors.white,
                              child: Column(
                                children: [
                                  Container(
                                    height: height * 0.3,
                                    width: width * 4,
                                    color: Color.fromARGB(255, 150, 120, 233),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: height * 0.090,
                                          ),
                                          Text(
                                            'if you want to check another attendance details, selet the date and check. ',
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.white),
                                          ),
                                          SizedBox(
                                            height: height * 0.015,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                right: width * 0.40),
                                            child: Container(
                                              width: width * 0.90,
                                              height: height * 0.05,
                                              color: Colors.black12,
                                              child: IntrinsicHeight(
                                                child: Row(
                                                  children: [
                                                    Image.asset(
                                                      'assets/images/pass-removebg-preview.png',
                                                      height: 25,
                                                    ),
                                                    Text(
                                                      'present',
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    ),
                                                    VerticalDivider(
                                                      thickness: 1,
                                                      color: Colors.white,
                                                    ),
                                                    Image.asset(
                                                        'assets/images/fail-removebg-preview.png'),
                                                    Text(
                                                      'Absent',
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    ),
                                                    SizedBox(
                                                      height: height * 0.020,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    left: width * 0.020),
                                                child: Expanded(
                                                  child: Container(
                                                    height: height * 0.05,
                                                    width: width * 0.44,
                                                    child: GestureDetector(
                                                      onTap: () async {
                                                        DateTime? pickedDate =
                                                            await showDatePicker(
                                                          context: context,
                                                          initialDate:
                                                              DateTime.now(),
                                                          firstDate:
                                                              DateTime(2000),
                                                          lastDate:
                                                              DateTime(2050),
                                                        );
                                                        if (pickedDate !=
                                                            null) {
                                                          String formatDate =
                                                              DateFormat(
                                                            "yyyy-MM-dd",
                                                          ).format(
                                                            pickedDate,
                                                          );
                                                          setState(() {
                                                            _data2 = formatDate
                                                                .toString();
                                                          });
                                                        } else {}
                                                      },
                                                      child: Row(
                                                        children: [
                                                          SizedBox(
                                                            width: width * 0.01,
                                                          ),
                                                          Text(
                                                            _data2.toString(),
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 18,
                                                            ),
                                                          ),
                                                          IconButton(
                                                            onPressed: () {
                                                              attendanceFetch(
                                                                  userid
                                                                      .toString(),
                                                                  _data2!
                                                                      .toString(),
                                                                  to.toString());
                                                            },
                                                            icon: Icon(
                                                                Icons
                                                                    .calendar_month,
                                                                color: Colors
                                                                    .white),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    left: width * 0.020),
                                                child: Container(
                                                  height: height * 0.05,
                                                  width: width * 0.44,
                                                  child: GestureDetector(
                                                    onTap: () async {
                                                      DateTime? pickedDate =
                                                          await showDatePicker(
                                                        context: context,
                                                        initialDate:
                                                            DateTime.now(),
                                                        firstDate:
                                                            DateTime(2000),
                                                        lastDate:
                                                            DateTime(2050),
                                                      );
                                                      if (pickedDate != null) {
                                                        String formatDate =
                                                            DateFormat(
                                                          "yyyy-MM-dd",
                                                        ).format(
                                                          pickedDate,
                                                        );
                                                        setState(() {
                                                          _data3 = formatDate
                                                              .toString();
                                                        });
                                                      } else {}
                                                    },
                                                    child: Row(
                                                      children: [
                                                        SizedBox(
                                                          width: width * 0.01,
                                                        ),
                                                        Text(
                                                          _data3.toString(),
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 18,
                                                          ),
                                                        ),
                                                        IconButton(
                                                          onPressed: () {
                                                            attendanceFetch(
                                                              userid.toString(),
                                                              _data3!
                                                                  .toString(),
                                                              to.toString(),
                                                            );
                                                          },
                                                          icon: Icon(
                                                              Icons
                                                                  .calendar_month,
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: width * 2,
                                    height: height * 0.040,
                                    color: Colors.black12,
                                    child: Text(
                                      'Attendance Details',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ),
                                  SizedBox(
                                    height: height * 0.018,
                                  ),
                                  Flexible(
                                    child: FutureBuilder<AttadenceData>(
                                      future: attendanceFetch(
                                        userid.toString(),
                                        '2023-05-22',
                                        '2023-05-22',
                                      ),
                                      builder: (BuildContext context,
                                          AsyncSnapshot<AttadenceData>
                                              snapshot) {
                                        // print(snapshot.data!.attadenceData.length.toString()+
                                        // "mmmmmmmmmmmmmmmmmmmmmmmmmmm");
                                        print("kkkkkkkkkkkkkkkkkkkkkk");
                                        if (snapshot.data!.attadenceData[0]
                                                .apiStatus ==
                                            "1") {
                                          print("mmmmmmmmmmmmmmmmmmmmmmmmmmm");
                                          final data = snapshot
                                              .data!
                                              .attadenceData[0]
                                              .attendenceDetailsData;
                                          print(data.toString() +
                                              'ddddddddddddddddddddddddddd');
                                          print(data!.length.toString() +
                                              "yyyyyyyyyyyyyyyyyyyyyyyyy9999");

                                          return ListView.builder(
                                            itemCount: data!.length,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              print(data[index]
                                                      .attendenceType
                                                      .toString() +
                                                  '    5555555555599');
                                              return Padding(
                                                padding: EdgeInsets.only(
                                                    left: width * 0.020),
                                                child: Container(
                                                  height: height * 2,
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                        data[index]
                                                            .attendenceDate
                                                            .toString(),
                                                        style: TextStyle(
                                                            color: Color
                                                                .fromARGB(
                                                                    255,
                                                                    150,
                                                                    147,
                                                                    147),
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 23),
                                                      ),
                                                      SizedBox(
                                                        width: width * 0.5,
                                                      ),
                                                      Image.asset(
                                                        'assets/images/pass-removebg-preview.png',
                                                        height: 25,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                        } else if (snapshot.data!.attadenceData[0].apiStatus=='0') {
                                          print('swalih.........kkkkkkkkkk');
                                          return Center(
                                              child: Text(
                                            "Not a valid date ",
                                            style: GoogleFonts.abel(
                                                color: Colors.white,
                                                fontSize: 16),
                                          ));
                                        }
                                        return Center(
                                            child: CircularProgressIndicator());
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Divider(
                                      thickness: 1,
                                      color: Colors.black26,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  // Future<bool> getData() async {
  //   final res = await attendanceFetch(userid.toString(),
  //                                       from.toString(),
  //                                       to.toString(),);
  //   // print(res.toString() + "         lkjsssss");
  //   // print(res.numberData[0].classData);
  //   if (res.attadenceData[0].attendenceDetailsData!.isNotEmpty) {
  //     setState(() {
  //       // print(classDatum.className + "       llkddd");
  //       list_class.addAll(res.attadenceData[0].attendenceDetailsData);
  //       divisionDatum = res.attadenceData[0].divisionData[0];
  //     });
  //     return true;
  //   } else {
  //     return false;
  //   }
  // }
}
