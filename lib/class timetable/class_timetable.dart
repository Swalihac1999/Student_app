// ignore_for_file: sort_child_properties_last, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:student_app/class%20timetable/datail/model.dart';
import 'package:student_app/profile_page/profiledetails/model.dart';

import '../profile_page/profiledetails/fetch.dart';
import 'datail/fech.dart';

class ClassTimetable extends StatefulWidget {
  ClassTimetable({super.key});

  @override
  State<ClassTimetable> createState() => _ClassTimetableState();
}

String? studentclass;

String? division;

String? day;
// Future<String?> getFirmId() async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   String? userid = await prefs.getString('user_id').toString();

//   print(userid);
//   return userid;
// }

class _ClassTimetableState extends State<ClassTimetable> {
  List<StudentDetailsDatum> list_class = [];
  bool _obsecuretext = true;
  void _toggle() {
    setState(() {
      _obsecuretext = !_obsecuretext;
    });
  }

  // StudentDetailsDatum classDatum = StudentDetailsDatum(studentClass: "1",studentDiv:"1" );

  TextEditingController expandController = TextEditingController();

// void initState() {
//     super.initState();
//     getFirmclass().then((value) {
//       setState(() {
//         studentclass = value!;
//       });
//     });
  //  super.initState();
  // getFirmdiv().then((value) {
  //   setState(() {
  //     division = value!;
  //   });
  // });

  //   super.initState();
  // getFirmday().then((value) {
  //   setState(() {
  //     day = value!;
  //   });
  // });
  // }

  void showToast() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  bool _isVisible = false;

  void showToastExam() {
    setState(() {
      _isVisible1 = !_isVisible1;
    });
  }

