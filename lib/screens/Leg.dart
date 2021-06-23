import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:workout_app/widgets/w_gain.dart';

// ignore: camel_case_types
class leg extends StatefulWidget {
  @override
  _DataTableExample createState() => _DataTableExample();
}

class _DataTableExample extends State<leg> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xFF40D876),
            title: Text('Leg Workout'),
            leading: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(Icons.arrow_back_ios)),
          ),
          body: ListView(children: <Widget>[
            SizedBox(height: 30),
            Center(
                child: Text(
              'Leg Workout',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            )),
            DataTable(
              columns: [
                DataColumn(
                    label: Text('Exercises',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold))),
                DataColumn(
                    label: Text('Sets',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold))),
                DataColumn(
                    label: Text('Reps',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold))),
                DataColumn(
                    label: Text('Play ',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold))),
              ],
              rows: [
                DataRow(cells: [
                  DataCell(Text('Angled Leg Press')),
                  DataCell(Text('3')),
                  DataCell(Text('15')),
                  DataCell(
                    IconButton(
                      icon: Icon(Icons.play_circle_fill_outlined),
                      iconSize: 30,
                      color: Colors.green.shade400,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => weight_gain()));
                        //  );
                      },
                    ),
                  ),
                ]),
                DataRow(cells: [
                  DataCell(Text('Hack Squats')),
                  DataCell(Text('3')),
                  DataCell(Text('15')),
                  DataCell(
                    IconButton(
                      icon: Icon(Icons.play_circle_fill_outlined),
                      iconSize: 30,
                      color: Colors.green.shade400,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => weight_gain()));
                        //  );
                      },
                    ),
                  ),
                ]),
                DataRow(cells: [
                  DataCell(Text('Leg Extensions')),
                  DataCell(Text('3')),
                  DataCell(Text('15')),
                  DataCell(
                    IconButton(
                      icon: Icon(Icons.play_circle_fill_outlined),
                      iconSize: 30,
                      color: Colors.green.shade400,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => weight_gain()));
                        //  );
                      },
                    ),
                  ),
                ]),
                DataRow(cells: [
                  DataCell(Text('Lunges (Dumbbell)')),
                  DataCell(Text('4')),
                  DataCell(Text('15')),
                  DataCell(
                    IconButton(
                      icon: Icon(Icons.play_circle_fill_outlined),
                      iconSize: 30,
                      color: Colors.green.shade400,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => weight_gain()));
                        //  );
                      },
                    ),
                  ),
                ]),
              ],
            ),
          ])),
    );
  }
}
