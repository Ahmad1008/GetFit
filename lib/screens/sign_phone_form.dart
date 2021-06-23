import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart'
show AlertDialog, Align, Alignment, AssetImage, Border, BorderRadius, BorderSide, BoxDecoration, BoxFit, BuildContext, Center, Color, Colors, Column, Container, CrossAxisAlignment, DecorationImage, EdgeInsets, FlatButton, FontWeight, InputDecoration, LinearGradient, MaterialButton, MaterialPageRoute, MediaQuery, Navigator, OutlineInputBorder, Padding, RichText, Scaffold, SingleChildScrollView, SizedBox, Spacer, Stack, StatelessWidget, Text, TextEditingController, TextField, TextFormField, TextSpan, TextStyle, UnderlineInputBorder, Widget, showDialog;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:workout_app/constants.dart';
import 'package:workout_app/screens/train_screen.dart';

import 'details_train_screen.dart';

class phoneLoginScreen extends StatelessWidget {
  final _phoneController = TextEditingController();
  final _codeController = TextEditingController();
  final firestoreInstance = FirebaseFirestore.instance;
  Future<bool> loginUser(String phone, BuildContext context) async{
    FirebaseAuth _auth = FirebaseAuth.instance;

    _auth.verifyPhoneNumber(
        phoneNumber: phone,
        timeout: Duration(seconds: 60),
        verificationCompleted: (AuthCredential credential) async{
          Navigator.of(context).pop();

          UserCredential result = await _auth.signInWithCredential(credential);

          User user = result.user;

          if(user != null){
            var firebaseUser = FirebaseAuth.instance.currentUser;
            firestoreInstance.collection("users").doc(firebaseUser.uid).set(
                {
                  "1) Chest Exercises": {
                    "Chest Press": {},
                    "Bareball Bench Press": {},
                    "Cable Crossover": {},
                    "Dumb bell bench press": {},
                  },
                }, SetOptions(merge: true)).then((_) {
              print("success!");
            });
            firestoreInstance.collection("users").doc(firebaseUser.uid).set(
                {
                  "2) Back Exercises": {
                    "Dead Lift": {},
                    "Row": {},
                    "Inverted Row": {},
                    "Lat Pull Down": {},
                  },
                }, SetOptions(merge: true)).then((_) {
              print("success!");
            });
            firestoreInstance.collection("users").doc(firebaseUser.uid).set(
                {
                  "3) Biceps Exercises": {
                    "Preacher Curl": {},
                    "Incline dumbBell Curl": {},
                    "DumbBell Hammer Curl": {},
                    "Cable Bar Curl": {},
                  }
                }, SetOptions(merge: true)).then((_) {
              print("success!");
            });

            firestoreInstance.collection("users").doc(firebaseUser.uid).set(
                {
                  "4) Triceps Exercises": {
                    "Cable Rop Push Down": {},
                    "Diamond Push Up's": {},
                    "One-Arm Overhead Extension": {},
                    "Lying Triceps Extension": {},
                  }
                }, SetOptions(merge: true)).then((_) {
              print("success!");
            });
            firestoreInstance.collection("users").doc(firebaseUser.uid).set(
                {
                  "5) Traps Exercises": {
                    "Shrugs": {},
                    "Barbell Deadlift": {},
                    "Upright Rows": {},
                    "Rack Pulls": {},
                  }
                }, SetOptions(merge: true)).then((_) {
              print("success!");
            });
            firestoreInstance.collection("users").doc(firebaseUser.uid).set(
                {
                  "6) Abs Exercises": {
                    "Hanging Knee Raise": {},
                    "Dumbbell side bend": {},
                    "Barbell back squat": {},
                    "Bird dog": {},
                  }
                }, SetOptions(merge: true)).then((_) {
              print("success!");
            });
            firestoreInstance.collection("users").doc(firebaseUser.uid).set(
                {
                  "7) Glutes Exercises": {
                    "Weighted Squats": {},
                    "Barbell Hip Thrust": {},
                    "Barbell Curtsy lunge": {},
                    "Hip Trust": {},
                  }
                }, SetOptions(merge: true)).then((_) {
              print("success!");
            });
            firestoreInstance.collection("users").doc(firebaseUser.uid).set(
                {
                  "8) Legs Exercises": {
                    "Bulgarian Split Squats": {},
                    "Drop Lunge": {},
                    "Barbell Back Squat": {},
                    "Front Squat": {},
                  }
                }, SetOptions(merge: true)).then((_) {
              print("success!");
            });
            Navigator.push(context, MaterialPageRoute(
                builder: (context) => TrainScreen(user: user,)
            ));

          }else{
            print("Error");
          }
          //This callback would gets called when verification is done auto maticlly
        },
        verificationFailed: (FirebaseAuthException exception){
          print(exception);
        },
        codeSent: (String verificationId, [int forceResendingToken]){
          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) {
                return AlertDialog(
                  title: Text("Enter the code You Recieved via SMS?"),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      TextField(
                        controller: _codeController,
                      ),
                    ],
                  ),
                  actions: <Widget>[
                    FlatButton(
                      child: Text("Confirm"),
                      textColor: Colors.white,
                      color: Colors.blue,
                      onPressed: () async{
                        final code = _codeController.text.trim();
                        AuthCredential credential = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: code);

                        UserCredential result = await _auth.signInWithCredential(credential);

                        User user = result.user;

                        if(user != null ){
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => TrainScreen(user: user,)
                          ));
                        }else{
                          print("Error");
                        }
                      },
                    )
                  ],
                );
              }
          );
        },
        codeAutoRetrievalTimeout: null
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(32),
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Login", style: TextStyle(color: Colors.lightBlue, fontSize: 36, fontWeight: FontWeight.w500),),

                  SizedBox(height: 16,),

                  TextFormField(
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            borderSide: BorderSide(color: Colors.grey[200])
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            borderSide: BorderSide(color: Colors.grey[300])
                        ),
                        filled: true,
                        fillColor: Colors.grey[100],
                        hintText: "Mobile Number(+92)"

                    ),
                    controller: _phoneController,
                  ),

                  SizedBox(height: 20),
                  MaterialButton(
                    onPressed: () {
                      final phone = _phoneController.text.trim();

                      loginUser(phone, context);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: kThirdColor,
                        border:
                        Border.all(width: 1, color: kFirstColor),
                      ),
                      height: 50,
                      width: MediaQuery
                          .of(context)
                          .size
                          .width * 0.7,
                      child: Center(
                        child: Text(
                          "Login",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
    );
  }
}