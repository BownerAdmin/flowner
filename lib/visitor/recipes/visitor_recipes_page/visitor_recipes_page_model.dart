import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/visitor/recipes/add_recipe_bottom_sheet/add_recipe_bottom_sheet_widget.dart';
import '/visitor/recipes/empty_recipes/empty_recipes_widget.dart';
import '/visitor/recipes/recipe_dialog/recipe_dialog_widget.dart';
import '/visitor/recipes/recipe_tile/recipe_tile_widget.dart';
import 'visitor_recipes_page_widget.dart' show VisitorRecipesPageWidget;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class VisitorRecipesPageModel
    extends FlutterFlowModel<VisitorRecipesPageWidget> {
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
