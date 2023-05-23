import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Exam_Result extends StatefulWidget {
  Exam_Result({super.key});

  @override
  State<Exam_Result> createState() => _Exam_ResultState();
}

class _Exam_ResultState extends State<Exam_Result> {
  String? dropdownValue;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 231, 231, 231),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 46, 58, 80),
        title: Text('Exam Result'),
      ),
      body: Column(
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
          Container(
            color: Color.fromARGB(255, 170, 18, 7),
            height: height * 0.10,
            width: width * 0.97,
            child: Row(
              children: [
                SizedBox(
                  width: width * 0.098,
                ),
                Text(
                  'Subject',
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(
                  width: width * 0.099,
                ),
                Text(
                  'Mark',
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(
                  width: width * 0.099,
                ),
                Text(
                  'Out of',
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(
                  width: width * 0.099,
                ),
                Text(
                  'Grade',
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
          ),
          SizedBox(
            height: height * 0.01,
          ),
          Result(height, width),
          SizedBox(
            height: height * 0.01,
          ),
          Result(height, width),
           SizedBox(
            height: height * 0.01,
          ),
          Result(height, width),
          SizedBox(
            height: height * 0.010,
          ),
         
        ],
      ),
    );
  }

  Container Result(double height, double width) {
    return Container(
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
              SizedBox(
                width: width * 0.098,
              ),
              Padding(
                padding: EdgeInsets.only(left: width * 0.020),
                child: Container(
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.amberAccent,
                        child: Text(
                          'scn',
                        ),
                      ),
                         SizedBox(
                        width: width * 0.3/2
                      ),
                      Text(
                        '22',
                        style: TextStyle(
                            color: Color.fromARGB(255, 150, 147, 147),
                            fontSize: 15),
                      ),
                         SizedBox(
                        width: width * 0.3/2
                      ),
                      Text(
                        '100',
                        style: TextStyle(
                            color: Color.fromARGB(255, 150, 147, 147),
                            fontSize: 15),
                      ),
                      SizedBox(
                        width: width * 0.3/2
                      ),
                      Text(
                        'C+',
                        style: TextStyle(
                            color: Color.fromARGB(255, 150, 147, 147),
                            fontSize: 15),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
  }
}
