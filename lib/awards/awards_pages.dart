import 'package:flutter/material.dart';

class Awards_page extends StatelessWidget {
  const Awards_page({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      
      appBar:  AppBar(
        
        backgroundColor: const Color.fromARGB(255, 46, 58, 80),
        title: Text('Awards'),
      ),
      body: Container(
        height:height*  10 ,
        width: width* 5,
        
        color: Color.fromARGB(255, 215, 214, 214),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.miscellaneous_services_sharp),
            Text('Coming Zoom')
            
          ],
          
        ),
        
      )

    );
  }
}