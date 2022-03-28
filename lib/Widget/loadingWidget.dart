

import 'package:flutter/material.dart';

  Widget displayloading(BuildContext context) {
    return  Container(
      height: MediaQuery.of(context).size.height * 1,
      width: MediaQuery.of(context).size.width * 1,
      child: Stack(
        //mainAxisAlignment: MainAxisAlignment.end,
        children: [ Center(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.4,
              ),
              Padding(padding: EdgeInsets.all(12),child: Center(
                child: Image.asset('assets/images/pharmashots_loader.gif',
                  height: 120,
                  width: 120,),
              )),
            ],
          ),
        )
        ],
      ),
    );
  }


