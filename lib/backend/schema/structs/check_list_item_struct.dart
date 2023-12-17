// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CheckListItemStruct extends FFFirebaseStruct {
  CheckListItemStruct({
    String? name,
    String? description,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _description = description,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;
  bool hasDescription() => _description != null;

  static CheckListItemStruct fromMap(Map<String, dynamic> data) =>
      CheckListItemStruct(
        name: data['name'] as String?,
        description: data['description'] as String?,
      );

  static CheckListItemStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? CheckListItemStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'description': _description,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
      }.withoutNulls;

  static CheckListItemStruct fromSerializableMap(Map<String, dynamic> data) =>
      CheckListItemStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'CheckListItemStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CheckListItemStruct &&
        name == other.name &&
        description == other.description;
  }

  @override
  int get hashCode => const ListEquality().hash([name, description]);
}

CheckListItemStruct createCheckListItemStruct({
  String? name,
  String? description,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CheckListItemStruct(
      name: name,
      description: description,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CheckListItemStruct? updateCheckListItemStruct(
  CheckListItemStruct? checkListItem, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    checkListItem
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCheckListItemStructData(
  Map<String, dynamic> firestoreData,
  CheckListItemStruct? checkListItem,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (checkListItem == null) {
    return;
  }
  if (checkListItem.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && checkListItem.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final checkListItemData =
      getCheckListItemFirestoreData(checkListItem, forFieldValue);
  final nestedData =
      checkListItemData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = checkListItem.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCheckListItemFirestoreData(
  CheckListItemStruct? checkListItem, [
  bool forFieldValue = false,
]) {
  if (checkListItem == null) {
    return {};
  }
  final firestoreData = mapToFirestore(checkListItem.toMap());

  // Add any Firestore field values
  checkListItem.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCheckListItemListFirestoreData(
  List<CheckListItemStruct>? checkListItems,
) =>
    checkListItems
        ?.map((e) => getCheckListItemFirestoreData(e, true))
        .toList() ??
    [];
