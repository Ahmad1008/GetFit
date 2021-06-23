import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:workout_app/constants.dart';
import 'package:provider/provider.dart';
import 'package:workout_app/database/database.dart';
import 'package:workout_app/widgets/w_gain.dart';

// ignore: camel_case_types
class table extends StatefulWidget {
  @override
  _DataTableExample createState() => _DataTableExample();
}

class _DataTableExample extends State<table> {
  void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text(" Update"),
          content: new Text("Data Updated Successfully"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Ok"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
  final firestoreInstance = FirebaseFirestore.instance;
  String name;
  String t1s1,t1s2,t1s3,t1s4,t2s1,t2s2,t2s3,t2s4,t3s1,t3s2,t3s3,t3s4,
      t4s1,t4s2,t4s3,t4s4,t5s1,t5s2,t5s3,t5s4,
      t6s1,t6s2,t6s3,t6s4,t7s1,t7s2,t7s3,t7s4,t8s1,t8s2,t8s3,t8s4;
  String t1r1,t1r2,t1r3,t1r4,t2r1,t2r2,t2r3,t2r4,t3r1,t3r2,t3r3,t3r4,
      t4r1,t4r2,t4r3,t4r4,t5r1,t5r2,t5r3,t5r4,
      t6r1,t6r2,t6r3,t6r4,t7r1,t7r2,t7r3,t7r4,t8r1,t8r2,t8r3,t8r4;

  final _text = TextEditingController();
  bool _validate = false;
  @override
  void dispose() {
    _text.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: kFirstColor,
            title: Text('Flutter DataTable Example'),
          ),
          body: ListView(children: <Widget>[
            SizedBox(height: 30),
            Center(
                child: Text(
              'Track your Progress',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            )),
            SizedBox(height: 30),
            Center(
                child: Text(
              'Chest Exercises',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            )),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 30, vertical: 20),),
            // ignore: deprecated_member_use
            RaisedButton(
                onPressed: (){

                  var firebaseUser =  FirebaseAuth.instance.currentUser;
    firestoreInstance.collection("users").doc(firebaseUser.uid).set(
    {
    "1) Chest Exercises" : {
    "Chest Press": {"Sets": '$t1s1', "Reps": '$t1r1',},
      "Bareball Bench Press": { "Sets": '$t1s2', "Reps": '$t1r2'},
      "Cable Crossover": { "Sets": '$t1s3', "Reps": '$t1r3'},
      "Dumb bell bench press": { "Sets": '$t1s4', "Reps": '$t1r4'},
    },
    },SetOptions(merge: true)).then((_){
    print("success!");
    });
                  var User =  FirebaseAuth.instance.currentUser;
                  firestoreInstance.collection("users").doc(User.uid).get().then((value){
                    print(value.data());
                  });
                  _showDialog();
    },

                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0)
                ),
                elevation: 0.0,
                padding: EdgeInsets.all(0.0),
                child: Ink(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.centerRight,
                        end: Alignment.centerLeft,
                        colors: [Colors.green,Colors.blue]
                    ),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Container(
                    constraints: BoxConstraints(maxWidth: 100.0, minHeight: 20.0),
                    alignment: Alignment.center,
                    child: Text("Update",
                      style: TextStyle(color: Colors.white, fontSize: 16.0, fontWeight:FontWeight.w300),
                    ),
                  ),
                )
            ),


            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 20, vertical: 20),),
            DataTable(
              columns: [
                DataColumn(
                    label: Text('Exercises',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold))),
                DataColumn(
                    label: Text('Sets',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold))),
                DataColumn(
                    label: Text('Reps',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold))),
                DataColumn(
                    label: Text('Play ',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold))),
              ],
              rows: [
                DataRow(cells: [
                  DataCell(Text('Chest press')),
                  DataCell(TextField( onChanged: (value) {t1s1 = value;print("Sets:: $value");
                  })),
                  DataCell(TextField(onChanged: (value) {t1r1 = value;print("Reps:: $value");
                  })),
                  DataCell(
                    IconButton(
                      icon: Icon(Icons.play_circle_fill_outlined),
                      iconSize: 30,
                      color: Colors.green.shade400,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => weight_gain()));
                      },
                    ),
                  ),

                ]
                ),
                DataRow(cells: [
                  DataCell(Text('Barbell bench press')),
                  DataCell(TextField(onChanged: (value) {t1s2 = value;print("Sets:: $value");
                  })),
                  DataCell(TextField(onChanged: (value) {t1r2 =value;print("Reps:: $value");
                  })),
                  DataCell(
                    IconButton(
                      icon: Icon(Icons.play_circle_fill_outlined),
                      iconSize: 30,
                      color: Colors.green.shade400,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => weight_gain()));
                      },
                    ),
                  ),
                ]),
                DataRow(cells: [
                  DataCell(Text('Cable Crossover')),
                  DataCell(TextField(onChanged: (value) {t1s3 = value;print("Sets:: $value");
                  })),
                  DataCell(TextField(onChanged: (value) {t1r3 = value;print("Reps:: $value");
                  })),
                  DataCell(
                    IconButton(
                      icon: Icon(Icons.play_circle_fill_outlined),
                      iconSize: 30,
                      color: Colors.green.shade400,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => weight_gain()));
                      },
                    ),
                  ),
                ]),
                DataRow(cells: [
                  DataCell(Text('Dumbbell Bench Press')),
                  DataCell(TextField(onChanged: (value) {t1s4 = value;print("Sets:: $value");
                  })),
                  DataCell(TextField(onChanged: (value) {t1r4 = value;print("Reps:: $value");
                  })),
                  DataCell(
                    IconButton(
                      icon: Icon(Icons.play_circle_fill_outlined),
                      iconSize: 30,
                      color: Colors.green.shade400,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => weight_gain()));

                      },
                    ),
                  ),
                ]),
              ],
            ),
            SizedBox(height: 30),
            Center(
                child: Text(
              'Back Exercises',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            )),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 30, vertical: 20),),
            // ignore: deprecated_member_use
            RaisedButton(
                onPressed: (){
                  var firebaseUser =  FirebaseAuth.instance.currentUser;
                  firestoreInstance.collection("users").doc(firebaseUser.uid).set(
                      {
                        "2) Back Exercises" : {
                          "Dead Lift" : {"Sets":'$t2s1',"Reps":'$t2r1'},
                          "Row":{ "Sets":'$t2s2',"Reps":'$t2r2'},
                          "Inverted Row":{ "Sets":'$t2s3',"Reps":'$t2r3'},
                          "Lat Pull Down":{ "Sets":'$t2s4',"Reps":'$t2r4'},
                        },
                      },SetOptions(merge: true)).then((_){
                    print("success!");
                  });

                  _showDialog();
                },

                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0)
                ),
                elevation: 0.0,
                padding: EdgeInsets.all(0.0),
                child: Ink(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.centerRight,
                        end: Alignment.centerLeft,
                        colors: [Colors.green,Colors.blue]
                    ),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Container(
                    constraints: BoxConstraints(maxWidth: 100.0, minHeight: 20.0),
                    alignment: Alignment.center,
                    child: Text("Update",
                      style: TextStyle(color: Colors.white, fontSize: 16.0, fontWeight:FontWeight.w300),
                    ),
                  ),
                )
            ),


            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 20, vertical: 20),),
            DataTable(
              columns: [
                DataColumn(
                    label: Text('Exercises',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold))),
                DataColumn(
                    label: Text('Sets',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold))),
                DataColumn(
                    label: Text('Reps',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold))),
                DataColumn(
                    label: Text('Video',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold))),
              ],
              rows: [
                DataRow(cells: [
                  DataCell(Text('Deadlift')),
                  DataCell(TextField(onChanged: (value) {t2s1 = value;print("Sets:: $value");
                  })),
                  DataCell(TextField(onChanged: (value) {t2r1 = value;print("Reps:: $value");
                  })),
                  DataCell(
                    IconButton(
                      icon: Icon(Icons.play_circle_fill_outlined),
                      iconSize: 30,
                      color: Colors.green.shade400,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => weight_gain()));
                      },
                    ),
                  ),
                ]),
                DataRow(cells: [
                  DataCell(Text('Row')),
                  DataCell(TextField(onChanged: (value) {t2s2 = value;print("Sets:: $value");
                  })),
                  DataCell(TextField(onChanged: (value) {t2r2 = value ;print("Reps:: $value");
                  })),
                  DataCell(
                    IconButton(
                      icon: Icon(Icons.play_circle_fill_outlined),
                      iconSize: 30,
                      color: Colors.green.shade400,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => weight_gain()));
                      },
                    ),
                  ),
                ]),
                DataRow(cells: [
                  DataCell(Text('Inverted Row')),
                  DataCell(TextField(onChanged: (value) {t2s3 = value;print("Sets:: $value");
                  })),
                  DataCell(TextField(onChanged: (value) {t2r3 = value ;print("Reps:: $value");
                  })),
                  DataCell(
                    IconButton(
                      icon: Icon(Icons.play_circle_fill_outlined),
                      iconSize: 30,
                      color: Colors.green.shade400,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => weight_gain()));
                      },
                    ),
                  ),
                ]),
                DataRow(cells: [
                  DataCell(Text('Lat Pulldown')),
                  DataCell(TextField(onChanged: (value) {t2s4 = value;print("Sets:: $value");
                  })),
                  DataCell(TextField(onChanged: (value) {t2r4 = value;print("Reps:: $value");
                  })),
                  DataCell(
                    IconButton(
                      icon: Icon(Icons.play_circle_fill_outlined),
                      iconSize: 30,
                      color: Colors.green.shade400,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => weight_gain()));
                      },
                    ),
                  ),
                ]),
              ],
            ),
            SizedBox(height: 30),
            Center(
                child: Text(
              'Biceps Exercises',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            )),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 30, vertical: 20),),
            // ignore: deprecated_member_use
            RaisedButton(
                onPressed: (){
                  var firebaseUser =  FirebaseAuth.instance.currentUser;
                  firestoreInstance.collection("users").doc(firebaseUser.uid).set(
                      {
                        "3) Biceps Exercises": {
                          "Preacher Curl" : {"Sets":'$t3s1',"Reps":'$t3r1'},
                          "Incline dumbBell Curl":{ "Sets":'$t3s2',"Reps":'$t3r2'},
                          "DumbBell Hammer Curl":{ "Sets":'$t3s3',"Reps":'$t3r3'},
                          "Cable Bar Curl":{ "Sets":'$t3s4',"Reps":'$t3r4'},
                        }
                      },SetOptions(merge: true)).then((_){
                    print("success!");
                  });
                  _showDialog();

                },

                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0)
                ),
                elevation: 0.0,
                padding: EdgeInsets.all(0.0),
                child: Ink(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.centerRight,
                        end: Alignment.centerLeft,
                        colors: [Colors.green,Colors.blue]
                    ),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Container(
                    constraints: BoxConstraints(maxWidth: 100.0, minHeight: 20.0),
                    alignment: Alignment.center,
                    child: Text("Update",
                      style: TextStyle(color: Colors.white, fontSize: 16.0, fontWeight:FontWeight.w300),
                    ),
                  ),
                )
            ),


            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 20, vertical: 20),),
            DataTable(
              columns: [
                DataColumn(
                    label: Text('Exercises',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold))),
                DataColumn(
                    label: Text('Sets',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold))),
                DataColumn(
                    label: Text('Reps',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold))),
                DataColumn(
                    label: Text('Video',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold))),
              ],
              rows: [
                DataRow(cells: [
                  DataCell(Text('Preacher Curl')),
                  DataCell(TextField(onChanged: (value) {t3s1 = value;print("Sets:: $value");
                  })),
                  DataCell(TextField(onChanged: (value) {t3r1 = value;print("Reps:: $value");
                  })),
                  DataCell(
                    IconButton(
                      icon: Icon(Icons.play_circle_fill_outlined),
                      iconSize: 30,
                      color: Colors.green.shade400,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => weight_gain()));
                      },
                    ),
                  ),
                ]),
                DataRow(cells: [
                  DataCell(Text('Incline Dumbbell Curl')),
                  DataCell(TextField(onChanged: (value) {t3s2 = value;print("Sets:: $value");
                  })),
                  DataCell(TextField(onChanged: (value) {t3r2 = value;print("Reps:: $value");
                  })),
                  DataCell(
                    IconButton(
                      icon: Icon(Icons.play_circle_fill_outlined),
                      iconSize: 30,
                      color: Colors.green.shade400,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => weight_gain()));;
                      },
                    ),
                  ),
                ]),
                DataRow(cells: [
                  DataCell(Text('Dumbbell Hammer Curl')),
                  DataCell(TextField(onChanged: (value) {t3s3 = value;print("Sets:: $value");
                  })),
                  DataCell(TextField(onChanged: (value) {t3r3= value;print("Reps:: $value");
                  })),
                  DataCell(
                    IconButton(
                      icon: Icon(Icons.play_circle_fill_outlined),
                      iconSize: 30,
                      color: Colors.green.shade400,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => weight_gain()));
                      },
                    ),
                  ),
                ]),
                DataRow(cells: [
                  DataCell(Text('Cable Bar Curl')),
                  DataCell(TextField(onChanged: (value) {t3s4 = value;print("Sets:: $value");
                  })),
                  DataCell(TextField(onChanged: (value) {t3r4 = value;print("Reps:: $value");
                  })),
                  DataCell(
                    IconButton(
                      icon: Icon(Icons.play_circle_fill_outlined),
                      iconSize: 30,
                      color: Colors.green.shade400,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => weight_gain()));
                      },
                    ),
                  ),
                ]),
              ],
            ),
            SizedBox(height: 30),
            Center(
                child: Text(
              'Triceps Exercises',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            )),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 30, vertical: 20),),
            // ignore: deprecated_member_use
            RaisedButton(
                onPressed: (){
                  var firebaseUser =  FirebaseAuth.instance.currentUser;
                  firestoreInstance.collection("users").doc(firebaseUser.uid).set(
                      {
                        "4) Triceps Exercises": {
                          "Cable Rop Push Down" : {"Sets":'$t4s1',"Reps":'$t4r1'},
                          "Diamond Push Up's":{ "Sets":'$t4s2',"Reps":'$t4r2'},
                          "One-Arm Overhead Extension":{ "Sets":'$t4s3',"Reps":'$t4r3'},
                          "Lying Triceps Extension":{ "Sets":'$t4s4',"Reps":'$t4r4'},
                        }
                      },SetOptions(merge: true)).then((_){
                    print("success!");
                  });

                  _showDialog();
                },

                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0)
                ),
                elevation: 0.0,
                padding: EdgeInsets.all(0.0),
                child: Ink(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.centerRight,
                        end: Alignment.centerLeft,
                        colors: [Colors.green,Colors.blue]
                    ),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Container(
                    constraints: BoxConstraints(maxWidth: 100.0, minHeight: 20.0),
                    alignment: Alignment.center,
                    child: Text("Update",
                      style: TextStyle(color: Colors.white, fontSize: 16.0, fontWeight:FontWeight.w300),
                    ),
                  ),
                )
            ),


            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 20, vertical: 20),),
            DataTable(
              columns: [
                DataColumn(
                    label: Text('Exercises',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold))),
                DataColumn(
                    label: Text('Sets',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold))),
                DataColumn(
                    label: Text('Reps',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold))),
                DataColumn(
                    label: Text('Video',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold))),
              ],
              rows: [
                DataRow(cells: [
                  DataCell(Text('Cable Rope Pushdown')),
                  DataCell(TextField(onChanged: (value) {t4s1 = value;print("Sets:: $value");
                  })),
                  DataCell(TextField(onChanged: (value) {t4r1 = value ;print("Reps:: $value");
                  })),
                  DataCell(
                    IconButton(
                      icon: Icon(Icons.play_circle_fill_outlined),
                      iconSize: 30,
                      color: Colors.green.shade400,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => table()),
                        );
                      },
                    ),
                  ),
                ]),
                DataRow(cells: [
                  DataCell(Text('Diamond Push-Ups')),
                  DataCell(TextField(onChanged: (value) {t4s2 = value;print("Sets:: $value");
                  })),
                  DataCell(TextField(onChanged: (value) {t4r2 = value ;print("Reps:: $value");
                  })),
                  DataCell(
                    IconButton(
                      icon: Icon(Icons.play_circle_fill_outlined),
                      iconSize: 30,
                      color: Colors.green.shade400,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => table()),
                        );
                      },
                    ),
                  ),
                ]),
                DataRow(cells: [
                  DataCell(Text('One-Arm Overhead Extension')),
                  DataCell(TextField(onChanged: (value) {t4s3 = value;print("Sets:: $value");
                  })),
                  DataCell(TextField(onChanged: (value) {t4r3 = value ;print("Reps:: $value");
                  })),
                  DataCell(
                    IconButton(
                      icon: Icon(Icons.play_circle_fill_outlined),
                      iconSize: 30,
                      color: Colors.green.shade400,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => table()),
                        );
                      },
                    ),
                  ),
                ]),
                DataRow(cells: [
                  DataCell(Text('Lying Triceps Extension')),
                  DataCell(TextField(onChanged: (value) {t4s4 = value;print("Sets:: $value");
                  })),
                  DataCell(TextField(onChanged: (value) {t4r4 = value ;print("Reps:: $value");
                  })),
                  DataCell(
                    IconButton(
                      icon: Icon(Icons.play_circle_fill_outlined),
                      iconSize: 30,
                      color: Colors.green.shade400,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => weight_gain()));
                      },
                    ),
                  ),
                ]),
              ],
            ),
            SizedBox(height: 30),
            Center(
                child: Text(
              'Traps Exercises',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            )),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 30, vertical: 20),),
            // ignore: deprecated_member_use
            RaisedButton(
                onPressed: (){
                  var firebaseUser =  FirebaseAuth.instance.currentUser;
                  firestoreInstance.collection("users").doc(firebaseUser.uid).set(
                      {
                        "5) Traps Exercises": {
                          "Shrugs" : {"Sets":'$t5s1',"Reps":'$t5r1'},
                          "Barbell Deadlift":{ "Sets":'$t5s2',"Reps":'$t5r2'},
                          "Upright Rows":{ "Sets":'$t5s3',"Reps":'$t5r3'},
                          "Rack Pulls":{ "Sets":'$t5s4',"Reps":'$t5r4'},
                        }
                      },SetOptions(merge: true)).then((_){
                    print("success!");
                  });

                  _showDialog();
                },

                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0)
                ),
                elevation: 0.0,
                padding: EdgeInsets.all(0.0),
                child: Ink(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.centerRight,
                        end: Alignment.centerLeft,
                        colors: [Colors.green,Colors.blue]
                    ),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Container(
                    constraints: BoxConstraints(maxWidth: 100.0, minHeight: 20.0),
                    alignment: Alignment.center,
                    child: Text("Update",
                      style: TextStyle(color: Colors.white, fontSize: 16.0, fontWeight:FontWeight.w300),
                    ),
                  ),
                )
            ),


            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 20, vertical: 20),),
            DataTable(
              columns: [
                DataColumn(
                    label: Text('Exercises',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold))),
                DataColumn(
                    label: Text('Sets',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold))),
                DataColumn(
                    label: Text('Reps',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold))),
                DataColumn(
                    label: Text('Video',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold))),
              ],
              rows: [
                DataRow(cells: [
                  DataCell(Text('Shrugs')),
                  DataCell(TextField(onChanged: (value) {t5s1 = value;print("Sets:: $value");
                  })),
                  DataCell(TextField(onChanged: (value) {t5r1 = value;print("Reps:: $value");
                  })),
                  DataCell(
                    IconButton(
                      icon: Icon(Icons.play_circle_fill_outlined),
                      iconSize: 30,
                      color: Colors.green.shade400,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => table()),
                        );
                      },
                    ),
                  ),
                ]),
                DataRow(cells: [
                  DataCell(Text('Barbell Deadlift')),
                  DataCell(TextField(onChanged: (value) {t5s2 = value;print("Sets:: $value");
                  })),
                  DataCell(TextField(onChanged: (value) {t5r2 = value ;print("Reps:: $value");
                  })),
                  DataCell(
                    IconButton(
                      icon: Icon(Icons.play_circle_fill_outlined),
                      iconSize: 30,
                      color: Colors.green.shade400,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => weight_gain()));
                      },
                    ),
                  ),
                ]),
                DataRow(cells: [
                  DataCell(Text('Upright Rows')),
                  DataCell(TextField(onChanged: (value) {t5s3 = value;print("Sets:: $value");
                  })),
                  DataCell(TextField(onChanged: (value) {t5r3 = value ;print("Reps:: $value");
                  })),
                  DataCell(
                    IconButton(
                      icon: Icon(Icons.play_circle_fill_outlined),
                      iconSize: 30,
                      color: Colors.green.shade400,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => weight_gain()));
                      },
                    ),
                  ),
                ]),
                DataRow(cells: [
                  DataCell(Text('Rack Pulls')),
                  DataCell(TextField(onChanged: (value) {t5s4 = value;print("Sets:: $value");
                  })),
                  DataCell(TextField(onChanged: (value) {t5r4 = value ;print("Reps:: $value");
                  })),
                  DataCell(
                    IconButton(
                      icon: Icon(Icons.play_circle_fill_outlined),
                      iconSize: 30,
                      color: Colors.green.shade400,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => weight_gain()));
                      },
                    ),
                  ),
                ]),
              ],
            ),
            SizedBox(height: 30),
            Center(
                child: Text(
              'Abs Exercises',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            )),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 30, vertical: 20),),
            // ignore: deprecated_member_use
            RaisedButton(
                onPressed: (){
                  var firebaseUser =  FirebaseAuth.instance.currentUser;
                  firestoreInstance.collection("users").doc(firebaseUser.uid).set(
                      {
                        "6) Abs Exercises": {
                          "Hanging Knee Raise" : {"Sets":'$t6s1',"Reps":'$t6r1'},
                          "Dumbbell side bend":{"Sets":'$t6s2',"Reps":'$t6r2' },
                          "Barbell back squat":{"Sets":'$t6s3',"Reps":'$t6r3'},
                          "Bird dog":{"Sets":'$t6s4',"Reps":'$t6r4'},
                        }
                      },SetOptions(merge: true)).then((_){
                    print("success!");
                  });

                  _showDialog();
                },

                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0)
                ),
                elevation: 0.0,
                padding: EdgeInsets.all(0.0),
                child: Ink(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.centerRight,
                        end: Alignment.centerLeft,
                        colors: [Colors.green,Colors.blue]
                    ),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Container(
                    constraints: BoxConstraints(maxWidth: 100.0, minHeight: 20.0),
                    alignment: Alignment.center,
                    child: Text("Update",
                      style: TextStyle(color: Colors.white, fontSize: 16.0, fontWeight:FontWeight.w300),
                    ),
                  ),
                )
            ),


            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 20, vertical: 20),),
            DataTable(
              columns: [
                DataColumn(
                    label: Text('Exercises',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold))),
                DataColumn(
                    label: Text('Sets',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold))),
                DataColumn(
                    label: Text('Reps',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold))),
                DataColumn(
                    label: Text('Video',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold))),
              ],
              rows: [
                DataRow(cells: [
                  DataCell(Text('Hanging knee raise')),
                  DataCell(TextField(onChanged: (value) {t6s1 = value;print("Sets:: $value");
                  })),
                  DataCell(TextField(onChanged: (value) {t6r1 = value;print("Reps:: $value");
                  })),
                  DataCell(
                    IconButton(
                      icon: Icon(Icons.play_circle_fill_outlined),
                      iconSize: 30,
                      color: Colors.green.shade400,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => weight_gain()));
                      },
                    ),
                  ),
                ]),
                DataRow(cells: [
                  DataCell(Text('Dumbbell side bend')),
                  DataCell(TextField(onChanged: (value) {t6s2 = value;print("Sets:: $value");
                  })),
                  DataCell(TextField(onChanged: (value) {t6r2 = value ;print("Reps:: $value");
                  })),
                  DataCell(
                    IconButton(
                      icon: Icon(Icons.play_circle_fill_outlined),
                      iconSize: 30,
                      color: Colors.green.shade400,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => weight_gain()));
                      },
                    ),
                  ),
                ]),
                DataRow(cells: [
                  DataCell(Text('Barbell back squat')),
                  DataCell(TextField(onChanged: (value) {t6s3 = value;print("Sets:: $value");
                  })),
                  DataCell(TextField(onChanged: (value) {t6r3 = value;print("Reps:: $value");
                  })),
                  DataCell(
                    IconButton(
                      icon: Icon(Icons.play_circle_fill_outlined),
                      iconSize: 30,
                      color: Colors.green.shade400,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => weight_gain()));
                      },
                    ),
                  ),
                ]),
                DataRow(cells: [
                  DataCell(Text('Bird dog')),
                  DataCell(TextField(onChanged: (value) {t6s4 = value;print("Sets:: $value");
                  })),
                  DataCell(TextField(onChanged: (value) {t6r4 = value ;print("Reps:: $value");
                  })),
                  DataCell(
                    IconButton(
                      icon: Icon(Icons.play_circle_fill_outlined),
                      iconSize: 30,
                      color: Colors.green.shade400,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => weight_gain()));
                      },
                    ),
                  ),
                ]),
              ],
            ),
            SizedBox(height: 30),
            Center(
                child: Text(
              'Glutes Exercises',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            )),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 30, vertical: 20),),
            // ignore: deprecated_member_use
            RaisedButton(
                onPressed: (){
                  var firebaseUser =  FirebaseAuth.instance.currentUser;
                  firestoreInstance.collection("users").doc(firebaseUser.uid).set(
                      {
                        "7) Glutes Exercises": {
                          "Weighted Squats" : {"Sets":'$t7s1',"Reps":'$t7r1'},
                          "Barbell Hip Thrust":{ "Sets":'$t7s2',"Reps":'$t7r2'},
                          "Barbell Curtsy lunge":{ "Sets":'$t7s3',"Reps":'$t7r3'},
                          "Hip Trust":{ "Sets":'$t7s4',"Reps":'$t7r4'},
                        }
                      },SetOptions(merge: true)).then((_){
                    print("success!");
                  });

                  _showDialog();
                },

                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0)
                ),
                elevation: 0.0,
                padding: EdgeInsets.all(0.0),
                child: Ink(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.centerRight,
                        end: Alignment.centerLeft,
                        colors: [Colors.green,Colors.blue]
                    ),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Container(
                    constraints: BoxConstraints(maxWidth: 100.0, minHeight: 20.0),
                    alignment: Alignment.center,
                    child: Text("Update",
                      style: TextStyle(color: Colors.white, fontSize: 16.0, fontWeight:FontWeight.w300),
                    ),
                  ),
                )
            ),


            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 20, vertical: 20),),
            DataTable(
              columns: [
                DataColumn(
                    label: Text('Exercises',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold))),
                DataColumn(
                    label: Text('Sets',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold))),
                DataColumn(
                    label: Text('Reps',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold))),
                DataColumn(
                    label: Text('Video',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold))),
              ],
              rows: [
                DataRow(cells: [
                  DataCell(Text('Weighted Squats')),
                  DataCell(TextField(onChanged: (value) {t7s1 = value;print("Sets:: $value");
                  })),
                  DataCell(TextField(onChanged: (value) {t7r1 = value ;print("Reps:: $value");
                  })),
                  DataCell(
                    IconButton(
                      icon: Icon(Icons.play_circle_fill_outlined),
                      iconSize: 30,
                      color: Colors.green.shade400,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => weight_gain()));
                      },
                    ),
                  ),
                ]),
                DataRow(cells: [
                  DataCell(Text('Barbell Hip Thrust')),
                  DataCell(TextField(onChanged: (value) {t7s2 = value;print("Sets:: $value");
                  })),
                  DataCell(TextField(onChanged: (value) {t7r2 = value ;print("Reps:: $value");
                  })),
                  DataCell(
                    IconButton(
                      icon: Icon(Icons.play_circle_fill_outlined),
                      iconSize: 30,
                      color: Colors.green.shade400,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => weight_gain()));
                      },
                    ),
                  ),
                ]),
                DataRow(cells: [
                  DataCell(Text('Barbell Curtsy Lunge')),
                  DataCell(TextField(onChanged: (value) {t7s3 = value;print("Sets:: $value");
                  })),
                  DataCell(TextField(onChanged: (value) {t7r3 = value;print("Reps:: $value");
                  })),
                  DataCell(
                    IconButton(
                      icon: Icon(Icons.play_circle_fill_outlined),
                      iconSize: 30,
                      color: Colors.green.shade400,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => table()),
                        );
                      },
                    ),
                  ),
                ]),
                DataRow(cells: [
                  DataCell(Text('Hip Thrust')),
                  DataCell(TextField(onChanged: (value) {t7s4 = value;print("Sets:: $value");
                  })),
                  DataCell(TextField(onChanged: (value) {t7r4 = value ;print("Reps:: $value");
                  })),
                  DataCell(
                    IconButton(
                      icon: Icon(Icons.play_circle_fill_outlined),
                      iconSize: 30,
                      color: Colors.green.shade400,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => weight_gain()));
                      },
                    ),
                  ),
                ]),
              ],
            ),
            SizedBox(height: 30),
            Center(
                child: Text(
              'Legs Exercises',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            )),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 30, vertical: 20),),
            // ignore: deprecated_member_use
            RaisedButton(
                onPressed: (){
                  var firebaseUser =  FirebaseAuth.instance.currentUser;
                  firestoreInstance.collection("users").doc(firebaseUser.uid).set(
                      {
                        "8) Legs Exercises": {
                          "Bulgarian Split Squats" : {"Sets":'$t8s1',"Reps":'$t8r1'},
                          "Drop Lunge":{ "Sets":'$t8s2',"Reps":'$t8r2'},
                          "Barbell Back Squat":{ "Sets":'$t8s3',"Reps":'$t8r3'},
                          "Front Squat":{ "Sets":'$t8s4',"Reps":'$t8r4'},
                        }
                      },SetOptions(merge: true)).then((_){
                    print("success!");
                  });

                  _showDialog();
                },

                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0)
                ),
                elevation: 0.0,
                padding: EdgeInsets.all(0.0),
                child: Ink(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.centerRight,
                        end: Alignment.centerLeft,
                        colors: [Colors.green,Colors.blue]
                    ),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Container(
                    constraints: BoxConstraints(maxWidth: 100.0, minHeight: 20.0),
                    alignment: Alignment.center,
                    child: Text("Update",
                      style: TextStyle(color: Colors.white, fontSize: 16.0, fontWeight:FontWeight.w300),
                    ),
                  ),
                )
            ),


            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 20, vertical: 20),),
            DataTable(
              columns: [
                DataColumn(
                    label: Text('Exercises',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold))),
                DataColumn(
                    label: Text('Sets',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold))),
                DataColumn(
                    label: Text('Reps',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold))),
                DataColumn(
                    label: Text('Video',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold))),
              ],
              rows: [
                DataRow(cells: [
                  DataCell(Text('Bulgarian Split Squats')),
                  DataCell(TextField(onChanged: (value) {t8s1 = value;print("Sets:: $value");
                  })),
                  DataCell(TextField(onChanged: (value) {t8r1 = value;print("Reps:: $t8r1");
                  }
                  )),
                  DataCell(
                    IconButton(
                      icon: Icon(Icons.play_circle_fill_outlined),
                      iconSize: 30,
                      color: Colors.green.shade400,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => weight_gain()));
                      },
                    ),
                  ),
                ]),
                DataRow(cells: [
                  DataCell(Text('Drop Lunge')),
                  DataCell(TextField(onChanged: (value) {t8s2 = value;print("Sets:: $value");
                  })),
                  DataCell(TextField(onChanged: (value) {t8r2 =value ;print("Reps:: $value");
                  })),
                  DataCell(
                    IconButton(
                      icon: Icon(Icons.play_circle_fill_outlined),
                      iconSize: 30,
                      color: Colors.green.shade400,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => weight_gain()));
                      },
                    ),
                  ),
                ]),
                DataRow(cells: [
                  DataCell(Text('Barbell back squat')),
                  DataCell(TextField(onChanged: (value) {t8s3 = value;print("Sets:: $value");
                  })),
                  DataCell(TextField(onChanged: (value) {t8r3 = value ;print("Reps:: $value");
                  })),
                  DataCell(
                    IconButton(
                      icon: Icon(Icons.play_circle_fill_outlined),
                      iconSize: 30,
                      color: Colors.green.shade400,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => weight_gain()));
                      },
                    ),
                  ),
                ]),
                DataRow(cells: [
                  DataCell(Text('Front Squat')),
                  DataCell(TextField(onChanged: (value) {t8s4 = value;print("Sets:: $value");
                  })),
                  DataCell(TextField(onChanged: (value) {t8r4 = value;print("Reps:: $value");
                  })),
                  DataCell(
                    IconButton(
                      icon: Icon(Icons.play_circle_fill_outlined),
                      iconSize: 30,
                      color: Colors.green.shade400,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => weight_gain()));
                      },
                    ),
                  ),
                ]),
              ],
            ),
          ])),
    );
  }
}
