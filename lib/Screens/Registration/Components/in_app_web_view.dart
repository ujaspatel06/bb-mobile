import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class InAppWebViewScreen extends StatefulWidget {
  const InAppWebViewScreen({Key? key}) : super(key: key);

  @override
  State<InAppWebViewScreen> createState() => _InAppWebViewScreenState();
}

class _InAppWebViewScreenState extends State<InAppWebViewScreen> {
  final GlobalKey webViewKey = GlobalKey();

  InAppWebViewController? webViewController;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final controller = webViewController;
        if (controller != null) {
          if (await controller.canGoBack()) {
            controller.goBack();
            return false;
          }
        }
        return true;
      },
      child: Scaffold(
          body: SafeArea(
        child: Column(children: <Widget>[
          Expanded(
            child: InAppWebView(
              key: webViewKey,
              initialUrlRequest: URLRequest(
                  url: Uri.parse(
                      "https://www.budgetbuddie.com/terms-conditions")),
              onWebViewCreated: (controller) {
                webViewController = controller;
              },
            ),
          ),
        ]),
      )),
    );
  }
}
