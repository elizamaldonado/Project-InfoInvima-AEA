import 'package:flutter/material.dart';
import 'package:http/http.dart';
import '../../models/articulo.models.dart';
import '../../widgets/card.widget.dart';
import 'articulos.providers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final articuloProvider = ArticuloProvider();
  late Future<List<ArticuloModel>> articulos;
  late TextEditingController searchController;

  @override
  void initState() {
    articulos = articuloProvider.obtenerArticulos('apple');
    super.initState();
    searchController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Medicamentos aprobados por INVIMA",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontFamily: 'RobotoMono',
              fontSize: 14.0),
        ),
      ),
      body: FutureBuilder(
        future: articulos,
        builder: ((context, snapshot) {
          List<Widget> lista = [];

          if (snapshot.hasData) {
            lista.add(
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                /*child: TextField(
                  controller: searchController,
                  decoration: InputDecoration(
                    labelText: 'Ingrese la noticia a buscar',
                    labelStyle: TextStyle(
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      fontSize: 12.0,
                    ),
                  ),
                ),*/
              ),
            );
            /*
            lista.add(
              Padding(
                padding: const EdgeInsets.fromLTRB(50, 10, 50, 10),
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      articulos = articuloProvider
                          .obtenerArticulos(searchController.text);
                    });
                  },
                  child: const Text('Buscar'),
                ),
              ),
            );
            */
            snapshot.data?.forEach((element) => lista.add(CardWidget(
                  articulo: element,
                )));
            return Container(
              child: ListView(
                children: lista,
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        }),
      ),
    );
  }
}
