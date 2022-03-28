import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pharmashots/Screen/search_screen.dart';
import 'package:pharmashots/Screen/search_screen_2.dart';

class FlotingAction extends StatelessWidget {
  const FlotingAction({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: MediaQuery.of(context).viewInsets.bottom == 0.0,
      child: FloatingActionButton(
        onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=> SearchScreen()));
        },
        child: Image.asset('assets/images/pharmashort_icon.png'),
        //Icon(Icons.home,color: Colors.white),
        backgroundColor: Colors.white,
        elevation: 0.1,
      ),
    );
  }
}
