import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'planning_list_item_model.dart';
export 'planning_list_item_model.dart';

class PlanningListItemWidget extends StatefulWidget {
  const PlanningListItemWidget({
    Key? key,
    this.name,
    this.nbGuests,
    this.isFriend,
    required this.fromDate,
    required this.toDate,
  }) : super(key: key);

  final String? name;
  final int? nbGuests;
  final bool? isFriend;
  final String? fromDate;
  final String? toDate;

  @override
  _PlanningListItemWidgetState createState() => _PlanningListItemWidgetState();
}

class _PlanningListItemWidgetState extends State<PlanningListItemWidget> {
  late PlanningListItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PlanningListItemModel());

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
      color: widget.isFriend! ? Color(0xFFBBDEFB) : Color(0xFFFFCDD2),
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(12.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: Text(
                widget.name!,
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Readex Pro',
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ),
            if (widget.isFriend ?? true)
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 28.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.family_restroom,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      size: 18.0,
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                      child: Text(
                        valueOrDefault<String>(
                          widget.nbGuests?.toString(),
                          '0',
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium,
                      ),
                    ),
                  ],
                ),
              ),
            Text(
              '${widget.fromDate} au ${widget.toDate}',
              style: FlutterFlowTheme.of(context).labelSmall,
            ),
          ],
        ),
      ),
    );
  }
}
