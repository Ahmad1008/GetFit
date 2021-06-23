import 'package:flutter/material.dart';
import 'package:workout_app/screens/chests.dart';
class ExampleCard extends StatefulWidget {
  final String image, title;
  const ExampleCard({
    this.image,
    this.title,
    Function() onTap,
  });

  @override
  _ExampleCardState createState() => _ExampleCardState();
}

class _ExampleCardState extends State<ExampleCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => chest()),
                );
              },
              child: Image.asset(
                widget.image,
                fit: BoxFit.cover,
                height: 150.0,
                width: 420.0,
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            widget.title,
            style: TextStyle(color: Colors.white, fontSize: 14),
          )
        ],
      ),
    );
  }
}
