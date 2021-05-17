
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
// ignore: camel_case_types
class register extends StatefulWidget {
  @override
  _registerState createState() => _registerState();
}

// ignore: camel_case_types
class _registerState extends State<register> {
  Future<void> _createuser() async{
    try{
      UserCredential userCredential =await FirebaseAuth.instance.createUserWithEmailAndPassword
        (email: _email, password: _password) ;
    }   on FirebaseAuthException catch(e)     {
      print("Error: $e");
    }catch(e){
      print("Error: $e");
    }
  }
  String _email;
  String _password;
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: kThirdColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.55,
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
                                "Create New Account",
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
              child:Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Email",
                      style: TextStyle(color: Color(0xFF707070), fontSize: 18),
                    ),
                    TextField(
onChanged: (value){
  _email=value;

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
                      )
    ),


                    SizedBox(height: 10),
                    Text(
                      "Password",
                      style: TextStyle(color: Color(0xFF707070), fontSize: 18),
                    ),
                    TextField(
                      onChanged: (value){
                        _password=value;

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
                          onPressed: (){

                          },
                          child: Text(
                            "Forgot you password?",
                            style: TextStyle(color: Colors.white),
                          )),
                    ),
                    Center(
                      child: Column(
                        children: [
                          SizedBox(height: 20),
                          FlatButton(
                            onPressed: _createuser,

                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: kFirstColor,
                              ),
                              height: 50,
                              width: MediaQuery.of(context).size.width * 0.7,
                              child: Center(
                                child: Text(
                                  "Create New Account",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),

                        ],
                      ),
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
