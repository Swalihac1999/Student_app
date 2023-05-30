// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../attendance_page/pages/attendance_page.dart';
import '../class timetable/class_timetable.dart';
import '../drawer_page/drawer_page.dart';
import '../profile_page/pages/profile_page.dart';
import '../time_table/time_table.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String? text = 'More';
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      drawer: DrawerScreen(),
      backgroundColor: const Color.fromARGB(255, 46, 58, 80),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 46, 58, 80),
        title: Text(
          'Home',
          style: GoogleFonts.abel(color: Colors.white),
        ),
        actions: const [Icon(Icons.more_vert_rounded)],
      ),
      body: ListView(
        children: [
          SizedBox(
            height: height * 0.03,
          ),
          const CircleAvatar(
            backgroundColor: Color.fromARGB(255, 46, 58, 80),
            radius: 40,
            child: CircleAvatar(
                backgroundColor: Colors.white12,
                radius: 40,
                backgroundImage: NetworkImage(
                    'https://icons.veryicon.com/png/o/internet--web/55-common-web-icons/person-4.png')),
          ),
          Padding(
            padding: EdgeInsets.only(left: width * 0.43, top: height * 0.02),
            child: Text(
              'Swalih',
              style: GoogleFonts.abel(color: Colors.white, fontSize: 20),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: width * 0.85),
            child: TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProfileDetails(),
                      ));
                },
                child: Text(
                  'Details',
                  style: GoogleFonts.actor(
                      color: Colors.white.withOpacity(0.7), fontSize: 12),
                )),
          ),
          const Divider(
            color: Colors.white,
            height: 5,
            indent: 25,
            endIndent: 25,
          ),
          Column(
            children: [
              SizedBox(
                height: height * 0.02,
              ),
              SizedBox(
                height: height * 0.01,
              ),
            ],
          ),
          SizedBox(
            height: height * 0.08,
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: width * 0.14),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AttendancePage()),
                        );
                      },
                      child: Stack(children: [
                        CircleAvatar(
                          backgroundColor: Colors.blue,
                          radius: 40,
                          child: CircleAvatar(
                            radius: 37,
                            backgroundColor: Color.fromARGB(255, 46, 58, 80),
                            child: Icon(
                              Icons.home,
                              size: 50,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: width * 0.15),
                          child: CircleAvatar(
                            radius: 11,
                            backgroundColor: Colors.redAccent,
                            child: Text(
                              '1',
                              style: GoogleFonts.abel(),
                            ),
                          ),
                        )
                      ]),
                    ),
                    SizedBox(
                      height: width * 0.02,
                    ),
                    Text(
                      'Todays Attendance',
                      style: GoogleFonts.abel(color: Colors.white),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: width * 0.16),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Time_table()),
                        );
                      },
                      child: Stack(children: [
                        CircleAvatar(
                          backgroundColor: Colors.blue,
                          radius: 40,
                          child: CircleAvatar(
                              radius: 37,
                              backgroundColor: Color.fromARGB(255, 46, 58, 80),
                              child: Icon(
                                Icons.calendar_month,
                                size: 50,
                              )),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: width * 0.15),
                          child: CircleAvatar(
                            radius: 11,
                            backgroundColor: Colors.redAccent,
                            child: Text(
                              '1',
                              style: GoogleFonts.abel(),
                            ),
                          ),
                        )
                      ]),
                    ),
                    SizedBox(
                      height: width * 0.02,
                    ),
                    Text(
                      'Exam Time Table',
                      style: GoogleFonts.abel(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: height * 0.04,
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: width * 0.14),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ClassTimetable()),
                        );
                      },
                      child: Stack(children: [
                        CircleAvatar(
                          backgroundColor: Colors.blue,
                          radius: 40,
                          child: CircleAvatar(
                              radius: 37,
                              backgroundColor: Color.fromARGB(255, 46, 58, 80),
                              child: Icon(
                                Icons.edit_calendar_rounded,
                                size: 50,
                              )),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: width * 0.15),
                          child: CircleAvatar(
                            radius: 11,
                            backgroundColor: Colors.redAccent,
                            child: Text(
                              '1',
                              style: GoogleFonts.abel(),
                            ),
                          ),
                        )
                      ]),
                    ),
                    SizedBox(
                      height: width * 0.02,
                    ),
                    Text(
                      'Class Time Table ',
                      style: GoogleFonts.abel(color: Colors.white),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: width * .030,
              ),
              Padding(
                padding: EdgeInsets.only(left: width * 0.16),
                child: Column(
                  children: [
                    Stack(children: [
                      CircleAvatar(
                        backgroundColor: Colors.blue,
                        radius: 40,
                        child: CircleAvatar(
                            radius: 37,
                            backgroundColor: Color.fromARGB(255, 46, 58, 80),
                            child: Icon(
                              Icons.window_sharp,
                              size: 50,
                            )),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: width * 0.15),
                        child: CircleAvatar(
                          radius: 11,
                          backgroundColor: Colors.redAccent,
                          child: Text(
                            '1',
                            style: GoogleFonts.abel(),
                          ),
                        ),
                      )
                    ]),
                    SizedBox(
                      height: width * 0.02,
                    ),
                    Text(
                      'Circular ',
                      style: GoogleFonts.abel(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Column details(double width, String text1, String text2) {
    var height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        SizedBox(
          height: height * 0.01,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(left: width * 0.08),
              child: Text(
                text1,
                style: GoogleFonts.actor(color: Colors.white, fontSize: 13),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: width * 0.02),
              child: Text(
                text2,
                style: GoogleFonts.abel(color: Colors.white),
              ),
            ),
          ],
        ),
        SizedBox(
          height: height * 0.01,
        ),
        Divider(
          color: Colors.white.withOpacity(0.5),
          height: 5,
          indent: 25,
          endIndent: 25,
        ),
      ],
    );
  }
}
