import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Constant.dart';

class RoundedCard extends StatefulWidget {
  Widget? child;
  RoundedCard({this.child});
  @override
  _RoundedState createState() => _RoundedState();
}

class _RoundedState extends State<RoundedCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.5,
      child: widget.child,
    );
  }
}
