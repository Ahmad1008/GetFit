import 'package:flutter/material.dart';

class page extends StatefulWidget {
  @override
  _ListState createState() => _ListState();
}

class _ListState extends State<page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List"),
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios)),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: <Widget>[
          Card(child: Cards('1firstTet', 'secondtext', 'thirdtext')),
          Card(child: Cards('1', 'secondtext', 'thirdtext')),
          Card(child: Cards('1', 'secondtext', 'thirdtext')),
          Card(child: Cards('1', 'secondtext', 'thirdtext')),
        ],
      ),
    );
  }

  Widget Cards(String firsttxt, String secondtext, String thirdtext) {
    return Stack(children: [
      Column(
        children: [
          ListTile(
            leading: Text(firsttxt),
          ),
          ListTile(
            leading: Text(secondtext),
            trailing: Icon(
              Icons.play_circle_fill_outlined,
              size: 40,
            ),
          ),
          ListTile(
            leading: Text(thirdtext),
          ),
        ],
      ),
    ]);
  }
}
