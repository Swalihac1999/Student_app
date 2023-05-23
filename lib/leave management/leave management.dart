// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class LeaveManagement extends StatefulWidget {
  const LeaveManagement({super.key});

  @override
  State<LeaveManagement> createState() => _LeaveManagementState();
}

class _LeaveManagementState extends State<LeaveManagement> {
  String dropdownvalue = 'Single day';

  var items = [
    'Single day',
    'Multiple day',
  ];

  String? _data1;
  String? _data2;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 46, 58, 80),
        title: Text('Leave Management'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
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
                          tabs: const [
                            Tab(text: 'Request Leave'),
                            Tab(text: 'Leave History'),
                          ],
                        ),
                      ),
                      Container(
                        height: 600, //height of TabBarView
                        decoration: BoxDecoration(
                          border: Border(
                            top: BorderSide(
                              color: Colors.white,
                              width: 0.5,
                            ),
                          ),
                        ),
                        child: TabBarView(
                          children: <Widget>[
                            Column(
                              children: [
                                SizedBox(
                                  height: height * 0.050,
                                ),
                                Container(
                                  height: height * 0.060,
                                  width: width * 0.90,
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 150, 120, 233),
                                  ),
                                  child: DropdownButton(
                                    dropdownColor:
                                        Color.fromARGB(255, 150, 120, 233),
                                    value: dropdownvalue,

                                    icon: const Icon(Icons.keyboard_arrow_down),

                                    // Array list of items
                                    items: items.map((String items) {
                                      return DropdownMenuItem(
                                        value: items,
                                        child: Text(
                                          items,
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      );
                                    }).toList(),
                                    // After selecting the desired option,it will
                                    // change button value to selected value
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        dropdownvalue = newValue!;
                                      });
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: width * 0.060),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                            right: width * 0.65),
                                        child: Text(
                                          'Select Date',
                                          style: TextStyle(
                                              fontWeight: FontWeight.normal,
                                              fontSize: 20),
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Container(
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
                                                    "dd/MM/yyyy",
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
                                                      color: Color.fromARGB(
                                                          255, 68, 68, 68),
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 18,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Container(
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
                                                    "dd/MM/yyyy",
                                                  ).format(
                                                    pickedDate,
                                                  );
                                                  setState(() {
                                                    _data2 =
                                                        formatDate.toString();
                                                    print(_data2.toString() +
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
                                                    _data2.toString(),
                                                    style: TextStyle(
                                                      color: Color.fromARGB(
                                                          255, 68, 68, 68),
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 18,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      TextField(
                                        maxLines: 10,
                                        keyboardType: TextInputType.multiline,
                                        decoration: InputDecoration(
                                            filled: true,
                                            hintText:
                                                'Write your leave reason here...'),
                                      ),
                                      SizedBox(
                                        width: width * 0.90,
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.only(left: width * 0.55),
                                        child: ElevatedButton(
                                          child: Text('Leave Request'),
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.red,
                                          ),
                                          onPressed: () {},
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: width * 0.5,
                                ),
                              ],
                            ),
                            Container(
                              height: height * 5,
                              color: Color.fromARGB(255, 249, 245, 245),
                              child: Column(
                                children: [
                                  leaveHIstory(height, width),
                                  SizedBox(
                                    height: height * 0.020,
                                  ),
                                  leaveHIstory(height, width),
                                  SizedBox(
                                    height: height * 0.020,
                                  ),
                                  leaveHIstory(height, width),
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
          ],
        ),
      ),
    );
  }

  Container leaveHIstory(double height, double width) {
    return Container(
      height: height * 0.2,
      color: Colors.white,
      width: width * 2,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      '12-04-2023',
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(
                      width: width * 0.55,
                    ),
                    Image.asset(
                      'assets/images/pass-removebg-preview.png',
                      height: height * 0.055,
                    ),
                  ],
                ),
                Divider(
                  thickness: 2,
                  height: 1,
                ),
                Padding(
                  padding: EdgeInsets.only(right: width * 0.80),
                  child: Text('Hello'),
                ),
                SizedBox(
                  height: height * 0.035,
                ),
              ],
            ),
          ),
          Divider(
            thickness: 2,
          ),
          Row(
            children: [
              Text('Status  :'),
              Text(
                'Aproved',
                style: TextStyle(color: Colors.green),
              ),
            ],
          )
        ],
      ),
    );
  }
}
