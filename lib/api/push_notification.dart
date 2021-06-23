import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class notific extends StatefulWidget {
  static const routeName = '/home';
  @override
  _notific createState() => _notific();
}

class _notific extends State<notific> {
  _notific createState() => _notific();
  final Firebase _db= FirebaseFirestore.instance as Firebase;
final FirebaseMessaging _fcm= FirebaseMessaging.instance;
void initState(){
  super.initState();
}

  @override
  Widget build(BuildContext context) {
    return null;
  }
}