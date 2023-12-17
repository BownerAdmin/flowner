import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FunctionsRecord extends FirestoreRecord {
  FunctionsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "codePoint" field.
  int? _codePoint;
  int get codePoint => _codePoint ?? 0;
  bool hasCodePoint() => _codePoint != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _codePoint = castToType<int>(snapshotData['codePoint']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('functions');

  static Stream<FunctionsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FunctionsRecord.fromSnapshot(s));

  static Future<FunctionsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FunctionsRecord.fromSnapshot(s));

  static FunctionsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      FunctionsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FunctionsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FunctionsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FunctionsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FunctionsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFunctionsRecordData({
  String? name,
  int? codePoint,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'codePoint': codePoint,
    }.withoutNulls,
  );

  return firestoreData;
}

class FunctionsRecordDocumentEquality implements Equality<FunctionsRecord> {
  const FunctionsRecordDocumentEquality();

  @override
  bool equals(FunctionsRecord? e1, FunctionsRecord? e2) {
    return e1?.name == e2?.name && e1?.codePoint == e2?.codePoint;
  }

  @override
  int hash(FunctionsRecord? e) =>
      const ListEquality().hash([e?.name, e?.codePoint]);

  @override
  bool isValidKey(Object? o) => o is FunctionsRecord;
}
