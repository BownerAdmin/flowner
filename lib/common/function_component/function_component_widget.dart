import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'function_component_model.dart';
export 'function_component_model.dart';

class FunctionComponentWidget extends StatefulWidget {
  const FunctionComponentWidget({
    Key? key,
    required this.function,
  }) : super(key: key);

  final FunctionStruct? function;

  @override
  _FunctionComponentWidgetState createState() =>
      _FunctionComponentWidgetState();
}

class _FunctionComponentWidgetState extends State<FunctionComponentWidget> {
  late FunctionComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FunctionComponentModel());

    _model.expandableController = ExpandableController(initialExpanded: false);
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

    return Container(
      color: FlutterFlowTheme.of(context).primaryBackground,
      child: ExpandableNotifier(
        controller: _model.expandableController,
        child: ExpandablePanel(
          header: Text(
            valueOrDefault<String>(
              widget.function?.name,
              'N/A',
            ),
            style: FlutterFlowTheme.of(context).labelLarge,
          ),
          collapsed: Container(),
          expanded: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                valueOrDefault<String>(
                  widget.function?.explanations,
                  'N/A',
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Readex Pro',
                      color: Color(0x8A000000),
                    ),
              ),
            ],
          ),
          theme: ExpandableThemeData(
            tapHeaderToExpand: true,
            tapBodyToExpand: false,
            tapBodyToCollapse: false,
            headerAlignment: ExpandablePanelHeaderAlignment.center,
            hasIcon: true,
          ),
        ),
      ),
    );
  }
}
