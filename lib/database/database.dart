import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:workout_app/screens/sign_phone_form.dart';
List<ListWords>  listWords = [
  ListWords('Chest Exercises', 'Data Not Found'),
  ListWords('Back Exercises', 'Data Not Found'),
  ListWords('Biceps Exercises', 'Data Not Found'),
  ListWords('Triceps Exercises', 'Data Not Found'),
  ListWords('Traps Exercises', 'Data Not Found'),
  ListWords('Abs Exercises', 'Data Not Found'),
  ListWords('Glutes Exercises', 'Data Not Found'),
  ListWords('Legs Exercises', 'Data Not Found'),


];

class ListWords {
  String titlelist;
  String definitionlist;

  ListWords(String titlelist, String definitionlist) {
    this.titlelist = titlelist;
    this.definitionlist = definitionlist;
  }
}
class Detail extends StatelessWidget {

  final ListWords listWordsDetail;

  Detail({Key key, @required this.listWordsDetail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          brightness: Brightness.dark,
          title: const Text('Détail', style: TextStyle(color: Colors.white)),
          iconTheme: IconThemeData(color: Colors.white),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(listWordsDetail.titlelist +' (on detail page)'),
              Text(listWordsDetail.definitionlist),
            ],
          ),
        )
    );
  }
}
class fields {

final String email;
final String reps;
final String sets;

fields({ this.email,this.sets,this.reps });

}
class DatabaseService {

  final String uid;
  DatabaseService({ this.uid });
  // collection reference
  final CollectionReference UsersData = FirebaseFirestore.instance.collection('users');
  Future<void> updateUserData(String email, String name, String password) async {
    return await UsersData.doc(uid).set({
      'email': email,
      'name': name,
      'password': password,
    });
}
  Stream<QuerySnapshot> get data {
    return UsersData.snapshots();
  }

}