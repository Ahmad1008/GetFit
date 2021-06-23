import 'package:flutter/material.dart';

class Diet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
            backgroundColor: Color(0xFF40D876),
            title: Text('Video'),
            leading: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(Icons.arrow_back_ios)),
          ),
            body: Center(
                child: Image.asset("assets/images/pullup.gif",
                    fit: BoxFit.fill))));
  }
}
