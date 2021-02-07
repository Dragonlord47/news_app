import 'package:flutter/material.dart';
import '../ui/article_viewer.dart';
import '../models/article.dart';

class NewsArticleTemplate extends StatelessWidget {
  final Article article;
  NewsArticleTemplate({this.article});

  @override
  Widget build(BuildContext context) {
    var dimension = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ArticleViewer(
                      article: article,
                    )));
      },
      child: Card(
        elevation: 7,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Container(
          height: dimension.height * 0.4,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                child: Image.network(
                  article.urlToImage,
                  height: dimension.height * 0.2,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Text(article.title),
                    Text(article.description),
                    
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
