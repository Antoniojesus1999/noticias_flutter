import 'package:flutter/material.dart';
import 'package:noticias_flutter/src/pages/tabs_page.dart';
import 'package:noticias_flutter/src/services/news_service.dart';
import 'package:noticias_flutter/src/theme/tema.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NewsService()),
      ],
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: miTema,
          debugShowCheckedModeBanner: false,
          home: const TabsPageScreen()),
    );
  }
}
