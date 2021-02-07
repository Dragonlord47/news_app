import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/article.dart';

class RequestOperation {
  String apiUrl = "http://newsapi.org/v2";
  String apiKey = "042f7f746dea4be0bbec429fa5890413";

  Future<List<Article>> getBitcoinArticles() async {
    String route = apiUrl +
        "/everything?q=bitcoin&from=2020-09-10&sortBy=publishedAt&apiKey=$apiKey";

    final headers = {
      'Content-Type': 'Application/json',
      'Accept': 'Application/json'
    };

    http.Response response =
        await http.get(Uri.encodeFull(route), headers: headers);
    int statusCode = response.statusCode;
    if (statusCode == 200) {
      print(response.body);
      Map data = json.decode(response.body);
      String status = data['status'];
      if (status == 'ok') {
        List articles = data['articles'];
        return articles.map((item) => Article.fromJson(item)).toList();

      //   List<Article> articleList = new List<Article>();
      //   for (Map item in articles) {
      //     Article article = Article.fromJson(item);
      //     articleList.add(article);
      //   }
      //   return articleList;
      }
    }

    return null;
  }
}
