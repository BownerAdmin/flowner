import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'function_details_dialog_model.dart';
export 'function_details_dialog_model.dart';

class FunctionDetailsDialogWidget extends StatefulWidget {
  const FunctionDetailsDialogWidget({
    Key? key,
    required this.function,
  }) : super(key: key);

  final FunctionStruct? function;

  @override
  _FunctionDetailsDialogWidgetState createState() =>
      _FunctionDetailsDialogWidgetState();
}

class _FunctionDetailsDialogWidgetState
    extends State<FunctionDetailsDialogWidget> {
  late FunctionDetailsDialogModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FunctionDetailsDialogModel());

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

    return Padding(
      padding: EdgeInsets.all(12.0),
      child: Container(
        width: 500.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primaryBackground,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: AlignmentDirectional(-1.0, -1.0),
                child: FlutterFlowIconButton(
                  borderRadius: 20.0,
                  borderWidth: 1.0,
                  buttonSize: 40.0,
                  fillColor: Color(0xFFC9C9C9),
                  icon: Icon(
                    Icons.close,
                    color: FlutterFlowTheme.of(context).primaryText,
                    size: 24.0,
                  ),
                  onPressed: () async {
                    Navigator.pop(context);
                  },
                ),
              ),
              Text(
                valueOrDefault<String>(
                  widget.function?.name,
                  'N/A',
                ),
                style: FlutterFlowTheme.of(context).labelLarge,
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                child: Text(
                  valueOrDefault<String>(
                    widget.function?.explanations,
                    'N/A',
                  ),
                  style: FlutterFlowTheme.of(context).bodyLarge,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