  bool _isVisible1 = false;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 227, 226, 226),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 46, 58, 80),
          title: Text('Class Timetable'),
        ),
        body: Column(
          children: [
            //  ExpansionTile(
            //                       title: TextButton(
            //                         onPressed: null,
            //                         child: Text('monday'),
            //                       ),),

            FutureBuilder<Examdata>(
                future: fetchdataClass('1', '1', 'monday'),
                builder:
                    (BuildContext context, AsyncSnapshot<Examdata> snapshot) {
                  if (snapshot.hasData) {
                    final data =
                        snapshot.data!.examdata[0].timetableDetailsData;
                    print(data.toString() + 'hnhnhnhnhnhnnhnhnhn');
                    print(studentclass.toString());
                    return Expanded(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    _toggle();

                                    setState(() {
                                      _isVisible1 = !_isVisible1;
                                    });
                                  },
                                  icon: Icon(_obsecuretext
                                      ? Icons.keyboard_arrow_down_rounded
                                      : Icons.keyboard_arrow_up_rounded)),
                              TextButton(
                                  onPressed: () {
                                    setState(() {
                                      _isVisible1 = !_isVisible1;
                                    });
                                    _toggle();
                                  },
                                  child: Text(
                                    'Monday',
                                    style: TextStyle(color: Colors.black),
                                  )),
                            ],
                          ),
                          Expanded(
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: data.length,
                                itemBuilder: (BuildContext context, int index) {
                                  print(data[index].startTime + '  ksjdd');
                                  // for (TimetableDetailsDatum datum
                                  //     in data[index].timetableDetailsData) {
                                  // print(
                                  //   data.length,
                                  // );
                                  return Column(
                                    children: [
                                      Visibility(
                                          visible: _isVisible1,
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                left: width * 0.05),
                                            child: Column(
                                              children: [
                                                Divider(
                                                  thickness: 6,
                                                  color: Colors.black,
                                                  height: 4,
                                                ),
                                                CircleAvatar(
                                                    backgroundColor: Colors.red,
                                                    radius: 31,
                                                    child: Text(data[index]
                                                        .subjectName)),
                                                Divider(
                                                  thickness: 6,
                                                  color: Colors.black,
                                                  height: 4,
                                                ),
                                              ],
                                            ),
                                          )),
                                      // ExpansionTile(

                                      //   title: TextButton(
                                      //     onPressed: null,
                                      //     child: Padding(
                                      //       padding:  EdgeInsets.only(right: 210),
                                      //       child: Text('monday'),
                                      //     ),

                                      //   ),

                                      //   ),
                                      // Text(data[index].startTime),
                                      // ExpansionTile(
                                      //   title: TextButton(
                                      //     onPressed: null,
                                      //     child: Padding(
                                      //       padding:  EdgeInsets.only(right: 210),
                                      //       child: Text('monday'),
                                      //     ),
                                      //   ),
                                      //   children: <Widget>[
                                      //     Container(
                                      //         alignment: Alignment.center,
                                      //         padding: const EdgeInsets.all(24),
                                      //         child: Column(
                                      //           children: [
                                      //             Row(
                                      //               children: [
                                      //                 CircleAvatar(
                                      //                   radius: 30,
                                      //                   backgroundColor: Colors.redAccent,
                                      //                   child: Text(
                                      //                    data[index].subjectName,
                                      //                     // datum.subjectName,
                                      //                     style: TextStyle(
                                      //                         fontWeight: FontWeight.bold,
                                      //                         color: Colors.white),
                                      //                   ),
                                      //                 ),
                                      //                 SizedBox(
                                      //                   width: width * 0.070,
                                      //                 ),
                                      //                 CircleAvatar(
                                      //                   radius: 27,
                                      //                   backgroundColor: Colors.amber,
                                      //                   child: Text(
                                      //                     'sce',

                                      //                     // datum.subjectName,
                                      //                     style: TextStyle(
                                      //                         fontWeight: FontWeight.bold,
                                      //                         color: Colors.white),
                                      //                   ),
                                      //                 ),
                                      //                 SizedBox(
                                      //                   width: width * 0.070,
                                      //                 ),
                                      //                 CircleAvatar(
                                      //                   radius: 27,
                                      //                   backgroundColor: Colors.amber,
                                      //                   child: Text(
                                      //                     'ooo',
                                      //                     // datum.subjectName,
                                      //                     style: TextStyle(
                                      //                         fontWeight: FontWeight.bold,
                                      //                         color: Colors.white),
                                      //                   ),
                                      //                 ),
                                      //                 SizedBox(
                                      //                   width: width * 0.070,
                                      //                 ),
                                      //                 CircleAvatar(
                                      //                   radius: 27,
                                      //                   backgroundColor: Colors.amber,
                                      //                   child: Text(
                                      //                     'qqq',

                                      //                     // datum.subjectName,
                                      //                     style: TextStyle(
                                      //                         fontWeight: FontWeight.bold,
                                      //                         color: Colors.white),
                                      //                   ),
                                      //                 )
                                      //               ],
                                      //             ),
                                      //             SizedBox(height: height * 0.020 ,),
                                      //             Row(
                                      //               children: [
                                      //                 CircleAvatar(
                                      //                   radius: 30,
                                      //                   backgroundColor: Colors.redAccent,
                                      //                   child: Text(
                                      //                    data[index].subjectName,
                                      //                     // datum.subjectName,
                                      //                     style: TextStyle(
                                      //                         fontWeight: FontWeight.bold,
                                      //                         color: Colors.white),
                                      //                   ),
                                      //                 ),
                                      //                 SizedBox(
                                      //                   width: width * 0.070,
                                      //                 ),
                                      //                 CircleAvatar(
                                      //                   radius: 27,
                                      //                   backgroundColor: Colors.amber,
                                      //                   child: Text(
                                      //                     'sce',

                                      //                     // datum.subjectName,
                                      //                     style: TextStyle(
                                      //                         fontWeight: FontWeight.bold,
                                      //                         color: Colors.white),
                                      //                   ),
                                      //                 ),
                                      //                 SizedBox(
                                      //                   width: width * 0.070,
                                      //                 ),
                                      //                 CircleAvatar(
                                      //                   radius: 27,
                                      //                   backgroundColor: Colors.amber,
                                      //                   child: Text(
                                      //                     'ooo',
                                      //                     // datum.subjectName,
                                      //                     style: TextStyle(
                                      //                         fontWeight: FontWeight.bold,
                                      //                         color: Colors.white),
                                      //                   ),
                                      //                 ),
                                      //                 SizedBox(
                                      //                   width: width * 0.070,
                                      //                 ),
                                      //                 CircleAvatar(
                                      //                   radius: 27,
                                      //                   backgroundColor: Colors.amber,
                                      //                   child: Text(
                                      //                     'qqq',

                                      //                     // datum.subjectName,
                                      //                     style: TextStyle(
                                      //                         fontWeight: FontWeight.bold,
                                      //                         color: Colors.white),
                                      //                   ),
                                      //                 )
                                      //               ],
                                      //             ),
                                      //           ],
                                      //         )),
                                      //   ],
                                      // ),
                                    ],
                                  );
                                }
                                //}
                                ),
                          ),
                        ],
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                        child: Text(
                      "Not a valid date ",
                      style: GoogleFonts.abel(
                          color: Color.fromARGB(255, 24, 23, 23), fontSize: 16),
                    ));
                  }
                  return const Center(child: CircularProgressIndicator());
                }),
          ],
        ));
  }
}
