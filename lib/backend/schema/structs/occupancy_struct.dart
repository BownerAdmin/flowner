// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OccupancyStruct extends FFFirebaseStruct {
  OccupancyStruct({
    DateTime? startDate,
    DateTime? endDate,
    bool? isFriend,
    String? name,
    int? nbGuests,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _startDate = startDate,
        _endDate = endDate,
        _isFriend = isFriend,
        _name = name,
        _nbGuests = nbGuests,
        super(firestoreUtilData);

  // "start_date" field.
  DateTime? _startDate;
  DateTime? get startDate => _startDate;
  set startDate(DateTime? val) => _startDate = val;
  bool hasStartDate() => _startDate != null;

  // "end_date" field.
  DateTime? _endDate;
  DateTime? get endDate => _endDate;
  set endDate(DateTime? val) => _endDate = val;
  bool hasEndDate() => _endDate != null;

  // "is_friend" field.
  bool? _isFriend;
  bool get isFriend => _isFriend ?? false;
  set isFriend(bool? val) => _isFriend = val;
  bool hasIsFriend() => _isFriend != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "nb_guests" field.
  int? _nbGuests;
  int get nbGuests => _nbGuests ?? 0;
  set nbGuests(int? val) => _nbGuests = val;
  void incrementNbGuests(int amount) => _nbGuests = nbGuests + amount;
  bool hasNbGuests() => _nbGuests != null;

  static OccupancyStruct fromMap(Map<String, dynamic> data) => OccupancyStruct(
        startDate: data['start_date'] as DateTime?,
        endDate: data['end_date'] as DateTime?,
        isFriend: data['is_friend'] as bool?,
        name: data['name'] as String?,
        nbGuests: castToType<int>(data['nb_guests']),
      );

  static OccupancyStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? OccupancyStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'start_date': _startDate,
        'end_date': _endDate,
        'is_friend': _isFriend,
        'name': _name,
        'nb_guests': _nbGuests,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'start_date': serializeParam(
          _startDate,
          ParamType.DateTime,
        ),
        'end_date': serializeParam(
          _endDate,
          ParamType.DateTime,
        ),
        'is_friend': serializeParam(
          _isFriend,
          ParamType.bool,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'nb_guests': serializeParam(
          _nbGuests,
          ParamType.int,
        ),
      }.withoutNulls;

  static OccupancyStruct fromSerializableMap(Map<String, dynamic> data) =>
      OccupancyStruct(
        startDate: deserializeParam(
          data['start_date'],
          ParamType.DateTime,
          false,
        ),
        endDate: deserializeParam(
          data['end_date'],
          ParamType.DateTime,
          false,
        ),
        isFriend: deserializeParam(
          data['is_friend'],
          ParamType.bool,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        nbGuests: deserializeParam(
          data['nb_guests'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'OccupancyStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is OccupancyStruct &&
        startDate == other.startDate &&
        endDate == other.endDate &&
        isFriend == other.isFriend &&
        name == other.name &&
        nbGuests == other.nbGuests;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([startDate, endDate, isFriend, name, nbGuests]);
}

OccupancyStruct createOccupancyStruct({
  DateTime? startDate,
  DateTime? endDate,
  bool? isFriend,
  String? name,
  int? nbGuests,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    OccupancyStruct(
      startDate: startDate,
      endDate: endDate,
      isFriend: isFriend,
      name: name,
      nbGuests: nbGuests,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

OccupancyStruct? updateOccupancyStruct(
  OccupancyStruct? occupancy, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    occupancy
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addOccupancyStructData(
  Map<String, dynamic> firestoreData,
  OccupancyStruct? occupancy,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (occupancy == null) {
    return;
  }
  if (occupancy.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && occupancy.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final occupancyData = getOccupancyFirestoreData(occupancy, forFieldValue);
  final nestedData = occupancyData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = occupancy.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getOccupancyFirestoreData(
  OccupancyStruct? occupancy, [
  bool forFieldValue = false,
]) {
  if (occupancy == null) {
    return {};
  }
  final firestoreData = mapToFirestore(occupancy.toMap());

  // Add any Firestore field values
  occupancy.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getOccupancyListFirestoreData(
  List<OccupancyStruct>? occupancys,
) =>
    occupancys?.map((e) => getOccupancyFirestoreData(e, true)).toList() ?? [];
