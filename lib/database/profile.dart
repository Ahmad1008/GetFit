
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:workout_app/constants.dart';
import 'package:workout_app/database/database.dart';
import 'package:workout_app/screens/login_screen.dart';
import 'package:workout_app/screens/table.dart';

class profile extends StatefulWidget {
  static const routeName = '/home';
  const profile({Key key,  User user})
      : _user = user?? 123,
        super(key: key);

  final User _user;
  @override
  _profile createState() => _profile();

}

Future<void> _signOut() async {
  await FirebaseAuth.instance.signOut();
}

class _profile extends State<profile> {
  User user = FirebaseAuth.instance.currentUser;
  String abc;
  File _image;
  Future getImagefromgallery() async {
    setState(() {
    });
  }
  User _user;
  bool _isSigningOut = false;

  Route _routeToSignInScreen() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => WorkoutScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(-1.0, 0.0);
        var end = Offset.zero;
        var curve = Curves.ease;

        var tween =
        Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  @override
  void initState() {
    _user = widget._user;
    getCurrentUser();
    super.initState();
  }
  void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          backgroundColor: kThirdColor,
          title: new Text("Warning! ",style:TextStyle(color: kFirstColor),),
          content: new Text("Are You sure you want to Sign Out",style:TextStyle(color:kFirstColor)),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Yes",style:TextStyle(color:kFirstColor)),
              onPressed: () {
                Navigator.of(context).pop();
                _signOut();
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => WorkoutScreen()));
              },
            ),
          ],
        );
      },
    );
  }
