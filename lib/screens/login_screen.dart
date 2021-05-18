import 'package:flutter/material.dart'
    show
        Align,
        Alignment,
        AssetImage,
        Border,
        BorderRadius,
        BorderSide,
        BoxDecoration,
        BoxFit,
        BuildContext,
        Center,
        Color,
        Colors,
        Column,
        Container,
        CrossAxisAlignment,
        DecorationImage,
        EdgeInsets,
        FlatButton,
        FontWeight,
        InputDecoration,
        LinearGradient,
        MaterialButton,
        MaterialPageRoute,
        MediaQuery,
        Navigator,
        Padding,
        RichText,
        Scaffold,
        SingleChildScrollView,
        SizedBox,
        Spacer,
        Stack,
        Text,
        TextField,
        TextSpan,
        TextStyle,
        UnderlineInputBorder,
        Widget;
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:workout_app/constants.dart' show kFirstColor, kThirdColor;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:workout_app/screens/register.dart';
import 'package:workout_app/screens/train_screen.dart';
class WorkoutScreen extends StatefulWidget {
  static const routeName = '/home';
  @override
  _WorkoutScreenState createState() => _WorkoutScreenState();
}

class _WorkoutScreenState extends State<WorkoutScreen> {
  _WorkoutScreenState createState() => _WorkoutScreenState();

  Future<void> _login() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: _email, password: _password);
    } on FirebaseAuthException catch (e) {
      print("Error: $e");
    } catch (e) {
      print("Error: $e");
    }
  }

  String _email;
  String _password;
  Future<void> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    return TrainScreen();
  }
  Future<UserCredential> signInWithFacebook() async {
    // Trigger the sign-in flow
    final AccessToken result = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final facebookAuthCredential = FacebookAuthProvider.credential(result.token);

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
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
                      onChanged: (value) {
                        _email = value;
                        print("Email:: $value");
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
                      onChanged: (value) {
                        _password = value;
                        print("Password:: $value");
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
                          onPressed: () {},
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
                          onPressed: signInWithGoogle,
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
                          onPressed: signInWithFacebook,
                          child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                    "assets/icons/saved.png"),
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


