import 'package:flutter/material.dart';

class ResponsiveService {
  static double _baseHeight = 812.0;

  static double scaleHeight(BuildContext context, double size) {
    return size * MediaQuery.of(context).size.height / _baseHeight;
  }

  static double scaleWidth(BuildContext context, double size) {
    return size * MediaQuery.of(context).size.width / _baseHeight;
  }
}