String _userName;
  Future<void> _getUserName() async {
    FirebaseFirestore.instance
        .collection('Users')
        .doc((await FirebaseAuth.instance.currentUser).uid)
        .get()
        .then((value) {
      setState(() {
        _userName = value.data()['Back Exercises'].toString();
      });
    });
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final initialData = Future<String>.value('initial value');
  String da;
  Future<String> someFutureString = Future.value('initial data seeded');
  Future getCurrentUser() async {
    final User user = await _auth.currentUser;
    String uid = user.uid;
     abc=uid;
    print(abc);
    return uid.toString();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
        children: <Widget>[
          Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.green, Colors.green]
                  )
              ),
              child: Container(
                width: double.infinity,
                height: 350.0,
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 16.0,
                          right: 16.0,
                          bottom: 20.0,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(),
                            _user.photoURL != null?
                            CircleAvatar(
                              backgroundImage: NetworkImage(
                                _user.photoURL??"",
                              ),
radius: 40,
                            )
                                : ClipOval(
                              child: Material(
                                color: Colors.blueGrey.withOpacity(0.3),
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Icon(
                                    Icons.person,
                                    size: 60,
                                    color: Colors.blueGrey,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 16.0),
                            Text(
                              'Welcome To GetFiT(version 1.0)',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                              ),
                            ),
                            SizedBox(height: 8.0),
                            Text(
                              _user.displayName??"",
                              style: TextStyle(
                                color:  Colors.white,
                                fontSize: 26,
                              ),
                            ),
                            SizedBox(height: 8.0),
                            Text(
                              '( ${_user.email} )'??"",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                letterSpacing: 0.5,
                              ),
                            ),
                            SizedBox(height: 24.0),
                            Text(
                              'You are now signed in using your Google account. To sign out of your account, click the "Sign Out" button below.',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  letterSpacing: 0.2),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(
                        height: 10.0,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                    ],
                  ),
                ),
              )
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 30.0,horizontal: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Current Exercises Progress",textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontStyle: FontStyle.normal,
                        fontSize: 28.0
                    ),
                  ),
                  //Back exercise Code from Line Number::
                  //229 to 363
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),),
                  Text(
                    "1) Chest Exercises:",textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontStyle: FontStyle.normal,
                        fontSize: 24.0
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 5),),
                  Text(
                    "1) Chest Press:",textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontStyle: FontStyle.normal,
                        fontSize: 20.0
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 5),),
    Container(
    child: StreamBuilder<DocumentSnapshot>(
    stream: FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .snapshots(),

    builder: (context, snapshot) {
    if (snapshot.hasData && snapshot.data.data()!=null ) {
    return Text(snapshot.data['1) Chest Exercises']["Chest Press"].toString(),
    style: TextStyle(fontSize: 18, color: Colors.blue,),);
    }
    else{
    return new Text(" No Data Related to This Exercise ");
    }
    })),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 5),),
                  Text(
                    "2) Bareball Bench Press:",textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontStyle: FontStyle.normal,
                        fontSize: 20.0
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 5),),
                  Container(
                    alignment: Alignment.centerLeft,
                      child: StreamBuilder<DocumentSnapshot>(
                          stream: FirebaseFirestore.instance
                              .collection('users')
                              .doc(user.uid)
                              .snapshots(),

                          builder: (context, snapshot) {
                            if (snapshot.hasData && snapshot.data.data()!=null) {
                              return Text(snapshot.data['1) Chest Exercises']["Bareball Bench Press"].toString(),
                                style: TextStyle(fontSize: 18, color: Colors.blue,),);
                            }
                            else{
                              return new Text(" No Data Related to This Exercise ");
                            }
                          })),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 5),),
                  Text(
                    "3) Cable Crossover:",textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontStyle: FontStyle.normal,
                        fontSize: 20.0
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 5),),
                  Container(
                      child: StreamBuilder<DocumentSnapshot>(
                          stream: FirebaseFirestore.instance
                              .collection('users')
                              .doc(user.uid)
                              .snapshots(),

                          builder: (context, snapshot) {
                            if (snapshot.hasData && snapshot.data.data()!=null) {
                              return Text(snapshot.data['1) Chest Exercises']["Cable Crossover"].toString(),
                                style: TextStyle(fontSize: 18, color: Colors.blue,),);
                            }
                            else{
                              return new Text(" No Data Related to This Exercise ");
                            }
                          })),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 5),),
                  Text(
                    "4) Dumb bell bench press:",textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontStyle: FontStyle.normal,
                        fontSize: 20.0
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 5),),
                  Container(
                      alignment: Alignment.centerLeft,
                      child: StreamBuilder<DocumentSnapshot>(
                          stream: FirebaseFirestore.instance
                              .collection('users')
                              .doc(user.uid)
                              .snapshots(),

                          builder: (context, snapshot) {
                            if (snapshot.hasData && snapshot.data.data()!=null) {
                              return Text(snapshot.data['1) Chest Exercises']["Dumb bell bench press"].toString(),
                                style: TextStyle(fontSize: 18, color: Colors.blue,),);
                            }
                            else{
                              return new Text(" No Data Related to This Exercise ");
                            }
                          })),






                  //Back exercise Code from Line Number::
                  //372 to 506
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 40),),
                  Text(
                    "Back Exercises:",textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontStyle: FontStyle.normal,
                        fontSize: 24.0
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 5),),
                  Text(
                    "1) Dead lIft:",textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontStyle: FontStyle.normal,
                        fontSize: 20.0
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 5),),
                  Container(
                      child: StreamBuilder<DocumentSnapshot>(
                          stream: FirebaseFirestore.instance
                              .collection('users')
                              .doc(user.uid)
                              .snapshots(),

                          builder: (context, snapshot) {
                            if (snapshot.hasData && snapshot.data.data()!=null) {
                              return Text(snapshot.data['2) Back Exercises']["Dead Lift"].toString(),
                                style: TextStyle(fontSize: 18, color: Colors.blue,),);
                            }
                            else{
                              return new Text(" No Data Related to This Exercise ");
                            }
                          })),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 5),),
                  Text(
                    "2) Row:",textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontStyle: FontStyle.normal,
                        fontSize: 20.0
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 5),),
                  Container(
                      alignment: Alignment.centerLeft,
                      child: StreamBuilder<DocumentSnapshot>(
                          stream: FirebaseFirestore.instance
                              .collection('users')
                              .doc(user.uid)
                              .snapshots(),

                          builder: (context, snapshot) {
                            if (snapshot.hasData && snapshot.data.data()!=null) {
                              return Text(snapshot.data['2) Back Exercises']["Row"].toString(),
                                style: TextStyle(fontSize: 18, color: Colors.blue,),);
                            }
                            else{
                              return new Text(" No Data Related to This Exercise ");
                            }
                          })),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 5),),
                  Text(
                    "3) Inverted Row:",textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontStyle: FontStyle.normal,
                        fontSize: 20.0
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 5),),
                  Container(
                      child: StreamBuilder<DocumentSnapshot>(
                          stream: FirebaseFirestore.instance
                              .collection('users')
                              .doc(user.uid)
                              .snapshots(),

                          builder: (context, snapshot) {
                            if (snapshot.hasData && snapshot.data.data()!=null) {
                              return Text(snapshot.data['2) Back Exercises']["Inverted Row"].toString(),
                                style: TextStyle(fontSize: 18, color: Colors.blue,),);
                            }
                            else{
                              return new Text(" No Data Related to This Exercise ");
                            }
                          })),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 5),),
                  Text(
                    "4) Lat Pull Down:",textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontStyle: FontStyle.normal,
                        fontSize: 20.0
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 5),),
                  Container(
                      alignment: Alignment.centerLeft,
                      child: StreamBuilder<DocumentSnapshot>(
                          stream: FirebaseFirestore.instance
                              .collection('users')
                              .doc(user.uid)
                              .snapshots(),

                          builder: (context, snapshot) {
                            if (snapshot.hasData && snapshot.data.data()!=null) {
                              return Text(snapshot.data['2) Back Exercises']["Lat Pull Down"].toString(),
                                style: TextStyle(fontSize: 18, color: Colors.blue,),);
                            }
                            else{
                              return new Text(" No Data Related to This Exercise ");
                            }
                          })),












                  //Biceps exercise Code from Line Number::
                  //522 to 655
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 40),),
                  Text(
                    "Biceps Exercises:",textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontStyle: FontStyle.normal,
                        fontSize: 24.0
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 5),),
                  Text(
                    "1) Preacher Curl:",textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontStyle: FontStyle.normal,
                        fontSize: 20.0
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 5),),
                  Container(
                      child: StreamBuilder<DocumentSnapshot>(
                          stream: FirebaseFirestore.instance
                              .collection('users')
                              .doc(user.uid)
                              .snapshots(),

                          builder: (context, snapshot) {
                            if (snapshot.hasData && snapshot.data.data()!=null) {
                              return Text(snapshot.data['3) Biceps Exercises']["Preacher Curl"].toString(),
                                style: TextStyle(fontSize: 18, color: Colors.blue,),);
                            }
                            else{
                              return new Text(" No Data Related to This Exercise ");
                            }
                          })),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 5),),
                  Text(
                    "2) Incline dumbBell Curl:",textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontStyle: FontStyle.normal,
                        fontSize: 20.0
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 5),),
                  Container(
                      alignment: Alignment.centerLeft,
                      child: StreamBuilder<DocumentSnapshot>(
                          stream: FirebaseFirestore.instance
                              .collection('users')
                              .doc(user.uid)
                              .snapshots(),

                          builder: (context, snapshot) {
                            if (snapshot.hasData && snapshot.data.data()!=null) {
                              return Text(snapshot.data['3) Biceps Exercises']["Incline dumbBell Curl"].toString(),
                                style: TextStyle(fontSize: 18, color: Colors.blue,),);
                            }
                            else{
                              return new Text(" No Data Related to This Exercise ");
                            }
                          })),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 5),),
                  Text(
                    "3) DumbBell Hammer Curl:",textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontStyle: FontStyle.normal,
                        fontSize: 20.0
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 5),),
                  Container(
                      child: StreamBuilder<DocumentSnapshot>(
                          stream: FirebaseFirestore.instance
                              .collection('users')
                              .doc(user.uid)
                              .snapshots(),

                          builder: (context, snapshot) {
                            if (snapshot.hasData && snapshot.data.data()!=null) {
                              return Text(snapshot.data['3) Biceps Exercises']["DumbBell Hammer Curl"].toString(),
                                style: TextStyle(fontSize: 18, color: Colors.blue,),);
                            }
                            else{
                              return new Text(" No Data Related to This Exercise ");
                            }
                          })),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 5),),
                  Text(
                    "4) Cable Bar Curl:",textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontStyle: FontStyle.normal,
                        fontSize: 20.0
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 5),),
                  Container(
                      alignment: Alignment.centerLeft,
                      child: StreamBuilder<DocumentSnapshot>(
                          stream: FirebaseFirestore.instance
                              .collection('users')
                              .doc(user.uid)
                              .snapshots(),

                          builder: (context, snapshot) {
                            if (snapshot.hasData && snapshot.data.data()!=null) {
                              return Text(snapshot.data['3) Biceps Exercises']["Cable Bar Curl"].toString(),
                                style: TextStyle(fontSize: 18, color: Colors.blue,),);
                            }
                            else{
                              return new Text(" No Data Related to This Exercise ");
                            }
                          })),


                  //Triceps exercise Code from Line Number::
                  //669 to 794
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 40),),
                  Text(
                    "Triceps Exercises:",textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontStyle: FontStyle.normal,
                        fontSize: 24.0
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 5),),
                  Text(
                    "1) Cable Rop Push Down:",textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontStyle: FontStyle.normal,
                        fontSize: 20.0
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 5),),
                  Container(
                      child: StreamBuilder<DocumentSnapshot>(
                          stream: FirebaseFirestore.instance
                              .collection('users')
                              .doc(user.uid)
                              .snapshots(),

                          builder: (context, snapshot) {
                            if (snapshot.hasData && snapshot.data.data()!=null) {
                              return Text(snapshot.data['4) Triceps Exercises']["Cable Rop Push Down"].toString(),
                                style: TextStyle(fontSize: 18, color: Colors.blue,),);
                            }
                            else{
                              return new Text(" No Data Related to This Exercise ");
                            }
                          })),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 5),),
                  Text(
                    "2) Diamond Push Up's:",textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontStyle: FontStyle.normal,
                        fontSize: 20.0
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 5),),
                  Container(
                      alignment: Alignment.centerLeft,
                      child: StreamBuilder<DocumentSnapshot>(
                          stream: FirebaseFirestore.instance
                              .collection('users')
                              .doc(user.uid)
                              .snapshots(),

                          builder: (context, snapshot) {
                            if (snapshot.hasData && snapshot.data.data()!=null) {
                              return Text(snapshot.data['4) Triceps Exercises']["Diamond Push Up's"].toString(),
                                style: TextStyle(fontSize: 18, color: Colors.blue,),);
                            }
                            else{
                              return new Text(" No Data Related to This Exercise ");
                            }
                          })),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 5),),
                  Text(
                    "3) One-Arm Overhead Extension:",textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontStyle: FontStyle.normal,
                        fontSize: 20.0
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 5),),
                  Container(
                      child: StreamBuilder<DocumentSnapshot>(
                          stream: FirebaseFirestore.instance
                              .collection('users')
                              .doc(user.uid)
                              .snapshots(),

                          builder: (context, snapshot) {
                            if (snapshot.hasData && snapshot.data.data()!=null) {
                              return Text(snapshot.data['4) Triceps Exercises']["One-Arm Overhead Extension"].toString(),
                                style: TextStyle(fontSize: 18, color: Colors.blue,),);
                            }
                            else{
                              return new Text(" No Data Related to This Exercise ");
                            }
                          })),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 5),),
                  Text(
                    "4) Lying Triceps Extension:",textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontStyle: FontStyle.normal,
                        fontSize: 20.0
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 5),),
                  Container(
                      alignment: Alignment.centerLeft,
                      child: StreamBuilder<DocumentSnapshot>(
                          stream: FirebaseFirestore.instance
                              .collection('users')
                              .doc(user.uid)
                              .snapshots(),

                          builder: (context, snapshot) {
                            if (snapshot.hasData && snapshot.data.data()!=null) {
                              return Text(snapshot.data['4) Triceps Exercises']["Lying Triceps Extension"].toString(),
                                style: TextStyle(fontSize: 18, color: Colors.blue,),);
                            }
                            else{
                              return new Text(" No Data Related to This Exercise ");
                            }
                          })),



