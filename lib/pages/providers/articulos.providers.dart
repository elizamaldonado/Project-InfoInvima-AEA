import 'dart:collection';
import 'dart:convert';
import 'dart:html';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:newnoticias/models/articulo.models.dart';

class ArticuloProvider {
  Future<List<ArticuloModel>> obtenerArticulos(String q) async {
    List<ArticuloModel> articulos = [];
    var client = http.Client();
    try {
      Map<String, String> parametros = {
        'q': q,
        'from': '2022-09-26',
        'sortBy': 'popularity',
        'apiKey': '3245b9a7594d47e7ba7746344d47fbb4',
      };
      var response = await client
          .get(Uri.https('newsapi.org', '/v2/everything', parametros));

      var decodedResponse =
          jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>;

      decodedResponse['articles']
          .forEach((item) => articulos.add(ArticuloModel.fromJson(item)));
      //print(response.body);
      return articulos;
    } finally {
      client.close();
    }
  }
}
