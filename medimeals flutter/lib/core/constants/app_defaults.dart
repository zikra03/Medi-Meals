import 'package:flutter/material.dart';

class AppDefaults {
  static const double radius = 15;
  static const double margin = 15;
  static const double padding = 15;

  /// Used For Border Radius
  static BorderRadius borderRadius = BorderRadius.circular(radius);

  /// Used For Bottom Sheet
  static BorderRadius bottomSheetRadius = const BorderRadius.only(
    topLeft: Radius.circular(radius),
    topRight: Radius.circular(radius),
  );

  /// Used For Top Sheet
  static BorderRadius topSheetRadius = const BorderRadius.only(
    bottomLeft: Radius.circular(radius),
    bottomRight: Radius.circular(radius),
  );

  /// Default Box Shadow used for containers
  static List<BoxShadow> boxShadow = [
    BoxShadow(
      blurRadius: 10,
      spreadRadius: 0,
      offset: const Offset(0, 2),
      color: Colors.black.withOpacity(0.05),
    ),
  ];

  static Duration duration = const Duration(milliseconds: 100);

  /// Custom decoration for visible box with grey color and black thick border
  static BoxDecoration visibleBoxDecoration = BoxDecoration(
    color: Colors.grey, // Grey color
    borderRadius: borderRadius,
    border: Border.all(
      color: Colors.black, // Black color for the border
      width: 2, // Thick border
    ),
  );
}
