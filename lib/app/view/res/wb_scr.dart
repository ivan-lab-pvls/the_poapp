import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WbScr extends StatefulWidget {
  final String url;
  final String title;

  const WbScr({
    Key? key,
    required this.title,
    required this.url,
  }) : super(key: key);

  @override
  State<WbScr> createState() => _WbScrState();
}

class _WbScrState extends State<WbScr> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(widget.title),
        backgroundColor: Theme.of(context).colorScheme.background,
        leading: BackButton(color: Theme.of(context).colorScheme.primary),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Expanded(
              child: WebView(
                initialUrl: widget.url,
                javascriptMode: JavascriptMode.unrestricted,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
