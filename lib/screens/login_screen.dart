import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart'
    show Align, Alignment, AssetImage, Border, BorderRadius, BorderSide, BoxDecoration, BoxFit, BuildContext, Center, Color, Colors, Column, Container, CrossAxisAlignment, DecorationImage, EdgeInsets, FlatButton, FontWeight, Icons, InputDecoration, LinearGradient, MaterialButton, MaterialPageRoute, MediaQuery, Navigator, Padding, RichText, Scaffold, SingleChildScrollView, SizedBox, Spacer, Stack, Text, TextField, TextSpan, TextStyle, UnderlineInputBorder, Widget;
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:workout_app/constants.dart' show kFirstColor, kThirdColor;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:workout_app/database/profile.dart';
import 'package:workout_app/database/userprofile.dart';
import 'package:workout_app/screens/home_screen.dart';
import 'package:workout_app/screens/register.dart';
import 'package:workout_app/screens/sign_phone_form.dart';
import 'package:workout_app/screens/train_screen.dart';
class WorkoutScreen extends StatefulWidget {
  static const routeName = '/home';
  @override
  _WorkoutScreenState createState() => _WorkoutScreenState();
}

class _WorkoutScreenState extends State<WorkoutScreen> {
  _WorkoutScreenState createState() => _WorkoutScreenState();
  final _auth = FirebaseAuth.instance;
User loggedInUser;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
      }
    } catch (e) {
      print(e);
    }
  }
  Future<void> _login() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: _email, password: _password);
      User user = userCredential.user;
      if(user.emailVerified) {
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
        return Navigator.push(context, MaterialPageRoute(
            builder: (context) => TrainScreen()));
      }
    } on FirebaseAuthException catch (e) {
      print("Error: $e");
    } catch (e) {
      print("Error: $e");
    }
  }

  String _email;
  String _password;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final firestoreInstance = FirebaseFirestore.instance;
  Future<void> signInWithGoogle() async {
    print("Current user is:");
    final googleSignIn = GoogleSignIn();
     googleSignIn.disconnect();
    final googleUser = await googleSignIn.signIn();
    print("Current User is:$googleUser");
    if (googleUser != null) {
      final googleAuth = await googleUser.authentication;
      if (googleAuth.idToken != null) {
        final userCredential = await _firebaseAuth.signInWithCredential(
          GoogleAuthProvider.credential(
              idToken: googleAuth.idToken, accessToken: googleAuth.accessToken),
        );
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
        return Navigator.push(context, MaterialPageRoute(
            builder: (context) => TrainScreen()));
      }
    } else {
      throw FirebaseAuthException(
        message: "Sign in aborded by user",
        code: "ERROR_ABORDER_BY_USER",
      );
    }
  }

  Future sendPasswordResetEmail(String email) async {
    return _firebaseAuth.sendPasswordResetEmail(
        email: '$_email');
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kThirdColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.35,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/5.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.topCenter,
                      colors: [
                        kThirdColor,
                        Colors.transparent,
                      ],
                    ),
                  ),
                  height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.55,
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    child: Column(
                      children: [
                        SizedBox(height: 40),
                        RichText(
                          text: TextSpan(
                            text: 'Get',
                            style: TextStyle(
                                fontFamily: "Bebas",
                                fontSize: 40,
                                letterSpacing: 5),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Fit',
                                style: TextStyle(color: kFirstColor),
                              )
                            ],
                          ),
                        ),
                        Spacer(),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Sign in",
                                style: TextStyle(
                                  fontSize: 40,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                "train and live the new experience of \nexercising"
                                    " at home",
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Email",
                      style: TextStyle(color: Color(0xFF707070), fontSize: 18),
                    ),
                    TextField(
                      style: TextStyle(color: Colors.white),
                      onChanged: (value) {
                        _email = value;
                        print("Email:: $value");
                        EmailValidator();
                      },
                      decoration: InputDecoration(
                        hintText: "example@gmail.com",
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF707070)),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF707070)),
                        ),
                        hintStyle: TextStyle(
                          color: Colors.white,
                        ),
                      ),

                    ),
                    SizedBox(height: 10),
                    Text(
                      "Password",
                      style: TextStyle(color: Color(0xFF707070), fontSize: 18),
                    ),
                    TextField(
                      style: TextStyle(color: Colors.white),
                      onChanged: (value) {
                        _password = value;
                        print("Password:: $value");
                        PasswordValidator();
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "********",
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF707070)),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF707070)),
                        ),
                        hintStyle: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerRight,
                      child: FlatButton(
                          onPressed: () {
                            sendPasswordResetEmail('$_email');
                          },
                          child: Text(
                            "Forgot you password?",
                            style: TextStyle(color: Colors.white),
                          )),
                    ),
                    Center(
                      child: Column(
                        children: [
                          SizedBox(height: 10),
                          MaterialButton(
                            onPressed: _login,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: kFirstColor,
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
                          SizedBox(height: 20),
                          MaterialButton(
                            onPressed: () =>
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => register(),
                                  ),
                                ),
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
                                  "Sign up",
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
                    SizedBox(height: 10),
                    Align(
                      alignment: Alignment.center,
                      child: FlatButton(
                          onPressed: () {},
                          child: Text(
                            "OR ",
                            style: TextStyle(color: Colors.white),
                          )),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Row(children: [
                        SizedBox(height: 10),
                        MaterialButton(
                          onPressed:signInWithGoogle,



                          child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                    "assets/icons/google_login.png"),
                              ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            height: 30,
                            width: MediaQuery
                                .of(context)
                                .size
                                .width * 0.35,
                          ),
                        ),


                        SizedBox(height: 10),
                        SizedBox(height: 10),
                        MaterialButton(
                            onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => phoneLoginScreen(),
                              ),
                            ),
                          child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                    "assets/icons/phone.jpg"),
                              ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            height: 30,
                            width: MediaQuery
                                .of(context)
                                .size
                                .width * 0.35,
                          ),
                        ),
                      ]),
                    ),
                    SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class EmailValidator {
  static String validate(String value) {
    if(value.isEmpty) {
      return "Email can't be empty";
    }
    return null;
  }
}

class PasswordValidator {
  static String validate(String value) {
    if(value.isEmpty) {
      return "Password can't be empty";
    }
    return null;
  }
}


