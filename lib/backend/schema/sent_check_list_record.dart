import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SentCheckListRecord extends FirestoreRecord {
  SentCheckListRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "property" field.
  DocumentReference? _property;
  DocumentReference? get property => _property;
  bool hasProperty() => _property != null;

  // "message" field.
  String? _message;
  String get message => _message ?? '';
  bool hasMessage() => _message != null;

  void _initializeFields() {
    _property = snapshotData['property'] as DocumentReference?;
    _message = snapshotData['message'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('sent_check_List');

  static Stream<SentCheckListRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SentCheckListRecord.fromSnapshot(s));

  static Future<SentCheckListRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SentCheckListRecord.fromSnapshot(s));

  static SentCheckListRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SentCheckListRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SentCheckListRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SentCheckListRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SentCheckListRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SentCheckListRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSentCheckListRecordData({
  DocumentReference? property,
  String? message,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'property': property,
      'message': message,
    }.withoutNulls,
  );

  return firestoreData;
}

class SentCheckListRecordDocumentEquality
    implements Equality<SentCheckListRecord> {
  const SentCheckListRecordDocumentEquality();

  @override
  bool equals(SentCheckListRecord? e1, SentCheckListRecord? e2) {
    return e1?.property == e2?.property && e1?.message == e2?.message;
  }

  @override
  int hash(SentCheckListRecord? e) =>
      const ListEquality().hash([e?.property, e?.message]);

  @override
  bool isValidKey(Object? o) => o is SentCheckListRecord;
}
