import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/owner/check_list/set_check_list_component/set_check_list_component_widget.dart';
import 'check_list_details_widget.dart' show CheckListDetailsWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CheckListDetailsModel extends FlutterFlowModel<CheckListDetailsWidget> {
  ///  Local state fields for this component.

  DateTimeRange? selectedDateRange;

  ///  State fields for stateful widgets in this component.

  // Model for SetCheckListComponent component.
  late SetCheckListComponentModel setCheckListComponentModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    setCheckListComponentModel =
        createModel(context, () => SetCheckListComponentModel());
  }

  void dispose() {
    setCheckListComponentModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
