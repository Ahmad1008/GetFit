import 'package:flutter/material.dart';

class ExampleCard extends StatefulWidget {
  final String image, title;
  const ExampleCard({
    Key key,
    this.image,
    this.title,
  }) : super(key: key);

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
            child: Image.asset(
              widget.image,
              fit: BoxFit.cover,
              height: 150.0,
              width: 420.0,
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
