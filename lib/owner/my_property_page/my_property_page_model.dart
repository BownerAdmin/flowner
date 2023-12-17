import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/common/tile_component/tile_component_widget.dart';
import '/components/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/owner/check_list/check_list_details/check_list_details_widget.dart';
import '/owner/functions/functions_details/functions_details_widget.dart';
import '/owner/photos/owner_photos/owner_photos_widget.dart';
import '/owner/planning/edit_planning/edit_planning_widget.dart';
import '/owner/welcome_message/welcome_message/welcome_message_widget.dart';
import 'my_property_page_widget.dart' show MyPropertyPageWidget;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MyPropertyPageModel extends FlutterFlowModel<MyPropertyPageWidget> {
  ///  Local state fields for this page.

  bool editName = false;

  bool showPassword = false;

  bool editPassword = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for NavBar component.
  late NavBarModel navBarModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
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
    navBarModel = createModel(context, () => NavBarModel());
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
    navBarModel.dispose();
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

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
