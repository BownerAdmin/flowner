import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/nav_bar_item_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'nav_bar_widget.dart' show NavBarWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NavBarModel extends FlutterFlowModel<NavBarWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for NavBarItem component.
  late NavBarItemModel navBarItemModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    navBarItemModel = createModel(context, () => NavBarItemModel());
  }

  void dispose() {
    navBarItemModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
