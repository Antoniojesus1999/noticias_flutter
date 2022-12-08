import 'package:flutter/material.dart';
import 'package:noticias_flutter/src/services/news_service.dart';
import 'package:noticias_flutter/src/whidgets/lista_noticias.dart';
import 'package:provider/provider.dart';

class Tab1Page extends StatelessWidget {
  Tab1Page({super.key});

  @override
  Widget build(BuildContext context) {
    final newsService = Provider.of<NewsService>(context);
    return Scaffold(
      body: ListaNoticias(newsService.headlines),
    );
  }
}
