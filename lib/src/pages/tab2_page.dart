import 'package:flutter/material.dart';
import 'package:noticias_flutter/src/models/categroy_model.dart';
import 'package:provider/provider.dart';

import '../services/news_service.dart';

class Tab2Page extends StatelessWidget {
  const Tab2Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: const [
          Expanded(
            child: _ListaCategorias(),
          )
        ],
      ),
    ));
  }
}

class _ListaCategorias extends StatelessWidget {
  const _ListaCategorias({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categories = Provider.of<NewsService>(context).categories;
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemCount: categories.length,
      itemBuilder: (context, index) {
        final cName = categories[index].name;
        return Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              _CategoryButton(
                categories[index],
              ),
              const SizedBox(
                height: 5,
              ),
              Text('${cName[0].toUpperCase() + cName.substring(1)}')
            ],
          ),
        );
      },
    );
  }
}

class _CategoryButton extends StatelessWidget {
  final Category categoria;
  const _CategoryButton(
    this.categoria,
  );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('${categoria.name}');
      },
      child: Container(
        width: 40,
        height: 40,
        margin: EdgeInsets.symmetric(horizontal: 10),
        decoration:
            const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
        child: Icon(categoria.icon, color: Colors.black54),
      ),
    );
  }
}
