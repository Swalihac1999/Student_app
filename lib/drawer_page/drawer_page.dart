import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:student_app/login_page.dart/login_page.dart';

import '../attendance_page/pages/attendance_page.dart';
import '../awards/awards_pages.dart';
import '../class timetable/class_timetable.dart';
import '../exam result/exam_result.dart';
import '../home_page/home_page.dart';
import '../leave management/leave management.dart';
import '../time_table/time_table.dart';

class DrawerScreen extends StatefulWidget {
  DrawerScreen({
    super.key,
  });

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  String? userid;
  Future<String?> getFirmId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userid = await prefs.getString('user_name').toString();
    print(userid);
    return userid;
  }

  String? useridremove;
  Future<String?> getFirmromveid() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? useridremove = await prefs.remove('user_id').toString();

    return useridremove;
  }

  bool _isShown = true;
  @override
  void initState() {
    super.initState();
    getFirmId().then((value) {
      setState(() {
        userid = value!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Drawer(
        child: Container(
      color: Color.fromARGB(255, 86, 124, 195),
      child: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(top: height * 0.08, right: width * 0.42),
            child: const CircleAvatar(
              backgroundColor: Colors.white,
              radius: 37,
              child: CircleAvatar(
                  radius: 35,
                  backgroundImage: AssetImage('assets/image/download.jpg')),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: width * 0.09, top: height * 0.02),
            child: Text(
              'SWALIH',
              style: GoogleFonts.abel(color: Colors.white, fontSize: 15),
            ),
          ),
          SizedBox(
            height: height * 0.04,
          ),
          Container(
            height: height * 3 / 2.7,
            width: width * 0.33,
            color: const Color.fromARGB(255, 46, 58, 80),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  SizedBox(
                    height: height * 0.02,
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.home,
                      color: Colors.white,
                      size: 23,
                    ),
                    title: Text(
                      'Home ',
                      style:
                          GoogleFonts.abel(color: Colors.white, fontSize: 15),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Home(),
                          ));
                    },
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.mark_chat_read_outlined,
                      color: Colors.white,
                      size: 23,
                    ),
                    title: Text(
                      'Attendance ',
                      style:
                          GoogleFonts.abel(color: Colors.white, fontSize: 15),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AttendancePage(),
                          ));
                    },
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.menu_book_outlined,
                      color: Colors.white,
                      size: 23,
                    ),
                    title: Text(
                      'Exam Time Table ',
                      style:
                          GoogleFonts.abel(color: Colors.white, fontSize: 15),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Time_table(),
                          ));
                    },
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.calendar_today_outlined,
                      color: Colors.white,
                      size: 23,
                    ),
                    title: Text(
                      'Exam Result ',
                      style:
                          GoogleFonts.abel(color: Colors.white, fontSize: 15),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Exam_Result(),
                          ));
                    },
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.table_rows,
                      color: Colors.white,
                      size: 23,
                    ),
                    title: Text(
                      'Class Timetable ',
                      style:
                          GoogleFonts.abel(color: Colors.white, fontSize: 15),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ClassTimetable(),
                          ));
                    },
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.manage_accounts,
                      color: Colors.white,
                      size: 23,
                    ),
                    title: Text(
                      'Leave Management ',
                      style:
                          GoogleFonts.abel(color: Colors.white, fontSize: 15),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LeaveManagement(),
                          ));
                    },
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.auto_awesome_sharp,
                      color: Colors.white,
                      size: 23,
                    ),
                    title: Text(
                      'Awards ',
                      style:
                          GoogleFonts.abel(color: Colors.white, fontSize: 15),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Awards_page(),
                          ));
                    },
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.school_rounded,
                      color: Colors.white,
                      size: 23,
                    ),
                    title: Text(
                      'School Activity ',
                      style:
                          GoogleFonts.abel(color: Colors.white, fontSize: 15),
                    ),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.window_sharp,
                      color: Colors.white,
                      size: 23,
                    ),
                    title: Text(
                      'Circular ',
                      style:
                          GoogleFonts.abel(color: Colors.white, fontSize: 15),
                    ),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.event_note_sharp,
                      color: Colors.white,
                      size: 23,
                    ),
                    title: Text(
                      'News & Events ',
                      style:
                          GoogleFonts.abel(color: Colors.white, fontSize: 15),
                    ),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.person_pin,
                      color: Colors.white,
                      size: 23,
                    ),
                    title: Text(
                      'Subject Teacher ',
                      style:
                          GoogleFonts.abel(color: Colors.white, fontSize: 15),
                    ),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.settings_outlined,
                      color: Colors.white,
                      size: 23,
                    ),
                    title: Text(
                      'Settings ',
                      style:
                          GoogleFonts.abel(color: Colors.white, fontSize: 15),
                    ),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.info,
                      color: Colors.white,
                      size: 23,
                    ),
                    title: Text(
                      'About ',
                      style:
                          GoogleFonts.abel(color: Colors.white, fontSize: 15),
                    ),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.logout_rounded,
                      color: Colors.white,
                      size: 23,
                    ),
                    title: Text(
                      'Logout ',
                      style:
                          GoogleFonts.abel(color: Colors.white, fontSize: 15),
                    ),
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext ctx) {
                            return AlertDialog(
                              title: Text(
                                'Delete',
                                style: GoogleFonts.abel(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                              content: Text(
                                'Are you sure ?',
                                style: GoogleFonts.abel(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w300),
                              ),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                   
                                      getFirmromveid();

                                      Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => Login_page(),
                                        ),
                                        (route) => false,
                                      );
                                    },
                                    child: Text(
                                      'Yes',
                                      style: GoogleFonts.abel(
                                          color: Colors.blue,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    )),
                                TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text(
                                      'No',
                                      style: GoogleFonts.abel(
                                          color: Colors.blue,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ))
                              ],
                            );
                          }).then((value) {
                        setState(() {});
                        Navigator.pop(context);
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
