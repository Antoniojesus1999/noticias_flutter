import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/newResponseModel.dart';

const _URL_NEWS = 'https://newsapi.org/v2';
const _API_KEY = '23a3bfa396ab4cdb9980f4824ccb5344';

class NewsService with ChangeNotifier {
  List<Article> headlines = [];

  NewsService() {
    getToHeadLines();
  }

  getToHeadLines() async {
    final url =
        Uri.parse('$_URL_NEWS/top-headlines?apiKey=$_API_KEY&country=ca');
    final resp = await http.get(url);

    final newResponse = NewsResponse.fromJson(resp.body);
    headlines.addAll(newResponse.articles);
    notifyListeners();
  }
}
