import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../profiledetails/fetch.dart';
import '../profiledetails/model.dart';

class ProfileDetails extends StatefulWidget {
  const ProfileDetails({super.key});

  @override
  State<ProfileDetails> createState() => _ProfileDetailsState();
}

String? userid;
Future<String?> getFirmId() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? userid = await prefs.getString('user_id').toString();
  
  print(userid);
  return userid;
}

class _ProfileDetailsState extends State<ProfileDetails> {
  @override
  void initState() {
    super.initState();
    getFirmId().then((value) {
      setState(() {
        userid = value!;
      });
    });
  }

  List<StudentDetailsDatum> data = [];
  final bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 46, 58, 80),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 46, 58, 80),
        title: Text(
          'Profile ',
          style: GoogleFonts.abel(color: Colors.white),
        ),
      ),
      body: FutureBuilder<ProfileData>(
          future: fetchProfiledata(userid.toString()),
          builder: (BuildContext context, AsyncSnapshot<ProfileData> snapshot) {
            if (snapshot.hasData) {
              final data = snapshot.data!.profileData;
              final prefs = SharedPreferences.getInstance();
              return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (BuildContext context, int index) {
                    for (StudentDetailsDatum datum
                        in data[index].studentDetailsData) {
                      return Column(
                        children: [
                          SizedBox(
                            height: height * 0.03,
                          ),
                          CircleAvatar(
                            backgroundColor: Color.fromARGB(255, 46, 58, 80),
                            radius: 40,
                            child: CircleAvatar(
                              radius: 40,
                              backgroundImage:
                                  NetworkImage(datum.studentImage.toString()),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: width * 0.010, top: height * 0.01),
                            child: Text(
                              datum.studentFirstname,
                              style: GoogleFonts.abel(
                                  color: Colors.white, fontSize: 15),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: width * 0.80),
                            child: Text(
                              'More',
                              style: GoogleFonts.actor(
                                  color: Colors.white.withOpacity(0.7),
                                  fontSize: 12),
                            ),
                          ),
                          SizedBox(
                            height: height * 0.02,
                          ),
                          const Divider(
                            color: Colors.white,
                            height: 5,
                            indent: 25,
                            endIndent: 25,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: height * 0.02,
                                ),
                                SizedBox(
                                  height: height * 0.01,
                                ),
                                details(width, 'Roll No', datum.studentRollNo),
                                details(width, 'Class', datum.studentClass),
                                details(width, 'Date Of Birth',
                                    datum.studentDob.toString()),
                                details(
                                    width, 'Addres', datum.studentCurrentAddress),
                                details(width, 'Email', datum.studentEmail),
                                details(width, 'Religion', datum.studentCast),
                                details(width, 'Permanent Address',
                                    datum.studentPermanentAddress),
                                      details(width, 'Student Id',
                                    datum.studentId),
                              ],
                            ),
                          )
                        ],
                      );
                    }
                  });
            } else if (snapshot.hasError) {
              return Center(
                  child: Text(
                "Not a valid date ",
                style: GoogleFonts.abel(color: Colors.white, fontSize: 16),
              ));
            }
            return const Center(child: CircularProgressIndicator());
          }),
    );
  }

// import 'package:flutter/material.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class ProfileDetails extends StatefulWidget {
//   const ProfileDetails({super.key});

//   @override
//   State<ProfileDetails> createState() => _ProfileDetailsState();
// }

// class _ProfileDetailsState extends State<ProfileDetails> {
//   @override
//   Widget build(BuildContext context) {
//     var width = MediaQuery.of(context).size.width;
//     var height = MediaQuery.of(context).size.height;
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 46, 58, 80),
//       appBar: AppBar(
//         backgroundColor: const Color.fromARGB(255, 46, 58, 80),
//         title: Text(
//           'Profile ',
//           style: GoogleFonts.abel(color: Colors.white),
//         ),
//       ),
//       body: ListView(
//         children: [
//           SizedBox(
//             height: height * 0.03,
//           ),
//           const CircleAvatar(
//             backgroundColor: Color.fromARGB(255, 46, 58, 80),
//             radius: 40,
//             child: CircleAvatar(
//                 radius: 40,
//                 backgroundImage: AssetImage('assets/image/download.jpg')),
//           ),
//           Padding(
//             padding: EdgeInsets.only(left: width * 0.40, top: height * 0.02),
//             child: Text(
//               'Swalih',
//               style: GoogleFonts.abel(color: Colors.white, fontSize: 15),
//             ),
//           ),
//           Padding(
//               padding: EdgeInsets.only(left: width * 0.89),
//               child: Text(
//                 'details',
//                 style: GoogleFonts.actor(
//                     color: Colors.white.withOpacity(0.7), fontSize: 12),
//               )),
//           SizedBox(
//             height: height * 0.02,
//           ),
//           const Divider(
//             color: Colors.white,
//             height: 5,
//             indent: 25,
//             endIndent: 25,
//           ),
//           Column(
//             children: [
//               SizedBox(
//                 height: height * 0.02,
//               ),
//               SizedBox(
//                 height: height * 0.01,
//               ),
//               details(width, 'Roll No', '1023'),
//               details(width, 'Class', 'VI'),
//               details(width, 'Date Of Birth', '11/05/1999'),
//               details(width, 'Addres', 'Pulichery(H)'),
//               details(width, 'Email', 'FasalulHaque11@gmail.com'),
//             ],
//           )
//         ],
//       ),
//     );
//   }

//   Column details(double width, String text1, String text2) {
//     var height = MediaQuery.of(context).size.height;
//     return Column(
//       children: [
//         SizedBox(
//           height: height * 0.01,
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Padding(
//               padding: EdgeInsets.only(left: width * 0.08),
//               child: Text(
//                 text1,
//                 style: GoogleFonts.actor(color: Colors.white, fontSize: 13),
//               ),
//             ),
//             Padding(
//               padding: EdgeInsets.only(right: width * 0.02),
//               child: Text(
//                 text2,
//                 style: GoogleFonts.abel(color: Colors.white),
//               ),
//             ),
//           ],
//         ),
//         SizedBox(
//           height: height * 0.01,
//         ),
//         Divider(
//           color: Colors.white.withOpacity(0.5),
//           height: 5,
//           indent: 25,
//           endIndent: 25,
//         ),
//       ],
//     ); 
//   }
// }

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
