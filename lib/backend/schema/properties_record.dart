import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PropertiesRecord extends FirestoreRecord {
  PropertiesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "owner" field.
  String? _owner;
  String get owner => _owner ?? '';
  bool hasOwner() => _owner != null;

  // "property_id" field.
  int? _propertyId;
  int get propertyId => _propertyId ?? 0;
  bool hasPropertyId() => _propertyId != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "welcome_message" field.
  String? _welcomeMessage;
  String get welcomeMessage => _welcomeMessage ?? '';
  bool hasWelcomeMessage() => _welcomeMessage != null;

  // "is_set" field.
  bool? _isSet;
  bool get isSet => _isSet ?? false;
  bool hasIsSet() => _isSet != null;

  // "owner_ref" field.
  DocumentReference? _ownerRef;
  DocumentReference? get ownerRef => _ownerRef;
  bool hasOwnerRef() => _ownerRef != null;

  // "occupancy_list" field.
  List<OccupancyStruct>? _occupancyList;
  List<OccupancyStruct> get occupancyList => _occupancyList ?? const [];
  bool hasOccupancyList() => _occupancyList != null;

  // "check_list" field.
  List<CheckListItemStruct>? _checkList;
  List<CheckListItemStruct> get checkList => _checkList ?? const [];
  bool hasCheckList() => _checkList != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "function_list" field.
  List<FunctionStruct>? _functionList;
  List<FunctionStruct> get functionList => _functionList ?? const [];
  bool hasFunctionList() => _functionList != null;

  // "photo_list" field.
  List<PhotoStruct>? _photoList;
  List<PhotoStruct> get photoList => _photoList ?? const [];
  bool hasPhotoList() => _photoList != null;

  // "password" field.
  String? _password;
  String get password => _password ?? '';
  bool hasPassword() => _password != null;

  // "qr_code" field.
  String? _qrCode;
  String get qrCode => _qrCode ?? '';
  bool hasQrCode() => _qrCode != null;

  // "recipes" field.
  List<RecipeStruct>? _recipes;
  List<RecipeStruct> get recipes => _recipes ?? const [];
  bool hasRecipes() => _recipes != null;

  // "good_deals" field.
  List<GoodDealStruct>? _goodDeals;
  List<GoodDealStruct> get goodDeals => _goodDeals ?? const [];
  bool hasGoodDeals() => _goodDeals != null;

  // "guest_book" field.
  List<GuestBookItemStruct>? _guestBook;
  List<GuestBookItemStruct> get guestBook => _guestBook ?? const [];
  bool hasGuestBook() => _guestBook != null;

  void _initializeFields() {
    _owner = snapshotData['owner'] as String?;
    _propertyId = castToType<int>(snapshotData['property_id']);
    _name = snapshotData['name'] as String?;
    _welcomeMessage = snapshotData['welcome_message'] as String?;
    _isSet = snapshotData['is_set'] as bool?;
    _ownerRef = snapshotData['owner_ref'] as DocumentReference?;
    _occupancyList = getStructList(
      snapshotData['occupancy_list'],
      OccupancyStruct.fromMap,
    );
    _checkList = getStructList(
      snapshotData['check_list'],
      CheckListItemStruct.fromMap,
    );
    _image = snapshotData['image'] as String?;
    _functionList = getStructList(
      snapshotData['function_list'],
      FunctionStruct.fromMap,
    );
    _photoList = getStructList(
      snapshotData['photo_list'],
      PhotoStruct.fromMap,
    );
    _password = snapshotData['password'] as String?;
    _qrCode = snapshotData['qr_code'] as String?;
    _recipes = getStructList(
      snapshotData['recipes'],
      RecipeStruct.fromMap,
    );
    _goodDeals = getStructList(
      snapshotData['good_deals'],
      GoodDealStruct.fromMap,
    );
    _guestBook = getStructList(
      snapshotData['guest_book'],
      GuestBookItemStruct.fromMap,
    );
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('properties');

  static Stream<PropertiesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PropertiesRecord.fromSnapshot(s));

  static Future<PropertiesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PropertiesRecord.fromSnapshot(s));

  static PropertiesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PropertiesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PropertiesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PropertiesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PropertiesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PropertiesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPropertiesRecordData({
  String? owner,
  int? propertyId,
  String? name,
  String? welcomeMessage,
  bool? isSet,
  DocumentReference? ownerRef,
  String? image,
  String? password,
  String? qrCode,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'owner': owner,
      'property_id': propertyId,
      'name': name,
      'welcome_message': welcomeMessage,
      'is_set': isSet,
      'owner_ref': ownerRef,
      'image': image,
      'password': password,
      'qr_code': qrCode,
    }.withoutNulls,
  );

  return firestoreData;
}

class PropertiesRecordDocumentEquality implements Equality<PropertiesRecord> {
  const PropertiesRecordDocumentEquality();

  @override
  bool equals(PropertiesRecord? e1, PropertiesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.owner == e2?.owner &&
        e1?.propertyId == e2?.propertyId &&
        e1?.name == e2?.name &&
        e1?.welcomeMessage == e2?.welcomeMessage &&
        e1?.isSet == e2?.isSet &&
        e1?.ownerRef == e2?.ownerRef &&
        listEquality.equals(e1?.occupancyList, e2?.occupancyList) &&
        listEquality.equals(e1?.checkList, e2?.checkList) &&
        e1?.image == e2?.image &&
        listEquality.equals(e1?.functionList, e2?.functionList) &&
        listEquality.equals(e1?.photoList, e2?.photoList) &&
        e1?.password == e2?.password &&
        e1?.qrCode == e2?.qrCode &&
        listEquality.equals(e1?.recipes, e2?.recipes) &&
        listEquality.equals(e1?.goodDeals, e2?.goodDeals) &&
        listEquality.equals(e1?.guestBook, e2?.guestBook);
  }

  @override
  int hash(PropertiesRecord? e) => const ListEquality().hash([
        e?.owner,
        e?.propertyId,
        e?.name,
        e?.welcomeMessage,
        e?.isSet,
        e?.ownerRef,
        e?.occupancyList,
        e?.checkList,
        e?.image,
        e?.functionList,
        e?.photoList,
        e?.password,
        e?.qrCode,
        e?.recipes,
        e?.goodDeals,
        e?.guestBook
      ]);

  @override
  bool isValidKey(Object? o) => o is PropertiesRecord;
}
