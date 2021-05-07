import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:workout_app/screens/about.dart';
import 'package:workout_app/screens/login_screen.dart';
import 'package:workout_app/screens/home_screen.dart';
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
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: StreamBuilder<auth.User>(
          stream: auth.FirebaseAuth.instance.authStateChanges(),
          builder: (BuildContext context, AsyncSnapshot<auth.User> snapshot) {
            if(snapshot.hasData) {
              print("There is a user logged in");
              return TrainScreen();
            }

            else {
              return HomeScreen();
            }
          },
        )
    );
  }
}
