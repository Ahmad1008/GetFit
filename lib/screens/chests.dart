import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:workout_app/widgets/w_gain.dart';

import 'ex1.dart';

// ignore: camel_case_types
class chest extends StatefulWidget {
  @override
  _DataTableExample createState() => _DataTableExample();
}

class _DataTableExample extends State<chest> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xFF40D876),
            title: Text('Chest Workout'),
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
              'Chest Workout',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            )),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  " 1. Upper Chest Workout ",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 15),
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
                  DataCell(Text('Barbell Bench Press')),
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
                          MaterialPageRoute(builder: (context) => weight_gain()),
                        );
                      },
                    ),
                  ),
                ]),
                DataRow(cells: [
                  DataCell(Text('Dumbbell bench press')),
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
                          MaterialPageRoute(builder: (context) => Diet()),
                        );
                      },
                    ),
                  ),
                ]),
                DataRow(cells: [
                  DataCell(Text('Dumbbell Flys')),
                  DataCell(Text('3')),
                  DataCell(Text('16')),
                  DataCell(
                    IconButton(
                      icon: Icon(Icons.play_circle_fill_outlined),
                      iconSize: 30,
                      color: Colors.green.shade400,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Diet()),
                        );
                      },
                    ),
                  ),
                ]),
                DataRow(cells: [
                  DataCell(Text('Machine Press')),
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
                          MaterialPageRoute(builder: (context) => Diet()),
                        );
                      },
                    ),
                  ),
                ]),
                DataRow(cells: [
                  DataCell(Text('Declined Push-ups')),
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
                          MaterialPageRoute(builder: (context) => Diet()),
                        );
                      },
                    ),
                  ),
                ]),
                DataRow(cells: [
                  DataCell(Text('Diamond Push-ups')),
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
                          MaterialPageRoute(builder: (context) => Diet()),
                        );
                      },
                    ),
                  ),
                ]),
              ],
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  " 2. Lower Chest Workout ",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 15),
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
                  DataCell(Text('Bent-Forward Crossovers')),
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
                          MaterialPageRoute(builder: (context) => Diet()),
                        );
                      },
                    ),
                  ),
                ]),
                DataRow(cells: [
                  DataCell(Text('Decline Bench Press')),
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
                          MaterialPageRoute(builder: (context) => Diet()),
                        );
                      },
                    ),
                  ),
                ]),
                DataRow(cells: [
                  DataCell(Text('Dumbbell Flys')),
                  DataCell(Text('3')),
                  DataCell(Text('16')),
                  DataCell(
                    IconButton(
                      icon: Icon(Icons.play_circle_fill_outlined),
                      iconSize: 30,
                      color: Colors.green.shade400,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Diet()),
                        );
                      },
                    ),
                  ),
                ]),
                DataRow(cells: [
                  DataCell(Text('Decline Bench Press')),
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
                          MaterialPageRoute(builder: (context) => Diet()),
                        );
                      },
                    ),
                  ),
                ]),
                DataRow(cells: [
                  DataCell(Text('Dips')),
                  DataCell(Text('3')),
                  DataCell(Text('8')),
                  DataCell(
                    IconButton(
                      icon: Icon(Icons.play_circle_fill_outlined),
                      iconSize: 30,
                      color: Colors.green.shade400,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Diet()),
                        );
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
