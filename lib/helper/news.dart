import 'dart:convert';

import 'package:mausam/models/article_model.dart';
import 'package:http/http.dart' as http;

class News {
  List<ArticleModel> news = [];
  Future<void> getNews() async {
    String url =
        "https://newsapi.org/v2/top-headlines?country=in&apiKey=f95c7f1d84844a6bb4d75d32dbe2ff16";
    var response = await http.get(Uri.parse(url));
    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element["urlToImage"] != null &&
            element["url"] != null &&
            element["description"] != null &&
            element["title"] != null &&
            element["author"] != null &&
            element["content"] != null) {
          ArticleModel articleModel = ArticleModel(
            // title, author, description, url, urlToImage, publishedAt, content
            element["title"],
            element["author"],
            element["description"],
            element["url"],
            element["urlToImage"],
            element["content"],
          );
          news.add(articleModel);
        }
      });
    }
  }
}

class CategoryNewsClass {
  List<ArticleModel> news = [];
  Future<void> getNews(String category) async {
    String url =
        "https://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=f95c7f1d84844a6bb4d75d32dbe2ff16";
    var response = await http.get(Uri.parse(url));
    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element["urlToImage"] != null &&
            element["url"] != null &&
            element["description"] != null &&
            element["title"] != null &&
            element["author"] != null &&
            element["content"] != null) {
          ArticleModel articleModel = ArticleModel(
            // title, author, description, url, urlToImage, publishedAt, content
            element["title"],
            element["author"],
            element["description"],
            element["url"],
            element["urlToImage"],
            element["content"],
          );
          news.add(articleModel);
        }
      });
    }
  }
}