//Traps Exercises From 800 to 934

                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 40),),
                  Text(
                    "Traps Exercises:",textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontStyle: FontStyle.normal,
                        fontSize: 24.0
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 5),),
                  Text(
                    "1) Shrugs:",
                    style: TextStyle(
                        color: Colors.black,
                        fontStyle: FontStyle.normal,
                        fontSize: 20.0
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 5),),
                  Container(
                      child: StreamBuilder<DocumentSnapshot>(
                          stream: FirebaseFirestore.instance
                              .collection('users')
                              .doc(user.uid)
                              .snapshots(),

                          builder: (context, snapshot) {
                            if (snapshot.hasData && snapshot.data.data()!=null) {
                              return Text(snapshot.data['5) Traps Exercises']["Shrugs"].toString(),
                                style: TextStyle(fontSize: 18, color: Colors.blue,),);
                            }
                            else{
                              return new Text(" No Data Related to This Exercise ");
                            }
                          })),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 5),),
                  Text(
                    "2) Barbell Deadlift:",textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontStyle: FontStyle.normal,
                        fontSize: 20.0
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 5),),
                  Container(
                      alignment: Alignment.centerLeft,
                      child: StreamBuilder<DocumentSnapshot>(
                          stream: FirebaseFirestore.instance
                              .collection('users')
                              .doc(user.uid)
                              .snapshots(),

                          builder: (context, snapshot) {
                            if (snapshot.hasData && snapshot.data.data()!=null) {
                              return Text(snapshot.data['5) Traps Exercises']["Barbell Deadlift"].toString(),
                                style: TextStyle(fontSize: 18, color: Colors.blue,),);
                            }
                            else{
                              return new Text(" No Data Related to This Exercise ");
                            }
                          })),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 5),),
                  Text(
                    "3) Upright Rows:",textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontStyle: FontStyle.normal,
                        fontSize: 20.0
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 5),),
                  Container(
                      child: StreamBuilder<DocumentSnapshot>(
                          stream: FirebaseFirestore.instance
                              .collection('users')
                              .doc(user.uid)
                              .snapshots(),

                          builder: (context, snapshot) {
                            if (snapshot.hasData && snapshot.data.data()!=null) {
                              return Text(snapshot.data['5) Traps Exercises']["Upright Rows"].toString(),
                                style: TextStyle(fontSize: 18, color: Colors.blue,),);
                            }
                            else{
                              return new Text(" No Data Related to This Exercise ");
                            }
                          })),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 5),),
                  Text(
                    "4) Rack Pulls:",textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontStyle: FontStyle.normal,
                        fontSize: 20.0
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 5),),
                  Container(
                      alignment: Alignment.centerLeft,
                      child: StreamBuilder<DocumentSnapshot>(
                          stream: FirebaseFirestore.instance
                              .collection('users')
                              .doc(user.uid)
                              .snapshots(),

                          builder: (context, snapshot) {
                            if (snapshot.hasData && snapshot.data.data()!=null) {
                              return Text(snapshot.data['5) Traps Exercises']["Rack Pulls"].toString(),
                                style: TextStyle(fontSize: 18, color: Colors.blue,),);
                            }
                            else{
                              return new Text(" No Data Related to This Exercise ");
                            }
                          })),







                  //Abs Exercises From 944 to 1078

                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 40),),
                  Text(
                    "Abs Exercises:",textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontStyle: FontStyle.normal,
                        fontSize: 24.0
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 5),),
                  Text(
                    "1) Hanging Knee Raise:",textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontStyle: FontStyle.normal,
                        fontSize: 20.0
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 5),),
                  Container(
                      child: StreamBuilder<DocumentSnapshot>(
                          stream: FirebaseFirestore.instance
                              .collection('users')
                              .doc(user.uid)
                              .snapshots(),

                          builder: (context, snapshot) {
                            if (snapshot.hasData && snapshot.data.data()!=null) {
                              return Text(snapshot.data['6) Abs Exercises']["Hanging Knee Raise"].toString(),
                                style: TextStyle(fontSize: 18, color: Colors.blue,),);
                            }
                            else{
                              return new Text(" No Data Related to This Exercise ");
                            }
                          })),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 5),),
                  Text(
                    "2) Dumbbell side bend:",textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontStyle: FontStyle.normal,
                        fontSize: 20.0
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 5),),
                  Container(
                      alignment: Alignment.centerLeft,
                      child: StreamBuilder<DocumentSnapshot>(
                          stream: FirebaseFirestore.instance
                              .collection('users')
                              .doc(user.uid)
                              .snapshots(),

                          builder: (context, snapshot) {
                            if (snapshot.hasData && snapshot.data.data()!=null) {
                              return Text(snapshot.data['6) Abs Exercises']["Dumbbell side bend"].toString(),
                                style: TextStyle(fontSize: 18, color: Colors.blue,),);
                            }
                            else{
                              return new Text(" No Data Related to This Exercise ");
                            }
                          })),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 5),),
                  Text(
                    "3) Barbell back squat:",textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontStyle: FontStyle.normal,
                        fontSize: 20.0
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 5),),
                  Container(
                      child: StreamBuilder<DocumentSnapshot>(
                          stream: FirebaseFirestore.instance
                              .collection('users')
                              .doc(user.uid)
                              .snapshots(),

                          builder: (context, snapshot) {
                            if (snapshot.hasData && snapshot.data.data()!=null) {
                              return Text(snapshot.data['6) Abs Exercises']["Barbell back squat"].toString(),
                                style: TextStyle(fontSize: 18, color: Colors.blue,),);
                            }
                            else{
                              return new Text(" No Data Related to This Exercise ");
                            }
                          })),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 5),),
                  Text(
                    "4)Bird dog:",textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontStyle: FontStyle.normal,
                        fontSize: 20.0
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 5),),
                  Container(
                      alignment: Alignment.centerLeft,
                      child: StreamBuilder<DocumentSnapshot>(
                          stream: FirebaseFirestore.instance
                              .collection('users')
                              .doc(user.uid)
                              .snapshots(),

                          builder: (context, snapshot) {
                            if (snapshot.hasData && snapshot.data.data()!=null) {
                              return Text(snapshot.data['6) Abs Exercises']["Bird dog"].toString(),
                                style: TextStyle(fontSize: 18, color: Colors.blue,),);
                            }
                            else{
                              return new Text(" No Data Related to This Exercise ");
                            }
                          })),









                  //Glutes Exercises From 1090 to 1224

                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 40),),
                  Text(
                    "Glutes Exercises:",textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontStyle: FontStyle.normal,
                        fontSize: 24.0
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 5),),
                  Text(
                    "1) Weighted Squats:",textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontStyle: FontStyle.normal,
                        fontSize: 20.0
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 5),),
                  Container(
                      child: StreamBuilder<DocumentSnapshot>(
                          stream: FirebaseFirestore.instance
                              .collection('users')
                              .doc(user.uid)
                              .snapshots(),

                          builder: (context, snapshot) {
                            if (snapshot.hasData && snapshot.data.data()!=null) {
                              return Text(snapshot.data['7) Glutes Exercises']["Weighted Squats"].toString(),
                                style: TextStyle(fontSize: 18, color: Colors.blue,),);
                            }
                            else{
                              return new Text(" No Data Related to This Exercise ");
                            }
                          })),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 5),),
                  Text(
                    "2) Barbell Hip Thrust:",textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontStyle: FontStyle.normal,
                        fontSize: 20.0
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 5),),
                  Container(
                      alignment: Alignment.centerLeft,
                      child: StreamBuilder<DocumentSnapshot>(
                          stream: FirebaseFirestore.instance
                              .collection('users')
                              .doc(user.uid)
                              .snapshots(),

                          builder: (context, snapshot) {
                            if (snapshot.hasData && snapshot.data.data()!=null) {
                              return Text(snapshot.data['7) Glutes Exercises']["Barbell Hip Thrust"].toString(),
                                style: TextStyle(fontSize: 18, color: Colors.blue,),);
                            }
                            else{
                              return new Text(" No Data Related to This Exercise ");
                            }
                          })),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 5),),
                  Text(
                    "3) Barbell Curtsy lunge:",textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontStyle: FontStyle.normal,
                        fontSize: 20.0
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 5),),
                  Container(
                      child: StreamBuilder<DocumentSnapshot>(
                          stream: FirebaseFirestore.instance
                              .collection('users')
                              .doc(user.uid)
                              .snapshots(),

                          builder: (context, snapshot) {
                            if (snapshot.hasData && snapshot.data.data()!=null) {
                              return Text(snapshot.data['7) Glutes Exercises']["Barbell Curtsy lunge"].toString(),
                                style: TextStyle(fontSize: 18, color: Colors.blue,),);
                            }
                            else{
                              return new Text(" No Data Related to This Exercise ");
                            }
                          })),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 5),),
                  Text(
                    "4)Hip Trust:",textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontStyle: FontStyle.normal,
                        fontSize: 20.0
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 5),),
                  Container(
                      alignment: Alignment.centerLeft,
                      child: StreamBuilder<DocumentSnapshot>(
                          stream: FirebaseFirestore.instance
                              .collection('users')
                              .doc(user.uid)
                              .snapshots(),

                          builder: (context, snapshot) {
                            if (snapshot.hasData && snapshot.data.data()!=null) {
                              return Text(snapshot.data['7) Glutes Exercises']["Hip Trust"].toString(),
                                style: TextStyle(fontSize: 18, color: Colors.blue,),);
                            }
                            else{
                              return new Text(" No Data Related to This Exercise ");
                            }
                          })),






                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 40),),
                  Text(
                    "Legs Exercises:",textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontStyle: FontStyle.normal,
                        fontSize: 24.0
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 5),),
                  Text(
                    "1) Bulgarian Split Squats:",textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontStyle: FontStyle.normal,
                        fontSize: 20.0
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 5),),
                  Container(
                      child: StreamBuilder<DocumentSnapshot>(
                          stream: FirebaseFirestore.instance
                              .collection('users')
                              .doc(user.uid)
                              .snapshots(),

                          builder: (context, snapshot) {
                            if (snapshot.hasData && snapshot.data.data()!=null) {
                              return Text(snapshot.data['8) Legs Exercises']["Bulgarian Split Squats"].toString(),
                                style: TextStyle(fontSize: 18, color: Colors.blue,),);
                            }
                            else{
                              return new Text(" No Data Related to This Exercise ");
                            }
                          })),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 5),),
                  Text(
                    "2) Drop Lunge:",textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontStyle: FontStyle.normal,
                        fontSize: 20.0
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 5),),
                  Container(
                      alignment: Alignment.centerLeft,
                      child: StreamBuilder<DocumentSnapshot>(
                          stream: FirebaseFirestore.instance
                              .collection('users')
                              .doc(user.uid)
                              .snapshots(),

                          builder: (context, snapshot) {
                            if (snapshot.hasData && snapshot.data.data()!=null) {
                              return Text(snapshot.data['8) Legs Exercises']["Drop Lunge"].toString(),
                                style: TextStyle(fontSize: 18, color: Colors.blue,),);
                            }
                            else{
                              return new Text(" No Data Related to This Exercise ");
                            }
                          })),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 5),),
                  Text(
                    "3) Barbell Back Squat:",textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontStyle: FontStyle.normal,
                        fontSize: 20.0
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 5),),
                  Container(
                      child: StreamBuilder<DocumentSnapshot>(
                          stream: FirebaseFirestore.instance
                              .collection('users')
                              .doc(user.uid)
                              .snapshots(),

                          builder: (context, snapshot) {
                            if (snapshot.hasData && snapshot.data.data()!=null) {
                              return Text(snapshot.data['8) Legs Exercises']["Barbell Back Squat"].toString(),
                                style: TextStyle(fontSize: 18, color: Colors.blue,),);
                            }
                            else{
                              return new Text(" No Data Related to This Exercise ");
                            }
                          })),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 5),),
                  Text(
                    "4)Front Squat:",textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontStyle: FontStyle.normal,
                        fontSize: 20.0
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 5),),
                  Container(
                      alignment: Alignment.centerLeft,
                      child: StreamBuilder<DocumentSnapshot>(
                          stream: FirebaseFirestore.instance
                              .collection('users')
                              .doc(user.uid)
                              .snapshots(),

                          builder: (context, snapshot) {
                            if (snapshot.hasData && snapshot.data.data()!=null) {
                              return Text(snapshot.data['8) Legs Exercises']["Front Squat"].toString(),
                                style: TextStyle(fontSize: 18, color: Colors.blue,),);
                            }
                            else{
                              return new Text(" No Data Related to This Exercise ");
                            }
                          })),







                  SizedBox(
                    height: 10.0,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Container(
          ),
          Container(
            width: 150.00,

            // ignore: deprecated_member_use
            child: RaisedButton(
                onPressed: ()   {
               _showDialog();
    },

                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(80.0)
                ),
                elevation: 0.0,
                padding: EdgeInsets.all(0.0),
                child: Ink(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.centerRight,
                        end: Alignment.centerLeft,
                        colors: [kFirstColor,kFirstColor]
                    ),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Container(
                    constraints: BoxConstraints(maxWidth: 150.0, minHeight: 40.0),
                    alignment: Alignment.center,
                    child: Text("Sign Out",
                      style: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight:FontWeight.w300,),
                    ),
                  ),
                )
            ),
          ),
        ],
      ),
    )
    );
  }
}
