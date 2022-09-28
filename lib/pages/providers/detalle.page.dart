import 'dart:js_util';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../models/articulo.models.dart';

class DetallePage extends StatelessWidget {
  DetallePage({super.key, required this.articulo});
  ArticuloModel articulo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(
          textAlign: TextAlign.left,
          articulo.title,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontFamily: 'RobotoMono',
              fontSize: 16.0),
        )),
        body: Container(
          padding: EdgeInsets.all(20),
          decoration:
              BoxDecoration(border: Border.all(width: 2, color: Colors.white)),
          child: Column(
            children: [
              Text(
                articulo.title,
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 12.0, fontFamily: 'RobotoMono'),
              ),
              Image.network(articulo.urlToImage),
              Text("\n"),
              Text(
                articulo.content,
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 12.0, fontFamily: 'RobotoMono'),
              ),
              Divider(),
              Text("\n"),
              Text(
                articulo.author,
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: 12.0,
                    fontFamily: 'RobotoMono',
                    fontStyle: FontStyle.normal),
              ),
              Text("\n"),
              Text(
                articulo.publishedAt,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 12.0,
                  fontFamily: 'RobotoMono',
                ),
              ),
            ],
          ),
        ));
  }
}
