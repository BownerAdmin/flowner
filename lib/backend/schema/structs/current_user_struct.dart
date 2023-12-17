// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CurrentUserStruct extends FFFirebaseStruct {
  CurrentUserStruct({
    String? name,
    String? token,
    DateTime? creationDate,
    DateTime? arrivalDate,
    DateTime? departureDate,
    bool? isFriend,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _token = token,
        _creationDate = creationDate,
        _arrivalDate = arrivalDate,
        _departureDate = departureDate,
        _isFriend = isFriend,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "token" field.
  String? _token;
  String get token => _token ?? '';
  set token(String? val) => _token = val;
  bool hasToken() => _token != null;

  // "creation_date" field.
  DateTime? _creationDate;
  DateTime? get creationDate => _creationDate;
  set creationDate(DateTime? val) => _creationDate = val;
  bool hasCreationDate() => _creationDate != null;

  // "arrival_date" field.
  DateTime? _arrivalDate;
  DateTime? get arrivalDate => _arrivalDate;
  set arrivalDate(DateTime? val) => _arrivalDate = val;
  bool hasArrivalDate() => _arrivalDate != null;

  // "departure_date" field.
  DateTime? _departureDate;
  DateTime? get departureDate => _departureDate;
  set departureDate(DateTime? val) => _departureDate = val;
  bool hasDepartureDate() => _departureDate != null;

  // "is_friend" field.
  bool? _isFriend;
  bool get isFriend => _isFriend ?? false;
  set isFriend(bool? val) => _isFriend = val;
  bool hasIsFriend() => _isFriend != null;

  static CurrentUserStruct fromMap(Map<String, dynamic> data) =>
      CurrentUserStruct(
        name: data['name'] as String?,
        token: data['token'] as String?,
        creationDate: data['creation_date'] as DateTime?,
        arrivalDate: data['arrival_date'] as DateTime?,
        departureDate: data['departure_date'] as DateTime?,
        isFriend: data['is_friend'] as bool?,
      );

  static CurrentUserStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? CurrentUserStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'token': _token,
        'creation_date': _creationDate,
        'arrival_date': _arrivalDate,
        'departure_date': _departureDate,
        'is_friend': _isFriend,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'token': serializeParam(
          _token,
          ParamType.String,
        ),
        'creation_date': serializeParam(
          _creationDate,
          ParamType.DateTime,
        ),
        'arrival_date': serializeParam(
          _arrivalDate,
          ParamType.DateTime,
        ),
        'departure_date': serializeParam(
          _departureDate,
          ParamType.DateTime,
        ),
        'is_friend': serializeParam(
          _isFriend,
          ParamType.bool,
        ),
      }.withoutNulls;

  static CurrentUserStruct fromSerializableMap(Map<String, dynamic> data) =>
      CurrentUserStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        token: deserializeParam(
          data['token'],
          ParamType.String,
          false,
        ),
        creationDate: deserializeParam(
          data['creation_date'],
          ParamType.DateTime,
          false,
        ),
        arrivalDate: deserializeParam(
          data['arrival_date'],
          ParamType.DateTime,
          false,
        ),
        departureDate: deserializeParam(
          data['departure_date'],
          ParamType.DateTime,
          false,
        ),
        isFriend: deserializeParam(
          data['is_friend'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'CurrentUserStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CurrentUserStruct &&
        name == other.name &&
        token == other.token &&
        creationDate == other.creationDate &&
        arrivalDate == other.arrivalDate &&
        departureDate == other.departureDate &&
        isFriend == other.isFriend;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([name, token, creationDate, arrivalDate, departureDate, isFriend]);
}

CurrentUserStruct createCurrentUserStruct({
  String? name,
  String? token,
  DateTime? creationDate,
  DateTime? arrivalDate,
  DateTime? departureDate,
  bool? isFriend,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CurrentUserStruct(
      name: name,
      token: token,
      creationDate: creationDate,
      arrivalDate: arrivalDate,
      departureDate: departureDate,
      isFriend: isFriend,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CurrentUserStruct? updateCurrentUserStruct(
  CurrentUserStruct? currentUser, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    currentUser
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCurrentUserStructData(
  Map<String, dynamic> firestoreData,
  CurrentUserStruct? currentUser,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (currentUser == null) {
    return;
  }
  if (currentUser.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && currentUser.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final currentUserData =
      getCurrentUserFirestoreData(currentUser, forFieldValue);
  final nestedData =
      currentUserData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = currentUser.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCurrentUserFirestoreData(
  CurrentUserStruct? currentUser, [
  bool forFieldValue = false,
]) {
  if (currentUser == null) {
    return {};
  }
  final firestoreData = mapToFirestore(currentUser.toMap());

  // Add any Firestore field values
  currentUser.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCurrentUserListFirestoreData(
  List<CurrentUserStruct>? currentUsers,
) =>
    currentUsers?.map((e) => getCurrentUserFirestoreData(e, true)).toList() ??
    [];
