import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class back extends StatefulWidget {
  @override
  _DataTableExample createState() => _DataTableExample();
}

class _DataTableExample extends State<back> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xFF40D876),
            title: Text('Back workout'),
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
              'Back Workout',
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
                  DataCell(Text('Australian Pull-Up')),
                  DataCell(Text('3')),
                  DataCell(Text('12')),
                  DataCell(
                    IconButton(
                      icon: Icon(Icons.play_circle_fill_outlined),
                      iconSize: 30,
                      color: Colors.green.shade400,
                      onPressed: () {
                        //Navigator.push(
                        //  context,
                        // MaterialPageRoute(builder: (context) => table()),
                        //  );
                      },
                    ),
                  ),
                ]),
                DataRow(cells: [
                  DataCell(Text('Bent-Over Rows')),
                  DataCell(Text('3')),
                  DataCell(Text('12')),
                  DataCell(
                    IconButton(
                      icon: Icon(Icons.play_circle_fill_outlined),
                      iconSize: 30,
                      color: Colors.green.shade400,
                      onPressed: () {
                        //Navigator.push(
                        //  context,
                        // MaterialPageRoute(builder: (context) => table()),
                        //  );
                      },
                    ),
                  ),
                ]),
                DataRow(cells: [
                  DataCell(Text('Deadlifts')),
                  DataCell(Text('3')),
                  DataCell(Text('12')),
                  DataCell(
                    IconButton(
                      icon: Icon(Icons.play_circle_fill_outlined),
                      iconSize: 30,
                      color: Colors.green.shade400,
                      onPressed: () {
                        //Navigator.push(
                        //  context,
                        // MaterialPageRoute(builder: (context) => table()),
                        //  );
                      },
                    ),
                  ),
                ]),
                DataRow(cells: [
                  DataCell(Text('One-Arm Rows(Dumbbell)')),
                  DataCell(Text('4')),
                  DataCell(Text('15')),
                  DataCell(
                    IconButton(
                      icon: Icon(Icons.play_circle_fill_outlined),
                      iconSize: 30,
                      color: Colors.green.shade400,
                      onPressed: () {
                        //Navigator.push(
                        //  context,
                        // MaterialPageRoute(builder: (context) => table()),
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
