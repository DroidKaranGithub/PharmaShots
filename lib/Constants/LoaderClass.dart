import 'dart:async';
import 'package:flutter/material.dart';

class Loader {
  static OverlayEntry overlayLoader(context) {
    OverlayEntry loader = OverlayEntry(builder: (context) {
      return Center(
        child: Material(
          color: Theme.of(context).primaryColor.withOpacity(0),
          child: Center(
              child: Container(
                  child: Center(
                      child:Image.asset('assets/images/pharmashots_loader.gif',
                        height: 120,
                        width: 120,)
          //             CircularProgressIndicator(
          //   backgroundColor: Colors.greenAccent,
          // )

                  ))),
        ),
      );
    });
    return loader;
  }

  static hideLoader(OverlayEntry loader) {
    Timer(Duration(seconds: 2), () {
      try {
        loader.remove();
      } catch (e) {}
    });
  }
}
