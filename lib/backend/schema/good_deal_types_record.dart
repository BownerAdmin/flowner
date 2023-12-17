import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GoodDealTypesRecord extends FirestoreRecord {
  GoodDealTypesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "position" field.
  int? _position;
  int get position => _position ?? 0;
  bool hasPosition() => _position != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _position = castToType<int>(snapshotData['position']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('good_deal_types');

  static Stream<GoodDealTypesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => GoodDealTypesRecord.fromSnapshot(s));

  static Future<GoodDealTypesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => GoodDealTypesRecord.fromSnapshot(s));

  static GoodDealTypesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      GoodDealTypesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static GoodDealTypesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      GoodDealTypesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'GoodDealTypesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is GoodDealTypesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createGoodDealTypesRecordData({
  String? name,
  int? position,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'position': position,
    }.withoutNulls,
  );

  return firestoreData;
}

class GoodDealTypesRecordDocumentEquality
    implements Equality<GoodDealTypesRecord> {
  const GoodDealTypesRecordDocumentEquality();

  @override
  bool equals(GoodDealTypesRecord? e1, GoodDealTypesRecord? e2) {
    return e1?.name == e2?.name && e1?.position == e2?.position;
  }

  @override
  int hash(GoodDealTypesRecord? e) =>
      const ListEquality().hash([e?.name, e?.position]);

  @override
  bool isValidKey(Object? o) => o is GoodDealTypesRecord;
}
