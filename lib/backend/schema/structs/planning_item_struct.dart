// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PlanningItemStruct extends FFFirebaseStruct {
  PlanningItemStruct({
    DateTime? date,
    OccupancyStruct? occupancy,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _date = date,
        _occupancy = occupancy,
        super(firestoreUtilData);

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  set date(DateTime? val) => _date = val;
  bool hasDate() => _date != null;

  // "occupancy" field.
  OccupancyStruct? _occupancy;
  OccupancyStruct get occupancy => _occupancy ?? OccupancyStruct();
  set occupancy(OccupancyStruct? val) => _occupancy = val;
  void updateOccupancy(Function(OccupancyStruct) updateFn) =>
      updateFn(_occupancy ??= OccupancyStruct());
  bool hasOccupancy() => _occupancy != null;

  static PlanningItemStruct fromMap(Map<String, dynamic> data) =>
      PlanningItemStruct(
        date: data['date'] as DateTime?,
        occupancy: OccupancyStruct.maybeFromMap(data['occupancy']),
      );

  static PlanningItemStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? PlanningItemStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'date': _date,
        'occupancy': _occupancy?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'date': serializeParam(
          _date,
          ParamType.DateTime,
        ),
        'occupancy': serializeParam(
          _occupancy,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static PlanningItemStruct fromSerializableMap(Map<String, dynamic> data) =>
      PlanningItemStruct(
        date: deserializeParam(
          data['date'],
          ParamType.DateTime,
          false,
        ),
        occupancy: deserializeStructParam(
          data['occupancy'],
          ParamType.DataStruct,
          false,
          structBuilder: OccupancyStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'PlanningItemStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PlanningItemStruct &&
        date == other.date &&
        occupancy == other.occupancy;
  }

  @override
  int get hashCode => const ListEquality().hash([date, occupancy]);
}

PlanningItemStruct createPlanningItemStruct({
  DateTime? date,
  OccupancyStruct? occupancy,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PlanningItemStruct(
      date: date,
      occupancy: occupancy ?? (clearUnsetFields ? OccupancyStruct() : null),
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PlanningItemStruct? updatePlanningItemStruct(
  PlanningItemStruct? planningItem, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    planningItem
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPlanningItemStructData(
  Map<String, dynamic> firestoreData,
  PlanningItemStruct? planningItem,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (planningItem == null) {
    return;
  }
  if (planningItem.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && planningItem.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final planningItemData =
      getPlanningItemFirestoreData(planningItem, forFieldValue);
  final nestedData =
      planningItemData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = planningItem.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPlanningItemFirestoreData(
  PlanningItemStruct? planningItem, [
  bool forFieldValue = false,
]) {
  if (planningItem == null) {
    return {};
  }
  final firestoreData = mapToFirestore(planningItem.toMap());

  // Handle nested data for "occupancy" field.
  addOccupancyStructData(
    firestoreData,
    planningItem.hasOccupancy() ? planningItem.occupancy : null,
    'occupancy',
    forFieldValue,
  );

  // Add any Firestore field values
  planningItem.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPlanningItemListFirestoreData(
  List<PlanningItemStruct>? planningItems,
) =>
    planningItems?.map((e) => getPlanningItemFirestoreData(e, true)).toList() ??
    [];
