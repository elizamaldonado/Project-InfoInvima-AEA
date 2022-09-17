import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../models/articulo.models.dart';

class DetallePage extends StatelessWidget {
  DetallePage({super.key, required this.article});
  ArticuloModel article;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(article.title)),
        body: Container(
          child: Text(article.content),
        ));
  }
}
