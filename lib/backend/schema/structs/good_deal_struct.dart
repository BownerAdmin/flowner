// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GoodDealStruct extends FFFirebaseStruct {
  GoodDealStruct({
    String? type,
    String? title,
    String? description,
    String? contributor,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _type = type,
        _title = title,
        _description = description,
        _contributor = contributor,
        super(firestoreUtilData);

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  set type(String? val) => _type = val;
  bool hasType() => _type != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;
  bool hasTitle() => _title != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;
  bool hasDescription() => _description != null;

  // "contributor" field.
  String? _contributor;
  String get contributor => _contributor ?? '';
  set contributor(String? val) => _contributor = val;
  bool hasContributor() => _contributor != null;

  static GoodDealStruct fromMap(Map<String, dynamic> data) => GoodDealStruct(
        type: data['type'] as String?,
        title: data['title'] as String?,
        description: data['description'] as String?,
        contributor: data['contributor'] as String?,
      );

  static GoodDealStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? GoodDealStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'type': _type,
        'title': _title,
        'description': _description,
        'contributor': _contributor,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'type': serializeParam(
          _type,
          ParamType.String,
        ),
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'contributor': serializeParam(
          _contributor,
          ParamType.String,
        ),
      }.withoutNulls;

  static GoodDealStruct fromSerializableMap(Map<String, dynamic> data) =>
      GoodDealStruct(
        type: deserializeParam(
          data['type'],
          ParamType.String,
          false,
        ),
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        contributor: deserializeParam(
          data['contributor'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'GoodDealStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is GoodDealStruct &&
        type == other.type &&
        title == other.title &&
        description == other.description &&
        contributor == other.contributor;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([type, title, description, contributor]);
}

GoodDealStruct createGoodDealStruct({
  String? type,
  String? title,
  String? description,
  String? contributor,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    GoodDealStruct(
      type: type,
      title: title,
      description: description,
      contributor: contributor,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

GoodDealStruct? updateGoodDealStruct(
  GoodDealStruct? goodDeal, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    goodDeal
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addGoodDealStructData(
  Map<String, dynamic> firestoreData,
  GoodDealStruct? goodDeal,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (goodDeal == null) {
    return;
  }
  if (goodDeal.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && goodDeal.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final goodDealData = getGoodDealFirestoreData(goodDeal, forFieldValue);
  final nestedData = goodDealData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = goodDeal.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getGoodDealFirestoreData(
  GoodDealStruct? goodDeal, [
  bool forFieldValue = false,
]) {
  if (goodDeal == null) {
    return {};
  }
  final firestoreData = mapToFirestore(goodDeal.toMap());

  // Add any Firestore field values
  goodDeal.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getGoodDealListFirestoreData(
  List<GoodDealStruct>? goodDeals,
) =>
    goodDeals?.map((e) => getGoodDealFirestoreData(e, true)).toList() ?? [];
