import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../detail/atte_fetch.dart';
import '../detail/model.dart';

class SingleDay extends StatefulWidget {
  const SingleDay({super.key});

  @override
  State<SingleDay> createState() => _SingleDayState();
}

class _SingleDayState extends State<SingleDay> {
  String? _data1;
  String? to;

  bool cmbscritta = true;
  bool pressGeoON = false;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
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
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                  SizedBox(
                    height: height * 0.015,
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: width * 0.40),
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
                              style: TextStyle(color: Colors.white),
                            ),
                            VerticalDivider(
                              thickness: 1,
                              color: Colors.white,
                            ),
                            Image.asset(
                                'assets/images/fail-removebg-preview.png'),
                            Text(
                              'Absent',
                              style: TextStyle(color: Colors.white),
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
                    padding:
                        EdgeInsets.only(top: height * 0.02, right: width * 0.5),
                    child: Container(
                      height: height * 0.05,
                      width: width * 0.70,
                      child: GestureDetector(
                        onTap: () async {
                          setState(() => pressGeoON = !pressGeoON);
                          setState(() => cmbscritta = !cmbscritta);

                          DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2050),
                          );
                          if (pickedDate != null) {
                            String formatDate = DateFormat(
                              "yyyy-MM-dd",
                            ).format(
                              pickedDate,
                            );
                            setState(() {
                              _data1 = formatDate.toString();
                            });
                          } else {}
                        },
                        child: Row(
                          children: [
                            SizedBox(
                              width: width * 0.01,
                            ),
                            cmbscritta
                                ? Text(
                                    "Select the date",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  )
                                : Text(_data1.toString()),
                            IconButton(
                                onPressed: () {
                                  // attendanceFetch(
                                  //     userid.toString(),
                                  //     _data1!
                                  //         .toString(),
                                  //     to.toString());
                                },
                                icon: Icon(Icons.calendar_month,
                                    color: Colors.white))
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
            height: height * 0.010,
          ),
          Expanded(
            child: FutureBuilder<AttadenceData>(
                future: attendanceFetch(
                  '1',
                  _data1.toString(),
                  to.toString(),
                ),
                builder: (BuildContext context,
                    AsyncSnapshot<AttadenceData> snapshot) {
                  if (snapshot.data!.attadenceData[0].apiStatus == '1') {
                    final data =
                        snapshot.data!.attadenceData[0].attendenceDetailsData;

                    return ListView.builder(
                        itemCount: data!.length,
                        itemBuilder: (BuildContext context, int index) {
                          print(data[index].attendenceDate.toString() +
                              '     0 0000000pppppp00');
                          return Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(right: width * 0.020),
                                child: Container(
                                    // height: height * 2,
                                    child: Row(
                                  children: [
                                    Text(
                                      data[index].attendenceDate,
                                      style: TextStyle(
                                          color: Color.fromARGB(255, 150, 147, 147),
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
                                )),
                              ),
                              Divider(thickness: 1,)
                            ],
                          );
                          // Padding(
                          //   padding: EdgeInsets.only(
                          //       left: width * 0.060),
                          //   child: Container(
                          //     child: Row(
                          //       children: [
                          //         Text(
                          //         data[index]
                          //               .attendenceDate,
                          //           style: TextStyle(
                          //               color: Color
                          //                   .fromARGB(
                          //                       255,
                          //                       150,
                          //                       147,
                          //                       147),
                          //               fontWeight:
                          //                   FontWeight
                          //                       .bold,
                          //               fontSize: 23),
                          //         ),
                          //         SizedBox(
                          //           width: width * 0.5,
                          //         ),
                          //         Image.asset(
                          //           'assets/images/pass-removebg-preview.png',
                          //           height: 25,
                          //         ),
                          //       ],
                          //     ),
                          //   ),
                          // );
                        });
                  } else if (snapshot.data!.attadenceData[0].apiStatus == '0') {
                    print('swalih.........kkkkkkkkkk');
                    return Center(
                        child: Text(
                      "Not a valid date ",
                      style:
                          GoogleFonts.abel(color: Colors.white, fontSize: 16),
                    ));
                  }
                  return Center(child: CircularProgressIndicator());
                }),
          )
        ],
      ),
    );
  }
}
