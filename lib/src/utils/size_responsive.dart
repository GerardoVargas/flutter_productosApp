import 'package:flutter/material.dart';
import 'dart:math' as math;

class Responsive {
 late double _width, _height, _diagonal;

  //get para acceder a los valores
  double get width => _width;
  double get height => _height;
  double get diagonal => _diagonal;

  // funcion que retorna una instancia de responsive
  // hay que pasar el contexto (ancho o largo de lo que necesitemos)
  static Responsive of(BuildContext context) => Responsive(context);

  Responsive(BuildContext context) {
    // Con ayuda de mediaqueries obtenemos el size del dispositivo
    final Size size = MediaQuery.of(context).size;

    // Asignamos las medidas del dispositivo a las variables
    // anteriormente declaradas
    _width = size.width;
    _height = size.height;

    //para obtener la diagonal nos apoyamos del teorema de pitagoras
    _diagonal = math.sqrt(math.pow(_width,2) + math.pow(_height,2));
  }

  // para obtener medidas relativas segun el porcentaje asignado
  double wp(double percent) => _width * percent / 100;
  double hp(double percent) => _height * percent / 100;
  double dp(double percent) => _diagonal * percent / 100;
}