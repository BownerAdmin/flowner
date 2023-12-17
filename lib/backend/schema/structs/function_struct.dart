// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FunctionStruct extends FFFirebaseStruct {
  FunctionStruct({
    String? name,
    String? explanations,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _explanations = explanations,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "explanations" field.
  String? _explanations;
  String get explanations => _explanations ?? '';
  set explanations(String? val) => _explanations = val;
  bool hasExplanations() => _explanations != null;

  static FunctionStruct fromMap(Map<String, dynamic> data) => FunctionStruct(
        name: data['name'] as String?,
        explanations: data['explanations'] as String?,
      );

  static FunctionStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? FunctionStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'explanations': _explanations,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'explanations': serializeParam(
          _explanations,
          ParamType.String,
        ),
      }.withoutNulls;

  static FunctionStruct fromSerializableMap(Map<String, dynamic> data) =>
      FunctionStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        explanations: deserializeParam(
          data['explanations'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'FunctionStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is FunctionStruct &&
        name == other.name &&
        explanations == other.explanations;
  }

  @override
  int get hashCode => const ListEquality().hash([name, explanations]);
}

FunctionStruct createFunctionStruct({
  String? name,
  String? explanations,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    FunctionStruct(
      name: name,
      explanations: explanations,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

FunctionStruct? updateFunctionStruct(
  FunctionStruct? function, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    function
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addFunctionStructData(
  Map<String, dynamic> firestoreData,
  FunctionStruct? function,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (function == null) {
    return;
  }
  if (function.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && function.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final functionData = getFunctionFirestoreData(function, forFieldValue);
  final nestedData = functionData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = function.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getFunctionFirestoreData(
  FunctionStruct? function, [
  bool forFieldValue = false,
]) {
  if (function == null) {
    return {};
  }
  final firestoreData = mapToFirestore(function.toMap());

  // Add any Firestore field values
  function.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getFunctionListFirestoreData(
  List<FunctionStruct>? functions,
) =>
    functions?.map((e) => getFunctionFirestoreData(e, true)).toList() ?? [];
