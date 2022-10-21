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
  String nombre  = "crema";
  var formaf = [
    'CREMA TOPICA',
    'CREMA VAGINAL',
    'JARABE',
    'TABLETA',
    'CAPSULA DURA',
    'SUSPENSION ORAL',  
    'GEL TOPICO',
    'TABLETA RECUBIERTA',
    'POLVO ESTERIL PARA RECONSTITUIR A SOLUCION INYECTABLE',
    'SOLUCION INYECTABLE',
  ];
  String forma = "TABLETA";
  final articuloProvider = ArticuloProvider();
  late Future<List<ArticuloModel>> articulos;
  late TextEditingController searchController;

  @override
  void initState() {
    articulos = articuloProvider.obtenerArticulos('');
    super.initState();
    
    searchController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Medicamentos vigentes INFOINVIMA-AEA",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontFamily: 'RobotoMono',
              fontSize: 25.0),
        ),
      ),
      body:        
          Container(
            child: FutureBuilder(  
              future: articulos,
              builder: ((context, snapshot) {
                List<Widget> lista = [];

                if (snapshot.hasData) {
                
                  lista.add(
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: TextField(
                            decoration: InputDecoration(
                              labelText: 'Busqueda por nombre',
                              labelStyle: TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.w600),
                              border: InputBorder.none,
                              fillColor: Colors.white60,
                              filled: true,
                            ),
                            textAlign: TextAlign.center,
                            onChanged: (name) {
                              print(name);
                              setState(() {
                                nombre = name;
                              });
                            }),
                    ),
                  );
                  lista.add(
                    Padding(padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                    child: DropdownButton(
                              items: formaf.map((String a) {
                                return DropdownMenuItem(
                                    value: a,
                                    child: Text(
                                      a,
                                      style: TextStyle(fontSize: 15),
                                    ));
                              }).toList(),
                              onChanged: (_value) => {
                                setState(() {
                                  forma = _value.toString();
                                  //articuloProvider.filtrarforma(forma);
                                })
                              },
                              hint: Text(
                                forma,
                                style: TextStyle(fontSize: 20),
                              ),
                            ))
                  );
                  lista.add(
                    Padding(
                      padding: const EdgeInsets.fromLTRB(50, 10, 50, 10),
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            articulos = articuloProvider.filtrarArticulos(nombre, forma);
                          });
                        },
                        child: const Text('Buscar'),
                      ),
                    ),
                  );
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
          ),
    
    );
  }
}
