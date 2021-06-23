import 'package:flutter/material.dart';
import 'package:workout_app/screens/secondPage.dart';
import 'package:workout_app/widgets/w_gain.dart';

class type extends StatefulWidget {
  @override
  _ListState createState() => _ListState();
}

class _ListState extends State<type> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF40D876),
        title: Text("Workout"),
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios)),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                " Select you workout type ...... ",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: 15),
          buildImageCard(),
          Spacer(),
          buildImageCard_1(),
        ],
      ),
    );
  }

  Widget buildImageCard() => Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Ink.image(
              image: NetworkImage(
                'https://static0.thesportsterimages.com/wordpress/wp-content/uploads/2015/05/Kai-greene-workout-routine.jpg?q=50&fit=crop&w=740&h=416&dpr=1.5',
              ),
              colorFilter: ColorFilters.greyscale,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => weight_gain()),
                  );
                },
              ),
              height: 240,
              fit: BoxFit.cover,
            ),
            Text(
              'Gain Weight',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ],
        ),
      );

  Widget buildImageCard_1() => Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Ink.image(
              image: NetworkImage(
                'https://media.istockphoto.com/photos/muscular-man-training-his-back-picture-id1028271392?k=6&m=1028271392&s=612x612&w=0&h=8tfn7RA_Jzw7_ULTM4RFs1ELqGT9vnYMzgS7JA5ixFE=',
              ),
              colorFilter: ColorFilters.greyscale,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => page()),
                  );
                },
              ),
              height: 240,
              fit: BoxFit.cover,
            ),
            Text(
              'Lose Weight',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ],
        ),
      );
}

class ColorFilters {
  static final greyscale = ColorFilter.matrix(<double>[
    /// greyscale filter
    0.1126, 0.5152, 0.0522, 0, 0,
    0.1126, 0.5152, 0.0522, 0, 0,
    0.1126, 0.5152, 0.0522, 0, 0,
    0, 0, 0, 1, 0
  ]);
}
