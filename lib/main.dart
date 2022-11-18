import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(
    const MaterialApp(
      home: WebViewApp(),
      title: 'RDM Exchange',
    ),
  );
}

class WebViewApp extends StatefulWidget {
  const WebViewApp({super.key});

  @override
  State<WebViewApp> createState() => _WebViewAppState();
}

class _WebViewAppState extends State<WebViewApp> {
 WebViewController? controller;
 final String homeURL = 'https://ico.rdmexchange.com';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter WebView'),
      ),
      body: WebView(
        initialUrl: homeURL,
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController) {
            controller = webViewController;
        },        
      ),
      floatingActionButton:  FloatingActionButton(
        onPressed : () => setState(() {
          controller!.loadUrl(homeURL);
        }),
        child: const Icon(Icons.home),
      )
    );
  }
}