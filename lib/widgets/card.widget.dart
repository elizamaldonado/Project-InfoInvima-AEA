import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newnoticias/models/articulo.models.dart';
import 'package:newnoticias/pages/providers/detalle.page.dart';
import 'package:flutter/animation.dart';

class CardWidget extends StatelessWidget {
  CardWidget({super.key, required this.articulo});

  ArticuloModel articulo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (description) => DetallePage(
                        articulo: articulo,
                      )));
        },
        child: Row(children: <Widget>[
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    articulo.producto,
                    style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    articulo.empresa,
                    style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Text(
                    articulo.registrosanitario,
                    style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Divider(),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
