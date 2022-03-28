import 'package:flutter/material.dart';

class ConstantDialog extends StatefulWidget {
  Widget? Child;
  double? height;
  ConstantDialog({this.Child, this.height});
  @override
  _ConstantDialogState createState() => _ConstantDialogState();
}

class _ConstantDialogState extends State<ConstantDialog> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          // border: Border.all(color: Colors.blue),
          borderRadius: BorderRadius.circular(10)),
      height: widget.height,
      width: MediaQuery.of(context).size.width * 1,
      child: widget.Child,
    );
  }
}
