import '/backend/backend.dart';
import '/common/tile_component/tile_component_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/visitor/check_list/visitor_check_list_dialog/visitor_check_list_dialog_widget.dart';
import '/visitor/planning/visitor_planning_dialog/visitor_planning_dialog_widget.dart';
import '/visitor/profile/pofile_dialog/pofile_dialog_widget.dart';
import '/visitor/welcome_message/view_welcome_message/view_welcome_message_widget.dart';
import 'property_page_widget.dart' show PropertyPageWidget;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PropertyPageModel extends FlutterFlowModel<PropertyPageWidget> {
  ///  Local state fields for this page.

  bool editName = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for TileComponent component.
  late TileComponentModel tileComponentModel1;
  // Model for TileComponent component.
  late TileComponentModel tileComponentModel2;
  // Model for TileComponent component.
  late TileComponentModel tileComponentModel3;
  // Model for TileComponent component.
  late TileComponentModel tileComponentModel4;
  // Model for TileComponent component.
  late TileComponentModel tileComponentModel5;
  // Model for TileComponent component.
  late TileComponentModel tileComponentModel6;
  // Model for TileComponent component.
  late TileComponentModel tileComponentModel7;
  // Model for TileComponent component.
  late TileComponentModel tileComponentModel8;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    tileComponentModel1 = createModel(context, () => TileComponentModel());
    tileComponentModel2 = createModel(context, () => TileComponentModel());
    tileComponentModel3 = createModel(context, () => TileComponentModel());
    tileComponentModel4 = createModel(context, () => TileComponentModel());
    tileComponentModel5 = createModel(context, () => TileComponentModel());
    tileComponentModel6 = createModel(context, () => TileComponentModel());
    tileComponentModel7 = createModel(context, () => TileComponentModel());
    tileComponentModel8 = createModel(context, () => TileComponentModel());
  }

  void dispose() {
    unfocusNode.dispose();
    tileComponentModel1.dispose();
    tileComponentModel2.dispose();
    tileComponentModel3.dispose();
    tileComponentModel4.dispose();
    tileComponentModel5.dispose();
    tileComponentModel6.dispose();
    tileComponentModel7.dispose();
    tileComponentModel8.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
