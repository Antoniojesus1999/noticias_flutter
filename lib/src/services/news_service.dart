import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:noticias_flutter/src/models/categroy_model.dart';
import '../models/newResponseModel.dart';

const _URL_NEWS = 'https://newsapi.org/v2';
const _API_KEY = '23a3bfa396ab4cdb9980f4824ccb5344';

class NewsService with ChangeNotifier {
  List<Article> headlines = [];
  List<Category> categories = [
    Category(FontAwesomeIcons.building, 'business'),
    Category(FontAwesomeIcons.tv, 'entertainment'),
    Category(FontAwesomeIcons.addressCard, 'general'),
    Category(FontAwesomeIcons.headSideVirus, 'healt'),
    Category(FontAwesomeIcons.vials, 'science'),
    Category(FontAwesomeIcons.volleyball, 'sports'),
    Category(FontAwesomeIcons.memory, 'technology'),
  ];

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
