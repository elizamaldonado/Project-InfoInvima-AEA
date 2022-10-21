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
      var response = await client.get(Uri.https('datos.gov.co', '/resource/i7cb-raxc.json'));
      print("termino la peticion");
      //print(response.body);
      var decodedResponse =
          jsonDecode(utf8.decode(response.bodyBytes)) as List<dynamic>;
      decodedResponse
          .forEach((item) => articulos.add(ArticuloModel.fromJson(item)));
      return articulos;
    } finally {
      client.close();
    }
  }
  Future<List<ArticuloModel>> filtrarArticulos(String nombre, String forma) async {
    List<ArticuloModel> articulos = [];
    var client = http.Client();
    try {
      var url ='https://datos.gov.co/';
      var query = r'$query';
      //and (upper(`formafarmaceutica`) = upper('$forma'))
      var endpoint = "api/id/i7cb-raxc.json?$query=select *, :id where (contains(upper(`producto`), upper('$nombre')) and (upper(`formafarmaceutica`) = upper('$forma')) )";
      var uri = Uri.parse(url + endpoint);
      var response = await http.get(uri);
      print("aqui el response");
      print(response.statusCode);
      
      var decodedResponse =
          jsonDecode(utf8.decode(response.bodyBytes)) as List<dynamic>;
      
      decodedResponse
          .forEach((item) => articulos.add(ArticuloModel.fromJson(item)));
      return articulos;
    } finally {
      client.close();
    }
  }
  Future<List<ArticuloModel>> filtrarforma(String forma) async {
    List<ArticuloModel> articulos = [];
    var client = http.Client();
    try {
      var url ='https://datos.gov.co/';
      var query = r'$query';
      var endpoint = "api/id/i7cb-raxc.json?formafarmaceutica='$forma'";
      var uri = Uri.parse(url + endpoint);
      var response = await http.get(uri);
      print("aqui el response");
      print(response.statusCode);
      
      var decodedResponse =
          jsonDecode(utf8.decode(response.bodyBytes)) as List<dynamic>;
      
      decodedResponse
          .forEach((item) => articulos.add(ArticuloModel.fromJson(item)));
      return articulos;
    } finally {
      client.close();
    }
  }
}
//https://www.datos.gov.co/resource/i7cb-raxc.json?formafarmaceutica=AEROSOLES