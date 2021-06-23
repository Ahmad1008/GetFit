import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:workout_app/constants.dart';
import 'package:workout_app/database/profile.dart';
import 'package:workout_app/database/searching.dart';
import 'package:workout_app/screens/login_screen.dart';
import 'package:workout_app/screens/table.dart';
import 'package:workout_app/screens/tables.dart';
import 'package:workout_app/widgets/custom_widget.dart';
import 'package:workout_app/widgets/exmaple_card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:workout_app/screens/workout_type.dart';
import 'package:workout_app/widgets/BMI_cal.dart';
import 'package:workout_app/widgets/Diet.dart';
import 'package:workout_app/widgets/custom_widget.dart';
import 'package:workout_app/widgets/exmaple_card.dart';
import 'package:workout_app/widgets/exmaple_card_1.dart';
import 'package:workout_app/widgets/exmaple_card_2.dart';

class TrainScreen extends StatefulWidget {
  const TrainScreen({Key key,  User user})
      : _user = user,
        super(key: key);

  final User _user;
  _trainscreen createState()=> _trainscreen();
}

class _trainscreen extends State<TrainScreen>{
  String dropdownvalue = 'View Profile';
  var items =  ['View Profile','Track Exercise'];

  User _user;
  String _chosenValue;
  final firestoreInstance = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  User loggedInUser;

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
  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kThirdColor,
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.55,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/3.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              kThirdColor,
                              Colors.transparent,
                            ],
                          ),
                        ),
                        height: MediaQuery.of(context).size.height * 0.55,
                        width: MediaQuery.of(context).size.width,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          child: Column(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      //work remaining
                                      text: 'Welcome',
                                      style: TextStyle(
                                        fontSize: 25,
                                        color: kFirstColor,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  Spacer(),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 30),),
                                  SizedBox(height: 10),
                                    DropdownButton(
                                      dropdownColor:kThirdColor,
                                      value: dropdownvalue,
                                      icon: Icon(Icons.person,size:50,color:Colors.blueGrey,
                                      ),
                                      items:items.map((String items) {
                                        return DropdownMenuItem(
                                            value: items,
                                            child: Container(
                                                child:Text(items,style: TextStyle(color: kFirstColor),)
                                        ));
                                      }
                                      ).toList(),
                                      onChanged: (String newValue){
                                        setState(() {
                                          dropdownvalue = newValue;
                                          switch(dropdownvalue){
    case "View Profile" :
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => profile(user: loggedInUser,)));
    break;
    case "Track Exercise" :
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => table()));
    break;
                                          }
                                        });
                                      },
                                    ),

                                ],
                              ),

                              Spacer(),
                              Row(
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      text: 'Find ',
                                      style: TextStyle(
                                        fontSize: 25,
                                        color: kFirstColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: 'your Workout',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                  ),
                                  Spacer(),
                                  SvgPicture.asset(
                                    "assets/icons/location.svg",
                                    height: 20,
                                    width: 20,
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              MaterialButton(
                                onPressed:() =>
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => searching(),
                                      ),
                                    ),
                             child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 2),
                                height: 50,
                                width: MediaQuery.of(context).size.width * 0.65,
                                decoration: BoxDecoration(
                                  color: kSecondColor,
                                  borderRadius: BorderRadius.circular(30),
                                ),

                                    child: Center(
                                      child: Text(
                                        "Search Exercises ",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),

                              SizedBox(
                                height: 12,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                  Container(
                  height: 35,
                  width: 180,
                  child: Center(
                  child: Text(
                  "Select your Workout",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  ),
                  ),
                  ],
                  ),
                  SizedBox(height: 20),
                  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  SizedBox(
                  height: 15,
                  ),
                  SizedBox(
                  height: 200,
                  child: ListView(
    scrollDirection: Axis.vertical,
    children: [
    ExampleCard(
    title: "Chest Workouts",
    image: "assets/images/ct.jpg",
    ),
    new Row(children: <Widget>[
    Text(') '),
    Expanded(child: Text(''))
    ], crossAxisAlignment: CrossAxisAlignment.start),
    ExampleCardOne(
    title: "Back Workouts",
    image: "assets/images/bc.jpg",
    ),
    new Row(children: <Widget>[
    Text(') '),
    Expanded(child: Text(''))
    ], crossAxisAlignment: CrossAxisAlignment.start),
    ExampleCardTwo(
    title: "Legs Workouts",
    image: "assets/images/leg.jpg",
    ),
    new Row(children: <Widget>[
    Text(') '),
    Expanded(child: Text(''))
    ], crossAxisAlignment: CrossAxisAlignment.start),
    ],
    ),
    )
    ],
    ),
    SizedBox(
    height: 80,
    )
    ],
    ),
    ),
    Positioned(
    bottom: 0,
    left: 0,
    right: 0,
    child: Container(
    height: 75,
    width: MediaQuery.of(context).size.width,
    color: Color(0xFF242538),
    child: Padding(
    padding: const EdgeInsets.symmetric(
    vertical: 25, horizontal: 30),
    child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
    CustomIcon(),
    // ignore: deprecated_member_use
    FlatButton(
    onPressed: () => Navigator.push(
    context,
    MaterialPageRoute(
    // ignore: deprecated_member_use
    builder: (context) => type())),
    child: Center(
    child: Text(
    " Workout",
    style: TextStyle(
    color: Colors.white,
    fontSize: 16,
    ),
    ),
    ),
    ),
    // ignore: deprecated_member_use
    FlatButton(
    onPressed: () => Navigator.push(context,
    MaterialPageRoute(builder: (context) => diet())),
    child: Center(
    child: Text(
    "Diet",
    style: TextStyle(
    color: Colors.white,
    fontSize: 16,
    ),
    ),
    ),
    ),
    // ignore: deprecated_member_use
    FlatButton(
    onPressed: () => Navigator.push(context,
    MaterialPageRoute(builder: (context) => BMI())),
    child: Center(
    child: Text(
    "BMI-Cal",
    style: TextStyle(
    color: Colors.white,
    fontSize: 16,
    ),
    ),
    ),
    ),
    ],
                  ),
                ))
    )
          ],
        ),
      ),
    );
  }
}
