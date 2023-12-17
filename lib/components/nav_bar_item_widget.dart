import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'nav_bar_item_model.dart';
export 'nav_bar_item_model.dart';

class NavBarItemWidget extends StatefulWidget {
  const NavBarItemWidget({
    Key? key,
    required this.title,
    required this.icon,
    bool? isCurrent,
  })  : this.isCurrent = isCurrent ?? false,
        super(key: key);

  final String? title;
  final Widget? icon;
  final bool isCurrent;

  @override
  _NavBarItemWidgetState createState() => _NavBarItemWidgetState();
}

class _NavBarItemWidgetState extends State<NavBarItemWidget> {
  late NavBarItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NavBarItemModel());

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
      width: double.infinity,
      height: 50.0,
      decoration: BoxDecoration(
        color: widget.isCurrent
            ? Color(0xFF0B3472)
            : FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Container(
              width: 5.0,
              height: 35.0,
              decoration: BoxDecoration(
                color: widget.isCurrent
                    ? FlutterFlowTheme.of(context).primaryBackground
                    : Color(0xFF0B3472),
                borderRadius: BorderRadius.circular(2.0),
              ),
            ),
          ),
          widget.icon!,
          Text(
            widget.title!,
            style: FlutterFlowTheme.of(context).titleMedium.override(
                  fontFamily: 'Readex Pro',
                  color: FlutterFlowTheme.of(context).primaryBackground,
                  fontSize: 15.0,
                  fontWeight: FontWeight.w500,
                ),
          ),
        ].divide(SizedBox(width: 12.0)).around(SizedBox(width: 12.0)),
      ),
    );
  }
}
