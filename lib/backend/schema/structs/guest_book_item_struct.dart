// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GuestBookItemStruct extends FFFirebaseStruct {
  GuestBookItemStruct({
    String? message,
    String? creator,
    DateTime? date,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _message = message,
        _creator = creator,
        _date = date,
        super(firestoreUtilData);

  // "message" field.
  String? _message;
  String get message => _message ?? '';
  set message(String? val) => _message = val;
  bool hasMessage() => _message != null;

  // "creator" field.
  String? _creator;
  String get creator => _creator ?? '';
  set creator(String? val) => _creator = val;
  bool hasCreator() => _creator != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  set date(DateTime? val) => _date = val;
  bool hasDate() => _date != null;

  static GuestBookItemStruct fromMap(Map<String, dynamic> data) =>
      GuestBookItemStruct(
        message: data['message'] as String?,
        creator: data['creator'] as String?,
        date: data['date'] as DateTime?,
      );

  static GuestBookItemStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? GuestBookItemStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'message': _message,
        'creator': _creator,
        'date': _date,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'message': serializeParam(
          _message,
          ParamType.String,
        ),
        'creator': serializeParam(
          _creator,
          ParamType.String,
        ),
        'date': serializeParam(
          _date,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static GuestBookItemStruct fromSerializableMap(Map<String, dynamic> data) =>
      GuestBookItemStruct(
        message: deserializeParam(
          data['message'],
          ParamType.String,
          false,
        ),
        creator: deserializeParam(
          data['creator'],
          ParamType.String,
          false,
        ),
        date: deserializeParam(
          data['date'],
          ParamType.DateTime,
          false,
        ),
      );

  @override
  String toString() => 'GuestBookItemStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is GuestBookItemStruct &&
        message == other.message &&
        creator == other.creator &&
        date == other.date;
  }

  @override
  int get hashCode => const ListEquality().hash([message, creator, date]);
}

GuestBookItemStruct createGuestBookItemStruct({
  String? message,
  String? creator,
  DateTime? date,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    GuestBookItemStruct(
      message: message,
      creator: creator,
      date: date,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

GuestBookItemStruct? updateGuestBookItemStruct(
  GuestBookItemStruct? guestBookItem, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    guestBookItem
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addGuestBookItemStructData(
  Map<String, dynamic> firestoreData,
  GuestBookItemStruct? guestBookItem,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (guestBookItem == null) {
    return;
  }
  if (guestBookItem.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && guestBookItem.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final guestBookItemData =
      getGuestBookItemFirestoreData(guestBookItem, forFieldValue);
  final nestedData =
      guestBookItemData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = guestBookItem.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getGuestBookItemFirestoreData(
  GuestBookItemStruct? guestBookItem, [
  bool forFieldValue = false,
]) {
  if (guestBookItem == null) {
    return {};
  }
  final firestoreData = mapToFirestore(guestBookItem.toMap());

  // Add any Firestore field values
  guestBookItem.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getGuestBookItemListFirestoreData(
  List<GuestBookItemStruct>? guestBookItems,
) =>
    guestBookItems
        ?.map((e) => getGuestBookItemFirestoreData(e, true))
        .toList() ??
    [];
