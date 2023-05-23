// ignore_for_file: sort_child_properties_last, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:student_app/class%20timetable/datail/model.dart';
import 'package:student_app/profile_page/profiledetails/model.dart';

import '../profile_page/profiledetails/fetch.dart';
import 'datail/fech.dart';

class Class_Timetable extends StatefulWidget {
  Class_Timetable({super.key});

  @override
  State<Class_Timetable> createState() => _Class_TimetableState();
}


String? studentclass;

String? division;

String? day;

class _Class_TimetableState extends State<Class_Timetable> {
    List<StudentDetailsDatum> list_class = [];

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
      
      body: 
//       FutureBuilder<Examdata>(
        
//           future: fetchdataClass(
//               studentclass.toString(), division.toString(), day.toString()),
//           builder: (BuildContext context, AsyncSnapshot<Examdata> snapshot) {
//             if (snapshot.hasData) {
//               final data = snapshot.data!.examdata;
// print(studentclass.toString());
//               return ListView.builder(
//                   itemCount: data.length,
//                   itemBuilder: (BuildContext context, int index) {
//                     for (TimetableDetailsDatum datum
//                         in data[index].timetableDetailsData) {
//                           print(datum.startTime);
                      // return 
                      Column(
                        children: <Widget>[
                         
                          ExpansionTile(
                            title: TextButton(
                              onPressed: null,
                              child: Text(
                                'Monday'
                                // datum.subjectName
                                ),
                            ),
                            children: <Widget>[
                              Container(
                                  alignment: Alignment.center,
                                  padding: const EdgeInsets.all(24),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          CircleAvatar(
                                            radius: 27,
                                            backgroundColor: Colors.amber,
                                            child: Text(
                                              'lll',
                                              // datum.subjectName,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
                                            ),
                                          ),
                                          SizedBox(
                                            width: width * 0.070,
                                          ),
                                          CircleAvatar(
                                            radius: 27,
                                            backgroundColor: Colors.amber,
                                            child: Text(
                                              'sce',

                                              // datum.subjectName,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
                                            ),
                                          ),
                                          SizedBox(
                                            width: width * 0.070,
                                          ),
                                          CircleAvatar(
                                            radius: 27,
                                            backgroundColor: Colors.amber,
                                            child: Text(
                                              'ooo',
                                              // datum.subjectName,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
                                            ),
                                          ),
                                          SizedBox(
                                            width: width * 0.070,
                                          ),
                                          CircleAvatar(
                                            radius: 27,
                                            backgroundColor: Colors.amber,
                                            child: Text(
                                              'qqq',

                                              // datum.subjectName,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
                                            ),
                                          )
                                        ],
                                      ),
                                      CircleAvatar(
                                        radius: 27,
                                        backgroundColor: Colors.amber,
                                        child: Text(
                                          'uuu',
                                        //  datum.subjectName,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ],
                                  )),
                            ],
                          ),
                        ],
                      ));
                    }
          //         });
          //   } else if (snapshot.hasError) {
          //     return Center(
          //         child: Text(
          //       "Not a valid date ",
          //       style: GoogleFonts.abel(color: Colors.white, fontSize: 16),
          //     ));
          //   }
          //   return const Center(child: CircularProgressIndicator());
          // }),
  //   Future<bool> getData() async {
  //   final res = await fetchProfiledata();
  //   print(res.toString() + "         lkjsssss");
  //   print(res.profileData[0].studentDetailsData);
  //   if (res.profileData[0].studentDetailsData.isNotEmpty) {
  //     setState(() {
  //       // print(StudentDetailsDatum.className + "       llkddd");
  //       list_class.addAll(res.profileData[0].studentDetailsData);
  //       classDatum = res.numberData[0].classData[0];
  //     });
  //     return true;
  //   } else {
  //     return false;
  //   }
  // }
  
}


