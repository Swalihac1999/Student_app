import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

class Time_table extends StatefulWidget {
  const Time_table({super.key});

  @override
  State<Time_table> createState() => _Time_tableState();
}

class _Time_tableState extends State<Time_table> {
  String? dropdownValue;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 231, 231, 231),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 46, 58, 80),
        title: Text('Exam Time Table'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: Color.fromARGB(255, 150, 120, 233),
                height: height * 0.15,
                width: width * 0.97,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: height * 0.015,
                        right: width * 0.8,
                      ),
                      child: Text(
                        'Roll No :',
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    DropdownButtonFormField<String>(
                      icon: Padding(
                        padding: EdgeInsets.only(right: width * 0.10),
                        child: const Icon(Icons.arrow_drop_down),
                      ),
                      decoration: InputDecoration(),
                      elevation: 0,
                      hint: Text(
                        'Select Class',
                        style:
                            GoogleFonts.abel(fontSize: 16, color: Colors.black),
                      ),
                      value: dropdownValue,
                      items: <String>[
                        'Sum Exam',
                        'Onam Exam',
                        'Mid Term Exam',
                        'Final Exam'
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: GoogleFonts.abel(fontSize: 15),
                          ),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownValue = newValue!;
                        });
                      },
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: Color.fromARGB(255, 170, 18, 7),
                height: height * 0.10,
                width: width * 0.97,
                child: Row(
                  children: [
                    SizedBox(
                      width: width * 0.030,
                    ),
                    Text(
                      'subject',
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(width: width * 0.3),
                    Text(
                      'Date',
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      width: width * 0.3,
                    ),
                    Text(
                      'Time',
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ),
            ),
            exmdetails(height, width, Colors.redAccent),
            exmdetails(height, width, Colors.amberAccent),
            exmdetails(height, width, Colors.orangeAccent),
            exmdetails(height, width, Colors.greenAccent),
            exmdetails(height, width, Colors.purpleAccent),
            exmdetails(height, width, Colors.grey),

            // Container(
            //   height: height * 0.10,
            //   width: width * 0.97,
            //   decoration: BoxDecoration(
            //     color: Colors.white,
            //     boxShadow: [
            //       BoxShadow(
            //         color: Colors.grey.withOpacity(0.2),
            //         spreadRadius: 5,
            //         blurRadius: 7,
            //         offset: Offset(0, 3),
            //       ),
            //     ],
            //   ),
            //   child: Row(
            //     children: [
            //       Padding(
            //         padding: EdgeInsets.only(left: width * 0.020),
            //         child: Container(
            //           child: Row(
            //             children: [
            //               CircleAvatar(
            //                 backgroundColor: Colors.amberAccent,
            //                 child: Text(
            //                   's',
            //                 ),
            //               ),
            //               Padding(
            //                 padding: EdgeInsets.only(left: width * 0.3 / 1),
            //                 child: Text(
            //                   '22 oct 2002',
            //                   style: TextStyle(
            //                       color: Color.fromARGB(255, 150, 147, 147),
            //                       fontSize: 15),
            //                 ),
            //               ),
            //               SizedBox(
            //                 width: width * 0.2,
            //               ),
            //               Text('10-12')
            //             ],
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // )
          ],
        ),
      ),
    );
  }

  Padding exmdetails(double height, double width, Color color) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: height * 0.10,
        width: width * 0.97,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: width * 0.020),
              child: Container(
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: color,
                      child: Text(
                        's',
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: width * 0.3 / 1),
                      child: Text(
                        '22 oct 2002',
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
                    ),
                    SizedBox(
                      width: width * 0.2,
                    ),
                    Text('10-12')
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
