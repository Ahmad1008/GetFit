import 'package:flutter/material.dart';
class Diet22 extends StatelessWidget {
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
                child: Image.asset("assets/images/2.2.gif",
                    fit: BoxFit.fill))));
  }
}
class Diet21 extends StatelessWidget {
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
                child: Image.asset("assets/images/2.1.gif",
                    fit: BoxFit.fill))));
  }
}

class Diet24 extends StatelessWidget {
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
                child: Image.asset("assets/images/2.4.gif",
                    fit: BoxFit.fill))));
  }
}
class Diet23 extends StatelessWidget {
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
                child: Image.asset("assets/images/2.3.gif",
                    fit: BoxFit.fill))));
  }
}
