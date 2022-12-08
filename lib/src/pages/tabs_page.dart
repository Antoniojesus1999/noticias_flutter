import 'package:flutter/material.dart';
import 'package:noticias_flutter/src/pages/tab1_page.dart';
import 'package:provider/provider.dart';

class TabsPageScreen extends StatelessWidget {
  const TabsPageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => _NavegacionModel(),
        child: const Scaffold(
          body: Paginas(),
          bottomNavigationBar: _Navegacion(),
        ));
  }
}

class _Navegacion extends StatelessWidget {
  const _Navegacion({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navegacionModel = Provider.of<_NavegacionModel>(context);

    return BottomNavigationBar(
      currentIndex: navegacionModel._paginaActual,
      onTap: (i) => navegacionModel.paginaActual = i,
      items: const [
        BottomNavigationBarItem(
            icon: Icon(Icons.person_outline), label: 'Para Ti'),
        BottomNavigationBarItem(icon: Icon(Icons.public), label: 'Encabezados'),
      ],
    );
  }
}

class Paginas extends StatelessWidget {
  const Paginas({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navegacionModel = Provider.of<_NavegacionModel>(context);
    return PageView(
      controller: navegacionModel._pageController,
      //Comportamiento de la pagina al mover hacia los lados para que cambie a encabezados o parati
      //physics: BouncingScrollPhysics(),
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Tab1Page(),
        Container(
          color: Colors.blue,
        )
      ],
    );
  }
}

class _NavegacionModel extends ChangeNotifier {
  int _paginaActual = 0;
  final PageController _pageController = PageController();

  int get patinaActual => _paginaActual;

  set paginaActual(int valor) {
    _paginaActual = valor;
    _pageController.animateToPage(valor,
        duration: const Duration(milliseconds: 200), curve: Curves.easeOut);
    notifyListeners();
  }
}
