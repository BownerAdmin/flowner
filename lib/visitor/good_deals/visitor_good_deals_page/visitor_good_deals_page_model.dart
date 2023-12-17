import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/visitor/good_deals/add_good_deal_dialog/add_good_deal_dialog_widget.dart';
import '/visitor/good_deals/empty_good_deal/empty_good_deal_widget.dart';
import '/visitor/good_deals/good_deal_dialog/good_deal_dialog_widget.dart';
import '/visitor/good_deals/good_deal_tile/good_deal_tile_widget.dart';
import 'visitor_good_deals_page_widget.dart' show VisitorGoodDealsPageWidget;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class VisitorGoodDealsPageModel
    extends FlutterFlowModel<VisitorGoodDealsPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
