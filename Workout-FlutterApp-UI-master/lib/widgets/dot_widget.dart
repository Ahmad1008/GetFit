import 'package:flutter/material.dart' show BoxDecoration, BoxShape, BuildContext, Container, Key, StatelessWidget, Widget;

import '../constants.dart';

// ignore: camel_case_types
class dotWidget extends StatelessWidget {
  const dotWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10,
      width: 10,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: kFirstColor,
      ),
      // color: kFirstColor,
    );
  }
}
