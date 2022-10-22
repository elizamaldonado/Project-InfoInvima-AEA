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
          articulo.producto,
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
                "Producto \n",
                style: TextStyle(
                    fontSize: 18.0,
                    fontFamily: 'RobotoMono',
                    fontWeight: FontWeight.bold),
              ),
              Text(
                articulo.producto,
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: 18.0,
                    fontFamily: 'RobotoMono',
                    fontWeight: FontWeight.bold),
              ),
              Text("\n"),
              Text(
                articulo.descripcion,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 12.0,
                  fontFamily: 'RobotoMono',
                ),
              ),
              Divider(),
              Text(
                "Empresa \n",
                style: TextStyle(
                    fontSize: 18.0,
                    fontFamily: 'RobotoMono',
                    fontWeight: FontWeight.bold),
              ),
              Text(
                articulo.empresa,
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 14.0, fontFamily: 'RobotoMono'),
              ),
              Divider(),
              Text(
                "Registro Sanitario \n",
                style: TextStyle(
                    fontSize: 18.0,
                    fontFamily: 'RobotoMono',
                    fontWeight: FontWeight.bold),
              ),
              Text(
                articulo.registrosanitario,
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: 15.0,
                    fontFamily: 'RobotoMono',
                    fontStyle: FontStyle.normal),
              ),
              Divider(),
              Text(
                "Fecha Expedición \n",
                style: TextStyle(
                    fontSize: 18.0,
                    fontFamily: 'RobotoMono',
                    fontWeight: FontWeight.bold),
              ),
              Text(
                articulo.fechaexp,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 15.0,
                  fontFamily: 'RobotoMono',
                ),
              ),
              Divider(),
              Text(
                "Fecha Vencimiento \n",
                style: TextStyle(
                    fontSize: 18.0,
                    fontFamily: 'RobotoMono',
                    fontWeight: FontWeight.bold),
              ),
              Text(
                articulo.fechavenc,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 15.0,
                  fontFamily: 'RobotoMono',
                ),
              ),
              Divider(),
              Text(
                "Estado Producto \n",
                style: TextStyle(
                    fontSize: 18.0,
                    fontFamily: 'RobotoMono',
                    fontWeight: FontWeight.bold),
              ),
              Text(
                articulo.estado,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 15.0,
                  fontFamily: 'RobotoMono',
                ),
              ),
              Divider(),
              Text(
                "Via Administración \n",
                style: TextStyle(
                    fontSize: 18.0,
                    fontFamily: 'RobotoMono',
                    fontWeight: FontWeight.bold),
              ),
              Text(
                articulo.viaadministracion,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 15.0,
                  fontFamily: 'RobotoMono',
                ),
              ),
              Divider(),
              Text(
                "Forma Producto \n",
                style: TextStyle(
                    fontSize: 18.0,
                    fontFamily: 'RobotoMono',
                    fontWeight: FontWeight.bold),
              ),
              Text(
                articulo.formaf,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 15.0,
                  fontFamily: 'RobotoMono',
                ),
              ),
            ],
          ),
        ));
  }
}
