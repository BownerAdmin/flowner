import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'guest_book_item_model.dart';
export 'guest_book_item_model.dart';

class GuestBookItemWidget extends StatefulWidget {
  const GuestBookItemWidget({
    Key? key,
    required this.item,
  }) : super(key: key);

  final GuestBookItemStruct? item;

  @override
  _GuestBookItemWidgetState createState() => _GuestBookItemWidgetState();
}

class _GuestBookItemWidgetState extends State<GuestBookItemWidget> {
  late GuestBookItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GuestBookItemModel());

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
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(12.0, 16.0, 12.0, 16.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  valueOrDefault<String>(
                    widget.item?.creator,
                    'N/A',
                  ),
                  style: FlutterFlowTheme.of(context).headlineMedium,
                ),
                Text(
                  dateTimeFormat('d/M/y', widget.item!.date!),
                  style: FlutterFlowTheme.of(context).labelSmall.override(
                        fontFamily: 'DejaVuSans',
                        fontWeight: FontWeight.w600,
                        useGoogleFonts: false,
                      ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
              child: Text(
                valueOrDefault<String>(
                  widget.item?.message,
                  'N/A',
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Handlee',
                      color: Colors.black,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
