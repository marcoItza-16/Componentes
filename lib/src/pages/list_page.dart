import 'dart:async';

import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  ScrollController _scroll = new ScrollController();
  List<int> _listaNum = [];
  int _ultimo = 0;
  bool cargando = false;

  @override
  void initState() {
    super.initState();
    _agregar10();
    _scroll.addListener(() {
      if (_scroll.position.pixels == _scroll.position.maxScrollExtent) {
        _agregar10();
        fetchData();
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scroll.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Listas"),
        ),
        body: Stack(
          children: <Widget>[
            _crearLista(),
            _crearCargando(),
          ],
        ));
  }

  Future fetchData() async {
    cargando = true;
    setState(() {});
    final duracion = new Duration(seconds: 2);
    new Timer(duracion, respuestaHTTP);
  }

  void respuestaHTTP() {
    cargando = false;
    _scroll.animateTo(_scroll.position.pixels + 100,
        curve: Curves.fastOutSlowIn, duration: Duration(milliseconds: 250));
    _agregar10();
  }

  Widget _crearLista() {
    return RefreshIndicator(
      onRefresh: obtenerPagina1,
      child: ListView.builder(
        controller: _scroll,
        itemBuilder: (BuildContext context, int index) {
          final imagen = _listaNum[index];
          return FadeInImage(
              placeholder: AssetImage('assets/cargando.gif'),
              image:
                  NetworkImage('https://picsum.photos/500/300?image=$imagen'));
        },
        itemCount: _listaNum.length,
      ),
    );
  }

  Future<Null> obtenerPagina1() async {
    final duracion = new Duration(seconds: 2);
    new Timer(duracion, () {
      _listaNum.clear();
      _ultimo++;
      _agregar10();
    });
    return Future.delayed(duracion);
  }

  void _agregar10() {
    for (var i = 1; i < 10; i++) {
      _ultimo++;
      _listaNum.add(_ultimo);
    }
    setState(() {});
  }

  Widget _crearCargando() {
    if (cargando) {
      return Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[CircularProgressIndicator()],
            ),
            SizedBox(height: 15.0),
          ]);
    } else {
      return Container();
    }
  }
}
