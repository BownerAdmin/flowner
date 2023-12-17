// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PhotoStruct extends FFFirebaseStruct {
  PhotoStruct({
    String? name,
    DateTime? date,
    String? comment,
    List<String>? images,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _date = date,
        _comment = comment,
        _images = images,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  set date(DateTime? val) => _date = val;
  bool hasDate() => _date != null;

  // "comment" field.
  String? _comment;
  String get comment => _comment ?? '';
  set comment(String? val) => _comment = val;
  bool hasComment() => _comment != null;

  // "images" field.
  List<String>? _images;
  List<String> get images => _images ?? const [];
  set images(List<String>? val) => _images = val;
  void updateImages(Function(List<String>) updateFn) =>
      updateFn(_images ??= []);
  bool hasImages() => _images != null;

  static PhotoStruct fromMap(Map<String, dynamic> data) => PhotoStruct(
        name: data['name'] as String?,
        date: data['date'] as DateTime?,
        comment: data['comment'] as String?,
        images: getDataList(data['images']),
      );

  static PhotoStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? PhotoStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'date': _date,
        'comment': _comment,
        'images': _images,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'date': serializeParam(
          _date,
          ParamType.DateTime,
        ),
        'comment': serializeParam(
          _comment,
          ParamType.String,
        ),
        'images': serializeParam(
          _images,
          ParamType.String,
          true,
        ),
      }.withoutNulls;

  static PhotoStruct fromSerializableMap(Map<String, dynamic> data) =>
      PhotoStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        date: deserializeParam(
          data['date'],
          ParamType.DateTime,
          false,
        ),
        comment: deserializeParam(
          data['comment'],
          ParamType.String,
          false,
        ),
        images: deserializeParam<String>(
          data['images'],
          ParamType.String,
          true,
        ),
      );

  @override
  String toString() => 'PhotoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is PhotoStruct &&
        name == other.name &&
        date == other.date &&
        comment == other.comment &&
        listEquality.equals(images, other.images);
  }

  @override
  int get hashCode => const ListEquality().hash([name, date, comment, images]);
}

PhotoStruct createPhotoStruct({
  String? name,
  DateTime? date,
  String? comment,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PhotoStruct(
      name: name,
      date: date,
      comment: comment,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PhotoStruct? updatePhotoStruct(
  PhotoStruct? photo, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    photo
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPhotoStructData(
  Map<String, dynamic> firestoreData,
  PhotoStruct? photo,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (photo == null) {
    return;
  }
  if (photo.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && photo.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final photoData = getPhotoFirestoreData(photo, forFieldValue);
  final nestedData = photoData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = photo.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPhotoFirestoreData(
  PhotoStruct? photo, [
  bool forFieldValue = false,
]) {
  if (photo == null) {
    return {};
  }
  final firestoreData = mapToFirestore(photo.toMap());

  // Add any Firestore field values
  photo.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPhotoListFirestoreData(
  List<PhotoStruct>? photos,
) =>
    photos?.map((e) => getPhotoFirestoreData(e, true)).toList() ?? [];
