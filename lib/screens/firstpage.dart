import 'package:flutter/material.dart';


class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Card"),
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios)),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: <Widget>[
          Card(child: Cards('1firstText', 'secondtext', 'thirdtext')),
          Card(child: Cards('1', 'secondtext', 'thirdtext')),
          Card(child: Cards('1', 'secondtext', 'thirdtext')),
          Card(child: Cards('1', 'secondtext', 'thirdtext')),
        ],
      ),
    );
  }

  Widget Cards(String firsttxt, String secondtext, String thirdtext) {
    return Container(
        height: 280,
        child: Stack(children: [
          Column(
            children: [
              Image.asset(""),
              SizedBox(
                height: 70,
              ),
              ListTile(
                leading: Text(firsttxt),
              ),
              ListTile(
                leading: Text(secondtext),
                trailing:GestureDetector(onTap:(){},
                child:Icon(
                  Icons.play_circle_fill_outlined,
                  size: 40,
                ),),
              ),
              ListTile(
                leading: Text(thirdtext),
              ),
            ],
          ),
        ]));
  }
}
