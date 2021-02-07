import 'package:flutter/material.dart';
import 'package:news/models/article.dart';
import 'package:news/template/news_article_template.dart';
import '../operations/request_operations.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Article> articles = new List<Article>();
  @override
  void initState() {
    super.initState();
    RequestOperation request = new RequestOperation();
    request.getBitcoinArticles().then((articleList) {
      setState(() {
        articles = articleList;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('News App'),
        ),
        body: articles != null && articles.length > 0
            ? ListView(
                children: articles
                    .map((article) => NewsArticleTemplate(article: article))
                    .toList(),
              )
            : Container(
                alignment: Alignment.center,
                child: Text('please wait, loading articles...'),
              ));
  }
}
