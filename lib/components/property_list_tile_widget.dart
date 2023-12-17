import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'property_list_tile_model.dart';
export 'property_list_tile_model.dart';

class PropertyListTileWidget extends StatefulWidget {
  const PropertyListTileWidget({
    Key? key,
    required this.isSet,
    required this.name,
    required this.propertyRef,
  }) : super(key: key);

  final bool? isSet;
  final String? name;
  final DocumentReference? propertyRef;

  @override
  _PropertyListTileWidgetState createState() => _PropertyListTileWidgetState();
}

class _PropertyListTileWidgetState extends State<PropertyListTileWidget> {
  late PropertyListTileModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PropertyListTileModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      color: FlutterFlowTheme.of(context).primaryBackground,
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: ListTile(
        title: Text(
          valueOrDefault<String>(
            widget.name,
            '[ Nouveau bien ]',
          ),
          style: FlutterFlowTheme.of(context).titleLarge,
        ),
        subtitle: Text(
          widget.isSet! ? 'En ligne' : 'À compléter',
          style: FlutterFlowTheme.of(context).labelMedium.override(
                fontFamily: 'Readex Pro',
                color: widget.isSet!
                    ? FlutterFlowTheme.of(context).success
                    : FlutterFlowTheme.of(context).tertiary,
              ),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          color: FlutterFlowTheme.of(context).secondaryText,
          size: 20.0,
        ),
        dense: false,
        contentPadding: EdgeInsets.all(12.0),
      ),
    );
  }
}
