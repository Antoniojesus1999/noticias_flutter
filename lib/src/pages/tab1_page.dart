import 'package:flutter/material.dart';
import 'package:noticias_flutter/src/services/news_service.dart';
import 'package:noticias_flutter/src/whidgets/lista_noticias.dart';
import 'package:provider/provider.dart';

class Tab1Page extends StatefulWidget {
  const Tab1Page({super.key});

  @override
  State<Tab1Page> createState() => _Tab1PageState();
}

class _Tab1PageState extends State<Tab1Page>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    final headlines = Provider.of<NewsService>(context).headlines;
    final newsService = Provider.of<NewsService>(context);
    return Scaffold(
      body: (headlines.isEmpty)
          ? const Center(child: CircularProgressIndicator())
          : ListaNoticias(newsService.headlines),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
