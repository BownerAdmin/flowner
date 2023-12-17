// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<DateTimeRange?> showDateRangePickerAction(BuildContext context) async {
  // Add your function code here!

  return showDateRangePicker(
      context: context,
      firstDate: DateTime.now().subtract(const Duration(days: 100)),
      lastDate: DateTime.now().add(const Duration(days: 100)),
      locale: Locale('fr'),
      helpText: "Ajouter une période d'occupation",
      builder: (context, child) {
        return Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 100.0, 0.0, 0.0),
            child: Column(
              children: [
                ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 400.0, maxHeight: 600),
                  child: child,
                )
              ],
            ));
      },
      initialEntryMode: DatePickerEntryMode.calendarOnly);
}
