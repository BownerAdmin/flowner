import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/planning_list_item_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'visitor_planning_dialog_model.dart';
export 'visitor_planning_dialog_model.dart';

class VisitorPlanningDialogWidget extends StatefulWidget {
  const VisitorPlanningDialogWidget({
    Key? key,
    required this.property,
  }) : super(key: key);

  final PropertiesRecord? property;

  @override
  _VisitorPlanningDialogWidgetState createState() =>
      _VisitorPlanningDialogWidgetState();
}

class _VisitorPlanningDialogWidgetState
    extends State<VisitorPlanningDialogWidget> {
  late VisitorPlanningDialogModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VisitorPlanningDialogModel());

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
          padding: EdgeInsets.all(12.0),
          child: StreamBuilder<PropertiesRecord>(
            stream: PropertiesRecord.getDocument(widget.property!.reference),
            builder: (context, snapshot) {
              // Customize what your widget looks like when it's loading.
              if (!snapshot.hasData) {
                return Center(
                  child: SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        FlutterFlowTheme.of(context).primary,
                      ),
                    ),
                  ),
                );
              }
              final columnPropertiesRecord = snapshot.data!;
              return Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Align(
                    alignment: AlignmentDirectional(-1.0, -1.0),
                    child: FlutterFlowIconButton(
                      borderRadius: 20.0,
                      borderWidth: 1.0,
                      buttonSize: 40.0,
                      fillColor: FlutterFlowTheme.of(context).alternate,
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
                  Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: 400.0,
                    child: custom_widgets.PlanningWidget(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: 400.0,
                      color: FlutterFlowTheme.of(context).primary,
                      weekFormat: false,
                      weekStartsMonday: true,
                      twoRowHeader: false,
                      iconColor: FlutterFlowTheme.of(context).secondaryText,
                      rowHeight: 50.0,
                      initialDate: getCurrentTimestamp,
                      occupiedDates: columnPropertiesRecord.occupancyList,
                    ),
                  ),
                  if ((FFAppState().selectedDate != null) &&
                      (functions
                              .getOccupanciesFromDate(
                                  FFAppState().selectedDate!,
                                  columnPropertiesRecord.occupancyList.toList())
                              .length >
                          0))
                    Builder(
                      builder: (context) {
                        final occupancies = functions
                            .getOccupanciesFromDate(FFAppState().selectedDate!,
                                columnPropertiesRecord.occupancyList.toList())
                            .toList();
                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: occupancies.length,
                          itemBuilder: (context, occupanciesIndex) {
                            final occupanciesItem =
                                occupancies[occupanciesIndex];
                            return PlanningListItemWidget(
                              key: Key(
                                  'Keyon2_${occupanciesIndex}_of_${occupancies.length}'),
                              name: occupanciesItem.name,
                              nbGuests: occupanciesItem.nbGuests,
                              isFriend: occupanciesItem.isFriend,
                              fromDate: dateTimeFormat(
                                  'd/M/y', occupanciesItem.startDate!),
                              toDate: dateTimeFormat(
                                  'd/M/y', occupanciesItem.endDate!),
                            );
                          },
                        );
                      },
                    ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
