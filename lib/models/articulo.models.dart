import 'package:flutter/material.dart';

class ArticuloModel {
  String producto;
  String empresa;
  String registrosanitario;
  String fechaexp;
  String fechavenc;
  String estado;
  String descripcion;
  String viaadministracion;
  String formaf;

  ArticuloModel({
    required this.producto,
    required this.empresa,
    required this.registrosanitario,
    required this.fechaexp,
    required this.fechavenc,
    required this.estado,
    required this.descripcion,
    required this.viaadministracion,
    required this.formaf,
  });
  factory ArticuloModel.fromJson(Map<String, dynamic> json) => ArticuloModel(
        producto: json["producto"] ?? '',
        empresa: json["titular"] ?? '',
        registrosanitario: json["registrosanitario"] ?? '',
        fechaexp: json["fechaexpedicion"] ?? '',
        fechavenc: json["fechavencimiento"] ?? '',
        estado: json["estadoregistro"] ?? '',
        descripcion: json["descripcionatc"] ?? '',
        viaadministracion: json["viaadministracion"] ?? '',
        formaf: json["formafarmaceutica"] ?? '',
      );
}
