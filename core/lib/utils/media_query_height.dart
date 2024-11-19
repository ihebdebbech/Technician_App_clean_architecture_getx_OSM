import 'package:flutter/cupertino.dart';

extension Height on BuildContext {
  double Heightmedia(coef) => MediaQuery.of(this).size.height * coef;
  double widthmedia(coef) => MediaQuery.of(this).size.width * coef;
  double getResponsiveFontSize(coef) {
    double size = (MediaQuery.of(this).size.width * coef) / 10;
    

    return size;
  }
}
