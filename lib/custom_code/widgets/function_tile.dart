// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import '/common/tile_component/tile_component_widget.dart';

class FunctionTile extends StatefulWidget {
  const FunctionTile({Key? key, this.width, this.height, required this.title})
      : super(key: key);

  final double? width;
  final double? height;
  final String title;

  @override
  _FunctionTileState createState() => _FunctionTileState();
}

class _FunctionTileState extends State<FunctionTile> {
  Widget _getIcon() {
    switch (widget.title) {
      case 'Chauffe-eau':
        return Icon(Icons.whatshot);
      case 'Piscine':
        return Icon(Icons.pool);
      case "Couper l'eau":
        return Icon(Icons.water_drop);
      case "Sèche-linge":
        return Icon(Icons.dry_cleaning);
      case "Wi-Fi":
        return Icon(Icons.wifi);
      case "Chauffage":
        return Icon(Icons.fireplace);
      case "Lave-linge":
        return Icon(Icons.local_laundry_service_outlined);
      case "Jacuzzi":
        return Icon(Icons.hot_tub_outlined);
      case "Climatisation":
        return Icon(Icons.ac_unit_outlined);
      case "Parking":
        return Icon(Icons.local_parking_outlined);
      case "Poubelles verres":
        return Icon(Icons.liquor_outlined);
      case "Poubelles":
        return Icon(Icons.delete_outline_outlined);
      case "Tableau électrique":
        return Icon(Icons.electric_bolt_outlined);
      case "Numéros utiles":
        return Icon(Icons.phone);
      default:
        return Icon(Icons.handyman_outlined);
    }
  }

  @override
  Widget build(BuildContext context) {
    return TileComponentWidget(
        text: widget.title,
        icon: _getIcon(),
        width: widget.width?.toInt(),
        height: widget.height?.toInt());
  }
}
