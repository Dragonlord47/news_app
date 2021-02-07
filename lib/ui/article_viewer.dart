import 'dart:io';

import 'package:flutter/material.dart';
import 'package:news/models/article.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleViewer extends StatefulWidget {
  final Article article;
  ArticleViewer({this.article});
  @override
  _ArticleViewerState createState() => _ArticleViewerState();
}

class _ArticleViewerState extends State<ArticleViewer> {
  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.article.title),
      ),
      body: WebView(
        initialUrl: widget.article.url,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
