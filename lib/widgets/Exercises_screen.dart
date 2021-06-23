import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class WorkoutApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Workouts',
      theme: ThemeData(
        
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF232441),
          title: Text('              Workouts Challenges',),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
               // text: 'Tab 1',
                text: "Weight Gain",
              ),
              Tab(
               // text: 'Tab 1',
                text: "Weight Loss",
              ),
              Tab(
               // text: 'Tab 2',
                text: "28 Days Challenge",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
          
        
            
            ],
        ),
      ),
    );
  }
}