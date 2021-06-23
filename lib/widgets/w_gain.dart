import 'package:flutter/material.dart';
import 'package:workout_app/screens/ex%201.3.dart';
import 'package:workout_app/screens/ex1.1.dart';
import 'package:workout_app/screens/ex1.2.dart';
import 'package:workout_app/screens/ex1.dart';
import 'package:workout_app/screens/ex2.dart';
import 'package:workout_app/screens/ex3.dart';
import 'package:workout_app/screens/ex4.dart';
import 'package:workout_app/screens/ex5.dart';
import 'package:workout_app/screens/ex6.dart';
import 'package:workout_app/screens/ex7.dart';
import 'package:workout_app/screens/ex8.dart';

// import 'details_train_screen.dart';

// ignore: camel_case_types
class weight_gain extends StatefulWidget {
  @override
  _ListState createState() => _ListState();
}

class _ListState extends State<weight_gain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF40D876),
        title: Text("List"),
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios)),
      ),
      body: Container(
          color: Color(0xFF131429),
          child: ListView(
            padding: const EdgeInsets.all(8),
            children: <Widget>[
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "1. Chest Exercises",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 15),
              Card(
                  color: Color(0xFF232441),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.green, width: 3.7),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Stack(children: [
                    Column(
                      children: [
                        ListTile(
                          leading: Text('  Chest press',
                              style:
                                  TextStyle(color: Colors.green, fontSize: 20)),
                        ),
                        ListTile(
                          leading: Text('  Sets : 4',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15)),
                          trailing: GestureDetector(
                            onTap: () {
                               Navigator.push(
                                 context,
                                 MaterialPageRoute(builder: (context) => Diet11()),
                               );
                            },
                            child: Icon(
                              Icons.play_circle_fill_outlined,
                              color: Colors.green,
                              size: 50,
                            ),
                          ),
                        ),
                        ListTile(
                          leading: Text('  Reps in one Set : 16',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15)),
                        ),
                      ],
                    ),
                  ])),
              Card(
                  color: Color(0xFF232441),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.green, width: 3.7),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Stack(children: [
                    Column(
                      children: [
                        ListTile(
                          leading: Text('  Barbell bench press',
                              style:
                                  TextStyle(color: Colors.green, fontSize: 20)),
                        ),
                        ListTile(
                          leading: Text('  Sets : 4',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15)),
                          trailing: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                 context,
                                 MaterialPageRoute(builder: (context) => Diet12()),
                               );
                            },
                            child: Icon(
                              Icons.play_circle_fill_outlined,
                              color: Colors.green,
                              size: 50,
                            ),
                          ),
                        ),
                        ListTile(
                          leading: Text('  Reps in one Set : 16',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15)),
                        ),
                      ],
                    ),
                  ])),
              Card(
                  color: Color(0xFF232441),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.green, width: 3.7),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Stack(children: [
                    Column(
                      children: [
                        ListTile(
                          leading: Text('  Inclined dumbbell flies',
                              style:
                                  TextStyle(color: Colors.green, fontSize: 20)),
                        ),
                        ListTile(
                          leading: Text('  Sets : 4',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15)),
                          trailing: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                 context,
                                 MaterialPageRoute(builder: (context) => Diet13()),
                               );
                            },
                            child: Icon(
                              Icons.play_circle_fill_outlined,
                              color: Colors.green,
                              size: 50,
                            ),
                          ),
                        ),
                        ListTile(
                          leading: Text('  Reps in one Set : 16',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15)),
                        ),
                      ],
                    ),
                  ])),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "2. Back Exercises",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 15),
              Card(
                  color: Color(0xFF232441),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.green, width: 3.7),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Stack(children: [
                    Column(
                      children: [
                        ListTile(
                          leading: Text('  Pullups',
                              style:
                                  TextStyle(color: Colors.green, fontSize: 20)),
                        ),
                        ListTile(
                          leading: Text('  Sets : 4',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15)),
                          trailing: GestureDetector(
                            onTap: () {
                             Navigator.push(
                                 context,
                                 MaterialPageRoute(builder: (context) => Diet21()),
                               );
                            },
                            child: Icon(
                              Icons.play_circle_fill_outlined,
                              color: Colors.green,
                              size: 50,
                            ),
                          ),
                        ),
                        ListTile(
                          leading: Text('  Reps in one Set : 16',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15)),
                        ),
                      ],
                    ),
                  ])),
              Card(
                  color: Color(0xFF232441),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.green, width: 3.7),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Stack(children: [
                    Column(
                      children: [
                        ListTile(
                          leading: Text('  Deadlift',
                              style:
                                  TextStyle(color: Colors.green, fontSize: 20)),
                        ),
                        ListTile(
                          leading: Text('  Sets : 4',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15)),
                          trailing: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                 context,
                                 MaterialPageRoute(builder: (context) => Diet22()),
                               );
                            },
                            child: Icon(
                              Icons.play_circle_fill_outlined,
                              color: Colors.green,
                              size: 50,
                            ),
                          ),
                        ),
                        ListTile(
                          leading: Text('  Reps in one Set : 16',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15)),
                        ),
                      ],
                    ),
                  ])),
              Card(
                  color: Color(0xFF232441),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.green, width: 3.7),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Stack(children: [
                    Column(
                      children: [
                        ListTile(
                          leading: Text('  Bent-Over Row',
                              style:
                                  TextStyle(color: Colors.green, fontSize: 20)),
                        ),
                        ListTile(
                          leading: Text('  Sets : 4',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15)),
                          trailing: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                 context,
                                 MaterialPageRoute(builder: (context) => Diet23()),
                               );
                            },
                            child: Icon(
                              Icons.play_circle_fill_outlined,
                              color: Colors.green,
                              size: 50,
                            ),
                          ),
                        ),
                        ListTile(
                          leading: Text('  Reps in one Set : 16',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15)),
                        ),
                      ],
                    ),
                  ])),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "3. Biceps",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 15),
              Card(
                  color: Color(0xFF232441),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.green, width: 3.7),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Stack(children: [
                    Column(
                      children: [
                        ListTile(
                          leading: Text('  Dumbbell curl',
                              style:
                                  TextStyle(color: Colors.green, fontSize: 20)),
                        ),
                        ListTile(
                          leading: Text('  Sets : 3',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15)),
                          trailing: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                 context,
                                 MaterialPageRoute(builder: (context) => Diet31()),
                               );
                            },
                            child: Icon(
                              Icons.play_circle_fill_outlined,
                              color: Colors.green,
                              size: 50,
                            ),
                          ),
                        ),
                        ListTile(
                          leading: Text('  Reps in one Set : 12',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15)),
                        ),
                      ],
                    ),
                  ])),
              Card(
                  color: Color(0xFF232441),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.green, width: 3.7),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Stack(children: [
                    Column(
                      children: [
                        ListTile(
                          leading: Text('  Cable bar curl',
                              style:
                                  TextStyle(color: Colors.green, fontSize: 20)),
                        ),
                        ListTile(
                          leading: Text('  Sets : 3',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15)),
                          trailing: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                 context,
                                 MaterialPageRoute(builder: (context) => Diet32()),
                               );
                            },
                            child: Icon(
                              Icons.play_circle_fill_outlined,
                              color: Colors.green,
                              size: 50,
                            ),
                          ),
                        ),
                        ListTile(
                          leading: Text('  Reps in one Set : 15',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15)),
                        ),
                      ],
                    ),
                  ])),
              Card(
                  color: Color(0xFF232441),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.green, width: 3.7),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Stack(children: [
                    Column(
                      children: [
                        ListTile(
                          leading: Text('  Hammer Curl',
                              style:
                                  TextStyle(color: Colors.green, fontSize: 20)),
                        ),
                        ListTile(
                          leading: Text('  Sets : 3',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15)),
                          trailing: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                 context,
                                 MaterialPageRoute(builder: (context) => Diet33()),
                               );
                            },
                            child: Icon(
                              Icons.play_circle_fill_outlined,
                              color: Colors.green,
                              size: 50,
                            ),
                          ),
                        ),
                        ListTile(
                          leading: Text('  Reps in one Set : 15',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15)),
                        ),
                      ],
                    ),
                  ])),
              Card(
                  color: Color(0xFF232441),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.green, width: 3.7),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Stack(children: [
                    Column(
                      children: [
                        ListTile(
                          leading: Text('  Cable Hammer Curl',
                              style:
                                  TextStyle(color: Colors.green, fontSize: 20)),
                        ),
                        ListTile(
                          leading: Text('  Sets : 3',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15)),
                          trailing: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                 context,
                                 MaterialPageRoute(builder: (context) => Diet34()),
                               );
                            },
                            child: Icon(
                              Icons.play_circle_fill_outlined,
                              color: Colors.green,
                              size: 50,
                            ),
                          ),
                        ),
                        ListTile(
                          leading: Text('  Reps in one Set : 15',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15)),
                        ),
                      ],
                    ),
                  ])),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "4. Triceps",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 15),
              Card(
                  color: Color(0xFF232441),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.green, width: 3.7),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Stack(children: [
                    Column(
                      children: [
                        ListTile(
                          leading: Text('  Cable Rope Tricep Pushdown',
                              style:
                                  TextStyle(color: Colors.green, fontSize: 20)),
                        ),
                        ListTile(
                          leading: Text('  Sets : 3',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15)),
                          trailing: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                 context,
                                 MaterialPageRoute(builder: (context) => Diet41()),
                               );
                            },
                            child: Icon(
                              Icons.play_circle_fill_outlined,
                              color: Colors.green,
                              size: 50,
                            ),
                          ),
                        ),
                        ListTile(
                          leading: Text('  Reps in one Set : 10',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15)),
                        ),
                      ],
                    ),
                  ])),
              Card(
                  color: Color(0xFF232441),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.green, width: 3.7),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Stack(children: [
                    Column(
                      children: [
                        ListTile(
                          leading: Text('  Cable Rope Tricep Pushdown',
                              style:
                                  TextStyle(color: Colors.green, fontSize: 20)),
                        ),
                        ListTile(
                          leading: Text('  Sets : 3',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15)),
                          trailing: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                 context,
                                 MaterialPageRoute(builder: (context) => Diet42()),
                               );
                            },
                            child: Icon(
                              Icons.play_circle_fill_outlined,
                              color: Colors.green,
                              size: 50,
                            ),
                          ),
                        ),
                        ListTile(
                          leading: Text('  Reps in one Set : 12',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15)),
                        ),
                      ],
                    ),
                  ])),
              Card(
                  color: Color(0xFF232441),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.green, width: 3.7),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Stack(children: [
                    Column(
                      children: [
                        ListTile(
                          leading: Text('  One-Arm Overhead Extension',
                              style:
                                  TextStyle(color: Colors.green, fontSize: 20)),
                        ),
                        ListTile(
                          leading: Text('  Sets : 3',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15)),
                          trailing: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                 context,
                                 MaterialPageRoute(builder: (context) => Diet43()),
                               );
                            },
                            child: Icon(
                              Icons.play_circle_fill_outlined,
                              color: Colors.green,
                              size: 50,
                            ),
                          ),
                        ),
                        ListTile(
                          leading: Text('  Reps in one Set : 12',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15)),
                        ),
                      ],
                    ),
                  ])),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "5. Traps Exercises ",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 15),
              Card(
                  color: Color(0xFF232441),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.green, width: 3.7),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Stack(children: [
                    Column(
                      children: [
                        ListTile(
                          leading: Text('  Shrugs',
                              style:
                                  TextStyle(color: Colors.green, fontSize: 20)),
                        ),
                        ListTile(
                          leading: Text('  Sets : 3',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15)),
                          trailing: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                 context,
                                 MaterialPageRoute(builder: (context) => Diet51()),
                               );
                            },
                            child: Icon(
                              Icons.play_circle_fill_outlined,
                              color: Colors.green,
                              size: 50,
                            ),
                          ),
                        ),
                        ListTile(
                          leading: Text('  Reps in one Set : 10',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15)),
                        ),
                      ],
                    ),
                  ])),
              Card(
                  color: Color(0xFF232441),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.green, width: 3.7),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Stack(children: [
                    Column(
                      children: [
                        ListTile(
                          leading: Text('  Barbell Deadlift',
                              style:
                                  TextStyle(color: Colors.green, fontSize: 20)),
                        ),
                        ListTile(
                          leading: Text('  Sets : 3',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15)),
                          trailing: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                 context,
                                 MaterialPageRoute(builder: (context) => Diet52()),
                               );
                            },
                            child: Icon(
                              Icons.play_circle_fill_outlined,
                              color: Colors.green,
                              size: 50,
                            ),
                          ),
                        ),
                        ListTile(
                          leading: Text('  Reps in one Set : 12',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15)),
                        ),
                      ],
                    ),
                  ])),
              Card(
                  color: Color(0xFF232441),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.green, width: 3.7),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Stack(children: [
                    Column(
                      children: [
                        ListTile(
                          leading: Text('  Upright Rows',
                              style:
                                  TextStyle(color: Colors.green, fontSize: 20)),
                        ),
                        ListTile(
                          leading: Text('  Sets : 3',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15)),
                          trailing: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                 context,
                                 MaterialPageRoute(builder: (context) => Diet53()),
                               );
                            },
                            child: Icon(
                              Icons.play_circle_fill_outlined,
                              color: Colors.green,
                              size: 50,
                            ),
                          ),
                        ),
                        ListTile(
                          leading: Text('  Reps in one Set : 12',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15)),
                        ),
                      ],
                    ),
                  ])),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "6. Abs Exercises ",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 15),
              Card(
                  color: Color(0xFF232441),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.green, width: 3.7),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Stack(children: [
                    Column(
                      children: [
                        ListTile(
                          leading: Text('  Hanging Knee Raise',
                              style:
                                  TextStyle(color: Colors.green, fontSize: 20)),
                        ),
                        ListTile(
                          leading: Text('  Sets : 3',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15)),
                          trailing: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                 context,
                                 MaterialPageRoute(builder: (context) => Diet61()),
                               );
                            },
                            child: Icon(
                              Icons.play_circle_fill_outlined,
                              color: Colors.green,
                              size: 50,
                            ),
                          ),
                        ),
                        ListTile(
                          leading: Text('  Reps in one Set : 10',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15)),
                        ),
                      ],
                    ),
                  ])),
              Card(
                  color: Color(0xFF232441),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.green, width: 3.7),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Stack(children: [
                    Column(
                      children: [
                        ListTile(
                          leading: Text('  Dumbbell Side Bend',
                              style:
                                  TextStyle(color: Colors.green, fontSize: 20)),
                        ),
                        ListTile(
                          leading: Text('  Sets : 3',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15)),
                          trailing: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                 context,
                                 MaterialPageRoute(builder: (context) => Diet62()),
                               );
                            },
                            child: Icon(
                              Icons.play_circle_fill_outlined,
                              color: Colors.green,
                              size: 50,
                            ),
                          ),
                        ),
                        ListTile(
                          leading: Text('  Reps in one Set : 12',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15)),
                        ),
                      ],
                    ),
                  ])),
              Card(
                  color: Color(0xFF232441),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.green, width: 3.7),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Stack(children: [
                    Column(
                      children: [
                        ListTile(
                          leading: Text('  Barbell Back Squats',
                              style:
                                  TextStyle(color: Colors.green, fontSize: 20)),
                        ),
                        ListTile(
                          leading: Text('  Sets : 3',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15)),
                          trailing: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                 context,
                                 MaterialPageRoute(builder: (context) => Diet63()),
                               );
                            },
                            child: Icon(
                              Icons.play_circle_fill_outlined,
                              color: Colors.green,
                              size: 50,
                            ),
                          ),
                        ),
                        ListTile(
                          leading: Text('  Reps in one Set : 12',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15)),
                        ),
                      ],
                    ),
                  ])),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "7. Glutes",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 15),
              Card(
                  color: Color(0xFF232441),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.green, width: 3.7),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Stack(children: [
                    Column(
                      children: [
                        ListTile(
                          leading: Text('  Weighted Squats',
                              style:
                                  TextStyle(color: Colors.green, fontSize: 20)),
                        ),
                        ListTile(
                          leading: Text('  Sets : 3',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15)),
                          trailing: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                 context,
                                 MaterialPageRoute(builder: (context) => Diet71()),
                               );
                            },
                            child: Icon(
                              Icons.play_circle_fill_outlined,
                              color: Colors.white,
                              size: 50,
                            ),
                          ),
                        ),
                        ListTile(
                          leading: Text('  Reps in one Set : 12',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15)),
                        ),
                      ],
                    ),
                  ])),
              Card(
                  color: Color(0xFF232441),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.green, width: 3.7),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Stack(children: [
                    Column(
                      children: [
                        ListTile(
                          leading: Text('  Barbell Hip Thrust',
                              style:
                                  TextStyle(color: Colors.green, fontSize: 20)),
                        ),
                        ListTile(
                          leading: Text('  Sets : 3',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15)),
                          trailing: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                 context,
                                 MaterialPageRoute(builder: (context) => Diet72()),
                               );
                            },
                            child: Icon(
                              Icons.play_circle_fill_outlined,
                              color: Colors.green,
                              size: 50,
                            ),
                          ),
                        ),
                        ListTile(
                          leading: Text('  Reps in one Set : 15',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15)),
                        ),
                      ],
                    ),
                  ])),
              Card(
                  color: Color(0xFF232441),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.green, width: 3.7),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Stack(children: [
                    Column(
                      children: [
                        ListTile(
                          leading: Text('  Hip Thrust',
                              style:
                                  TextStyle(color: Colors.green, fontSize: 20)),
                        ),
                        ListTile(
                          leading: Text('  Sets : 3',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15)),
                          trailing: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                 context,
                                 MaterialPageRoute(builder: (context) => Diet73()),
                               );
                            },
                            child: Icon(
                              Icons.play_circle_fill_outlined,
                              color: Colors.green,
                              size: 50,
                            ),
                          ),
                        ),
                        ListTile(
                          leading: Text('  Reps in one Set : 15',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15)),
                        ),
                      ],
                    ),
                  ])),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "8. Triceps",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 15),
              Card(
                  color: Color(0xFF232441),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.green, width: 3.7),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Stack(children: [
                    Column(
                      children: [
                        ListTile(
                          leading: Text('  Drop Lunges',
                              style:
                                  TextStyle(color: Colors.green, fontSize: 20)),
                        ),
                        ListTile(
                          leading: Text('  Sets : 3',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15)),
                          trailing: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                 context,
                                 MaterialPageRoute(builder: (context) => Diet81()),
                               );
                            },
                            child: Icon(
                              Icons.play_circle_fill_outlined,
                              color: Colors.green,
                              size: 50,
                            ),
                          ),
                        ),
                        ListTile(
                          leading: Text('  Reps in one Set : 15',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15)),
                        ),
                      ],
                    ),
                  ])),
              Card(
                  color: Color(0xFF232441),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.green, width: 3.7),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Stack(children: [
                    Column(
                      children: [
                        ListTile(
                          leading: Text('  Barbell Back Squats',
                              style:
                                  TextStyle(color: Colors.green, fontSize: 20)),
                        ),
                        ListTile(
                          leading: Text('  Sets : 3',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15)),
                          trailing: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                 context,
                                 MaterialPageRoute(builder: (context) => Diet82()),
                               );
                            },
                            child: Icon(
                              Icons.play_circle_fill_outlined,
                              color: Colors.green,
                              size: 50,
                            ),
                          ),
                        ),
                        ListTile(
                          leading: Text('  Reps in one Set : 15',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15)),
                        ),
                      ],
                    ),
                  ])),
              Card(
                  color: Color(0xFF232441),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.green, width: 3.7),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Stack(children: [
                    Column(
                      children: [
                        ListTile(
                          leading: Text('  Front Squats',
                              style:
                                  TextStyle(color: Colors.green, fontSize: 20)),
                        ),
                        ListTile(
                          leading: Text('  Sets : 3',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15)),
                          trailing: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                 context,
                                 MaterialPageRoute(builder: (context) => Diet83()),
                               );
                            },
                            child: Icon(
                              Icons.play_circle_fill_outlined,
                              color: Colors.green,
                              size: 50,
                            ),
                          ),
                        ),
                        ListTile(
                          leading: Text('  Reps in one Set : 15',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15)),
                        ),
                      ],
                    ),
                  ]))
            ],
          )),
    );
  }
}
