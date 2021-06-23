import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:workout_app/constants.dart';
import 'package:workout_app/database/database.dart';

class newtables extends StatefulWidget {
  @override
  _TableExample createState() => _TableExample();
}

class _TableExample extends State<newtables> {
  void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Alert Dialog title"),
          content: new Text("Alert Dialog body"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Close"),
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
  String t1s1,t1s2,t1s3,t2s1,t2s2,t2s3,t3s1,t3s2,t3s3,t4s1,t4s2,t4s3,t5s1,t5s2,t5s3;
  String t1r1,t1r2,t1r3,t2r1,t2r2,t2r3,t3r1,t3r2,t3r3,t4r1,t4r2,t4r3,t5r1,t5r2,t5r3;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor:kThirdColor,
          appBar: AppBar(
            backgroundColor: kFirstColor,
            title: Text('Exercises'),
          ),

          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child:Center(
              child: Column(children: <Widget>[
              Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 30, vertical: 40),),
             Align(
                  alignment: Alignment.center,
                child:Text("Chest and Triceps",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color:Colors.lightGreenAccent),
                ),),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 20),),
             // ignore: deprecated_member_use

                // ignore: deprecated_member_use
                RaisedButton(
                    onPressed: (){
                      String email;
                      var firebaseUser =  FirebaseAuth.instance.currentUser;
                      firestoreInstance.collection("users").doc(firebaseUser.uid).set(
                          {
                           "Chest and Tricep": {
                              "Incline Bareball Press" : {"Sets":'$t1s1',"Reps":'$t1r1'},
                              "Dumbell Press":{ "Sets":'$t1s2',"Reps":'$t1r2'},
                              "Weighted Up":{ "Sets":'$t1s3',"Reps":'$t1r3'},
                            }
                          }).then((_){
                        print("success!");
                      });
                      firestoreInstance.collection("users").doc(firebaseUser.uid).set(
                          {
                            "Chest and Tricep" : {
                              "Incline Bareball Press" : {"Sets":'$t1s1',"Reps":'$t1r1'},
                              "Dumbell Press":{ "Sets":'$t1s2',"Reps":'$t1r2'},
                              "Weighted Up":{ "Sets":'$t1s3',"Reps":'$t1r3'},
                            }
                          },SetOptions(merge: true)).then((_){
                        print("success!");
                      });
                      var User =  FirebaseAuth.instance.currentUser;
                      firestoreInstance.collection("users").doc(User.uid).get().then((value){
                        print(value.data());
                      });
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
                Container(
                  margin: EdgeInsets.all(15),
                  child: Table(
                    defaultColumnWidth: FixedColumnWidth(120.0),
                    border: TableBorder.all(
                        color: Colors.black,
                        style: BorderStyle.solid,
                        width: 2),

                    children: [
                      TableRow(
                          children: [
                        Column(children:[Align(alignment: Alignment.center,child:Text('Exerce Name ', style:
                        TextStyle(fontSize: 12.0,color:kFirstColor,fontWeight:FontWeight.bold),))]),
                        Column(children:[Align(alignment: Alignment.center,child:Text('Sets', style:
                        TextStyle(fontSize: 12.0,color:Colors.blue,fontWeight:FontWeight.bold)))]),
                        Column(children:[Align(alignment: Alignment.center,child:Text('Reps', style:
                        TextStyle(fontSize: 12.0,color:Colors.blue,fontWeight:FontWeight.bold)))]),
                      ]),
                      TableRow( children: [
                        Column(children:[Align(alignment: Alignment.centerLeft,child:Text(' Incline bareball Bench press',style:
                        TextStyle(fontSize: 14.0,color:kFirstColor,fontWeight:FontWeight.bold)))]),
                        Column(children:[Align(alignment: Alignment.center,child:TextField(onChanged: (value) {t1s1 = value;print("sets:: $value");
                        }, style: TextStyle(fontSize: 14.0,color: Colors.blue)))]),
                        Column(children:[Align(alignment: Alignment.center,child:TextField(onChanged: (value) {t1r1 = value;print("sets:: $value");
                        }, style: TextStyle(fontSize: 14.0,color: Colors.blue)),)]),
                      ]),
                      TableRow( children: [
                        Column(children:[Align(alignment: Alignment.centerLeft,child:Text(' Dumbell Press ', style:
                        TextStyle(fontSize: 14.0,color:kFirstColor,fontWeight:FontWeight.bold)))]),
                        Column(children:[Align(alignment: Alignment.center,child:TextField(onChanged: (value) {t1s2 = value;print("sets:: $value");
                        }, style: TextStyle(fontSize: 14.0,color: Colors.blue)))]),
                        Column(children:[Align(alignment: Alignment.center,child:TextField(onChanged: (value) {t1r2 = value;print("sets:: $value");
                        }, style: TextStyle(fontSize: 14.0,color: Colors.blue)))]),
                      ]),
                      TableRow( children: [
                        Column(children:[Align(alignment: Alignment.centerLeft,child:Text(' Weighted Up', style:
                        TextStyle(fontSize: 14.0,color:kFirstColor,fontWeight:FontWeight.bold)))]),
                        Column(children:[Align(alignment: Alignment.center,child:TextField(onChanged: (value) {t1s3 = value;print("sets:: $value");
                        }, style: TextStyle(fontSize: 14.0,color: Colors.blue)))]),
                        Column(children:[Align(alignment: Alignment.center,child:TextField(onChanged: (value) {t1r3 = value;print("sets:: $value");
                        }, style: TextStyle(fontSize: 14.0,color: Colors.blue)))]),
                      ]),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 30, vertical: 30),),
                Align(
                  alignment: Alignment.center,
                  child:Text("Legs and ABS",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color:Colors.lightGreenAccent),
                  ),),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20, vertical: 20),),
                  RaisedButton(
                      onPressed: (){
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
                      horizontal: 30, vertical: 20),),
                Container(
                  margin: EdgeInsets.all(20),
                  child: Table(
                    defaultColumnWidth: FixedColumnWidth(120.0),
                    border: TableBorder.all(
                        color: Colors.black,
                        style: BorderStyle.solid,
                        width: 2),

                    children: [
                      TableRow( children: [
                        Column(children:[Align(alignment: Alignment.center,child:Text('Exerce Name ', style:
                        TextStyle(fontSize: 14.0,color:kFirstColor,fontWeight:FontWeight.bold),))]),
                        Column(children:[Align(alignment: Alignment.center,child:Text('Sets', style:
                        TextStyle(fontSize: 14.0,color:Colors.blue,fontWeight:FontWeight.bold)))]),
                        Column(children:[Align(alignment: Alignment.center,child:Text('Reps', style:
                        TextStyle(fontSize: 14.0,color:Colors.blue,fontWeight:FontWeight.bold)))]),
                      ]),
                      TableRow( children: [
                        Column(children:[Align(alignment: Alignment.centerLeft,child:Text(' Leg press',style:
                        TextStyle(fontSize: 14.0,color:kFirstColor,fontWeight:FontWeight.bold)))]),
                        Column(children:[Align(alignment: Alignment.center,child:TextField(onChanged: (value) {t2s1 = value;print("sets:: $value");
                        }, style: TextStyle(fontSize: 14.0,color: Colors.blue)))]),
                        Column(children:[Align(alignment: Alignment.center,child:TextField(onChanged: (value) {t2r1 = value;print("reps:: $value");
                        }, style: TextStyle(fontSize: 14.0,color: Colors.blue)),)]),
                      ]),
                      TableRow( children: [
                        Column(children:[Align(alignment: Alignment.centerLeft,child:Text(' Hanging Leg Raise ', style:
                        TextStyle(fontSize: 14.0,color:kFirstColor,fontWeight:FontWeight.bold)))]),
                        Column(children:[Align(alignment: Alignment.center,child:TextField(onChanged: (value) {t2s2 = value;print("sets:: $value");
                        }, style: TextStyle(fontSize: 14.0,color: Colors.blue)))]),
                        Column(children:[Align(alignment: Alignment.center,child:TextField(onChanged: (value) {t2r2 = value;print("reps:: $value");
                        }, style: TextStyle(fontSize: 14.0,color: Colors.blue)))]),
                      ]),
                      TableRow( children: [
                        Column(children:[Align(alignment: Alignment.centerLeft,child:Text(' Romanian Dead Lift', style:
                        TextStyle(fontSize: 14.0,color:kFirstColor,fontWeight:FontWeight.bold)))]),
                        Column(children:[Align(alignment: Alignment.center,child:TextField(onChanged: (value) {t2s3 = value;print("sets:: $value");
                        }, style: TextStyle(fontSize: 14.0,color: Colors.blue)))]),
                        Column(children:[Align(alignment: Alignment.center,child:TextField(onChanged: (value) {t2r3 = value;print("reps:: $value");
                        }, style: TextStyle(fontSize: 14.0,color: Colors.blue)))]),
                      ]),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 30, vertical: 20),),
             Align(
                  alignment: Alignment.center,
                  child:Text("Shoulders and Traps",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color:Colors.lightGreenAccent),
                  ),),

                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 20),),
                  RaisedButton(
                      onPressed: (){
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
                Container(
                  margin: EdgeInsets.all(20),
                  child: Table(
                    defaultColumnWidth: FixedColumnWidth(120.0),
                    border: TableBorder.all(
                        color: Colors.black,
                        style: BorderStyle.solid,
                        width: 2),

                    children: [
                      TableRow( children: [
                        Column(children:[Align(alignment: Alignment.center,child:Text('Exerce Name ', style:
                        TextStyle(fontSize: 14.0,color:kFirstColor,fontWeight:FontWeight.bold),))]),
                        Column(children:[Align(alignment: Alignment.center,child:Text('Sets', style:
                        TextStyle(fontSize: 14.0,color:Colors.blue,fontWeight:FontWeight.bold)))]),
                        Column(children:[Align(alignment: Alignment.center,child:Text('Reps', style:
                        TextStyle(fontSize: 14.0,color:Colors.blue,fontWeight:FontWeight.bold)))]),
                      ]),
                      TableRow( children: [
                        Column(children:[Align(alignment: Alignment.centerLeft,child:Text(' Dumb Bell Shrug',style:
                        TextStyle(fontSize: 14.0,color:kFirstColor,fontWeight:FontWeight.bold)))]),
                        Column(children:[Align(alignment: Alignment.center,child:TextField(onChanged: (value) {t3s1 = value;print("sets:: $value");
                        }, style: TextStyle(fontSize: 14.0,color: Colors.blue)))]),
                        Column(children:[Align(alignment: Alignment.center,child:TextField(onChanged: (value) {t3r1 = value;print("sets:: $value");
                        }, style: TextStyle(fontSize: 14.0,color: Colors.blue)),)]),
                      ]),
                      TableRow( children: [
                        Column(children:[Align(alignment: Alignment.centerLeft,child:Text(' Arnold Press ', style:
                        TextStyle(fontSize: 14.0,color:kFirstColor,fontWeight:FontWeight.bold)))]),
                        Column(children:[Align(alignment: Alignment.center,child:TextField(onChanged: (value) {t3s2 = value;print("sets:: $value");
                        }, style: TextStyle(fontSize: 14.0,color: Colors.blue)))]),
                        Column(children:[Align(alignment: Alignment.center,child:TextField(onChanged: (value) {t3r2 = value;print("sets:: $value");
                        }, style: TextStyle(fontSize: 14.0,color: Colors.blue)))]),
                      ]),
                      TableRow( children: [
                        Column(children:[Align(alignment: Alignment.centerLeft,child:Text(' Bent Over', style:
                        TextStyle(fontSize: 14.0,color:kFirstColor,fontWeight:FontWeight.bold)))]),
                        Column(children:[Align(alignment: Alignment.center,child:TextField(onChanged: (value) {t3s3 = value;print("sets:: $value");
                        }, style: TextStyle(fontSize: 14.0,color: Colors.blue)))]),
                        Column(children:[Align(alignment: Alignment.center,child:TextField(onChanged: (value) {t3r3 = value;print("sets:: $value");
                        }, style: TextStyle(fontSize: 14.0,color: Colors.blue)))]),
                      ]),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 30, vertical: 20),),
                Align(
                  alignment: Alignment.center,
                  child:Text("Back and Biceps,ABS",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color:Colors.lightGreenAccent),
                  ),),

                 Padding(
                   padding: const EdgeInsets.symmetric(
                       horizontal: 30, vertical: 20),),
                 RaisedButton(
                     onPressed: (){
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
                         child: Text("update",
                           style: TextStyle(color: Colors.white, fontSize: 16.0, fontWeight:FontWeight.w300),
                         ),
                       ),
                     )
                 ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20, vertical: 20),),
                Container(
                  margin: EdgeInsets.all(20),
                  child: Table(
                    defaultColumnWidth: FixedColumnWidth(120.0),
                    border: TableBorder.all(
                        color: Colors.black,
                        style: BorderStyle.solid,
                        width: 2),

                    children: [
                      TableRow( children: [
                        Column(children:[Align(alignment: Alignment.center,child:Text('Exerce Name ', style:
                        TextStyle(fontSize: 14.0,color:kFirstColor,fontWeight:FontWeight.bold),))]),
                        Column(children:[Align(alignment: Alignment.center,child:Text('Sets', style:
                        TextStyle(fontSize: 14.0,color:Colors.blue,fontWeight:FontWeight.bold)))]),
                        Column(children:[Align(alignment: Alignment.center,child:Text('Reps', style:
                        TextStyle(fontSize: 14.0,color:Colors.blue,fontWeight:FontWeight.bold)))]),
                      ]),
                      TableRow( children: [
                        Column(children:[Align(alignment: Alignment.centerLeft,child:Text(' BarBell Preacher Curl',style:
                        TextStyle(fontSize: 14.0,color:kFirstColor,fontWeight:FontWeight.bold)))]),
                        Column(children:[Align(alignment: Alignment.center,child:TextField(onChanged: (value) {t4s1 = value;print("sets:: $value");
                        }, style: TextStyle(fontSize: 14.0,color: Colors.blue),))]),
                        Column(children:[Align(alignment: Alignment.center,child:TextField(onChanged: (value) {t4r1 = value;print("Reps:: $value");
                        }, style: TextStyle(fontSize: 14.0,color: Colors.blue)),)]),
                      ]),
                      TableRow( children: [
                        Column(children:[Align(alignment: Alignment.centerLeft,child:Text(' Crunch', style:
                        TextStyle(fontSize: 14.0,color:kFirstColor,fontWeight:FontWeight.bold)))]),
                        Column(children:[Align(alignment: Alignment.center,child:TextField(onChanged: (value) {t4s2 = value;print("sets:: $value");
                        }, style: TextStyle(fontSize: 14.0,color: Colors.blue)))]),
                        Column(children:[Align(alignment: Alignment.center,child:TextField(onChanged: (value) {t4r2 = value;print("Reps:: $value");
                        }, style: TextStyle(fontSize: 14.0,color: Colors.blue)))]),
                      ]),
                      TableRow( children: [
                        Column(children:[Align(alignment: Alignment.centerLeft,child:Text(' Reverse Crunch', style:
                        TextStyle(fontSize: 14.0,color:kFirstColor,fontWeight:FontWeight.bold)))]),
                        Column(children:[Align(alignment: Alignment.center,child:TextField(onChanged: (value) {t4s3 = value;print("sets:: $value");
                        }, style: TextStyle(fontSize: 14.0,color: Colors.blue)))]),
                        Column(children:[Align(alignment: Alignment.center,child:TextField(onChanged: (value) {t4r3 = value;print("Reps:: $value");
                        }, style: TextStyle(fontSize: 14.0,color: Colors.blue)))]),
                      ]),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 30, vertical: 20),),
               Align(
                  alignment: Alignment.center,
                  child:Text("Squats",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color:Colors.lightGreenAccent),
                  ),),

                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 20),),
                  RaisedButton(
                      onPressed: (){
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
                Container(
                  margin: EdgeInsets.all(20),
                  child: Table(
                    defaultColumnWidth: FixedColumnWidth(120.0),
                    border: TableBorder.all(
                        color: Colors.black,
                        style: BorderStyle.solid,
                        width: 2),

                    children: [
                      TableRow( children: [
                        Column(children:[Align(alignment: Alignment.center,child:Text('Exerce Name ', style:
                        TextStyle(fontSize: 14.0,color:kFirstColor,fontWeight:FontWeight.bold),))]),
                        Column(children:[Align(alignment: Alignment.center,child:Text('Sets', style:
                        TextStyle(fontSize: 14.0,color:Colors.blue,fontWeight:FontWeight.bold)))]),
                        Column(children:[Align(alignment: Alignment.center,child:Text('Reps', style:
                        TextStyle(fontSize: 14.0,color:Colors.blue,fontWeight:FontWeight.bold)))]),
                      ]),
                      TableRow( children: [
                        Column(children:[Align(alignment: Alignment.centerLeft,child:Text(' First Week',style:
                        TextStyle(fontSize: 14.0,color:kFirstColor,fontWeight:FontWeight.bold)))]),
                        Column(children:[Align(alignment: Alignment.center,child:TextField(onChanged: (value) {t5s1 = value;print("sets:: $value");
                        }, style: TextStyle(fontSize: 14.0,color: Colors.blue)))]),
                        Column(children:[Align(alignment: Alignment.center,child:TextField(onChanged: (value) {t5r1 = value;print("Reps:: $value");
                        }, style: TextStyle(fontSize: 14.0,color: Colors.blue)),)]),
                      ]),
                      TableRow( children: [
                        Column(children:[Align(alignment: Alignment.centerLeft,child:Text(' Second Week', style:
                        TextStyle(fontSize: 14.0,color:kFirstColor,fontWeight:FontWeight.bold)))]),
                        Column(children:[Align(alignment: Alignment.center,child:TextField(onChanged: (value) {t5s2 = value;print("sets:: $value");
                        }, style: TextStyle(fontSize: 14.0,color: Colors.blue)))]),
                        Column(children:[Align(alignment: Alignment.center,child:TextField(onChanged: (value) {t5r2 = value;print("Reps:: $value");
                        }, style: TextStyle(fontSize: 14.0,color: Colors.blue)))]),
                      ]),
                      TableRow( children: [
                        Column(children:[Align(alignment: Alignment.centerLeft,child:Text(' Third Week', style:
                        TextStyle(fontSize: 14.0,color:kFirstColor,fontWeight:FontWeight.bold)))]),
                        Column(children:[Align(alignment: Alignment.center,child:TextField(onChanged: (value) {t5s3 = value;print("sets:: $value");
                        }, style: TextStyle(fontSize: 14.0,color: Colors.blue)))]),
                        Column(children:[Align(alignment: Alignment.center,child:TextField(onChanged: (value) {t5r3 = value;print("Reps:: $value");
                        }, style: TextStyle(fontSize: 14.0,color: Colors.blue)))]),
                      ]),
                    ],
                  ),

                ),
              ]),
            ),
          )),
    );
  }
}