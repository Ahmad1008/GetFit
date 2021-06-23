import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:workout_app/screens/details_train_screen.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:firebase_core/firebase_core.dart';
import 'package:workout_app/screens/train_screen.dart';
import 'dart:async';
Future<void> main( ) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  final _auth = FirebaseAuth.instance;
  User loggedInUser;
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
  @override
  Widget build(BuildContext context) {
     User currentUser;
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: StreamBuilder<auth.User>(
          stream: auth.FirebaseAuth.instance.authStateChanges(),
          builder: (BuildContext context, AsyncSnapshot<auth.User> snapshot) {
            if(snapshot.hasData==true) {
              print("There is a user logged in");
              return TrainScreen(user: currentUser,);
            }

            else {
              return DetailsTrain();
            }
          },
        )

    );
  }
}
