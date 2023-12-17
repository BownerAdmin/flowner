import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/visitor/guest_book/add_guest_book_item_bottom_sheet/add_guest_book_item_bottom_sheet_widget.dart';
import '/visitor/guest_book/guest_book_item/guest_book_item_widget.dart';
import 'visitor_guest_book_page_widget.dart' show VisitorGuestBookPageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class VisitorGuestBookPageModel
    extends FlutterFlowModel<VisitorGuestBookPageWidget> {
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
