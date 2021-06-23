import 'package:flutter/material.dart';

class diet extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<diet> {
  int index = 0;
  List<Widget> _widgets = [screen1(), screen2()];
  tapped(int tappedIndex) {
    setState(() {
      index = tappedIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: _widgets[index],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: index,
          onTap: tapped,
          items: [
            BottomNavigationBarItem(
                icon: new Icon(Icons.looks_one), 
                title: Text('Weight Gain')
                ),
            BottomNavigationBarItem(
                icon: new Icon(Icons.looks_two), 
                title: Text('Weight Lose')
                ),
          ],
        ),
      ),
    );
  }
}

screen1() {
  return Container(
      child: Image.asset("assets/images/aa.jpg", fit: BoxFit.fill));
}

screen2() {
  return Container(
      child: Image.asset("assets/images/bb.jpg", fit: BoxFit.fill));
}
