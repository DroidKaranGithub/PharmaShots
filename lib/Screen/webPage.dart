import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pharmashots/Constants/color_resource.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../routs.dart';

class PostWebView extends StatelessWidget {
  final String? title;
  final String? selectedUrl;

  final Completer<WebViewController> _controller = Completer<WebViewController>();

  PostWebView({
    @required this.title,
    @required this.selectedUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 1,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: ColorResources.Black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: [
            // IconButton(
            //   icon: Icon(
            //     Icons.settings,
            //     color: ColorResources.Black,
            //   ),
            //   onPressed: () {},
            // ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: InkWell(
                  onTap: (){ Navigator.pop(context);},
                  child:Image(image: AssetImage('assets/images/Path 707@2x.png',
                  ),height: 13,
                    width: 13,)),
            )
          ],
        ),
        body: WebView(
          initialUrl: selectedUrl,
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            _controller.complete(webViewController);
          },
        ));
  }
}