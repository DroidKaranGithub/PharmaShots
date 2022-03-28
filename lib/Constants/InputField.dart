import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Constant.dart';

class InputField extends StatelessWidget {
  final String? hint;
  final String? lable;
  double? width;
  TextAlign? align;
  double? height;
  int? maxLines;
  bool? IsBorder;
  dynamic validator;
  dynamic keyboardType;
  dynamic onChanged;
  dynamic maxLength;
  Widget? prefix;
  bool? IsRadius;
  double? Radius;
  TextStyle? style;
  bool? IsStyle;
  bool? IsEnable;
  String? initialValue;
  Color? fillColor;
  TextEditingController? controller;
  InputField(
      {this.initialValue,
      this.controller,
      this.fillColor,
      this.IsEnable,
      this.height,
      this.align,
      this.maxLines,
      this.lable,
      this.Radius,
      this.IsRadius,
      this.hint,
      this.width,
      this.IsBorder,
      this.validator,
      this.keyboardType,
      this.onChanged,
      this.maxLength,
      this.prefix,
      this.style,
      this.IsStyle});
  // OutlineInputBorder Border=OutlineInputBorder(
  //     borderRadius: IsRadius==true?BorderRadius.circular(10):BorderRadius.circular(30),
  //     borderSide: BorderSide(
  //         color:color
  //     )
  // );
  @override
  Widget build(BuildContext context) {
    var color;
    return Container(
      // height: height??60,
      width: width == null ? double.maxFinite : width,
      margin: EdgeInsets.symmetric(vertical: 5),
      padding: EdgeInsets.symmetric(
        horizontal: 5,
      ), //vertical 3

      child: Center(
        child: TextFormField(
          initialValue: initialValue,
          controller: controller,
          enabled: IsEnable ?? true,
          onChanged: onChanged,
          validator: validator,
          keyboardType: keyboardType,
          maxLength: maxLength,
          maxLines: maxLines,
          textAlign: align ?? TextAlign.start,
          decoration: InputDecoration(
              labelText: lable,
              fillColor: fillColor ?? color,
              filled: true,
              // prefix: ,
              prefixIcon: prefix,
              enabled: true,
              disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: color)),
              contentPadding: EdgeInsets.all(20),
              border: IsBorder == true
                  ? OutlineInputBorder(
                      borderRadius: IsRadius == true
                          ? BorderRadius.circular(10)
                          : BorderRadius.circular(30),
                      borderSide: BorderSide(color: color))
                  : InputBorder.none,
              errorBorder: IsBorder == true
                  ? OutlineInputBorder(
                      borderRadius: IsRadius == true
                          ? BorderRadius.circular(10)
                          : BorderRadius.circular(30),
                      borderSide: BorderSide(color: color))
                  : InputBorder.none,
              enabledBorder: IsBorder == true
                  ? OutlineInputBorder(
                      borderRadius: IsRadius == true
                          ? BorderRadius.circular(10)
                          : BorderRadius.circular(30),
                      borderSide: BorderSide(color: color))
                  : InputBorder.none,
              focusedBorder: IsBorder == true
                  ? OutlineInputBorder(
                      borderRadius: IsRadius == true
                          ? BorderRadius.circular(10)
                          : BorderRadius.circular(30),
                      borderSide: BorderSide(color: color))
                  : InputBorder.none,
              counterText: "",
              hintText: hint!,
              hintStyle: IsStyle == true
                  ? style
                  : Theme.of(context).textTheme.headline2!),
        ),
      ),
    );
  }
}
