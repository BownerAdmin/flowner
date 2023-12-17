// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RecipeStruct extends FFFirebaseStruct {
  RecipeStruct({
    String? image,
    String? title,
    String? description,
    String? type,
    CurrentUserStruct? creator,
    int? likes,
    DateTime? creationDate,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _image = image,
        _title = title,
        _description = description,
        _type = type,
        _creator = creator,
        _likes = likes,
        _creationDate = creationDate,
        super(firestoreUtilData);

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  set image(String? val) => _image = val;
  bool hasImage() => _image != null;

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

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  set type(String? val) => _type = val;
  bool hasType() => _type != null;

  // "creator" field.
  CurrentUserStruct? _creator;
  CurrentUserStruct get creator => _creator ?? CurrentUserStruct();
  set creator(CurrentUserStruct? val) => _creator = val;
  void updateCreator(Function(CurrentUserStruct) updateFn) =>
      updateFn(_creator ??= CurrentUserStruct());
  bool hasCreator() => _creator != null;

  // "likes" field.
  int? _likes;
  int get likes => _likes ?? 0;
  set likes(int? val) => _likes = val;
  void incrementLikes(int amount) => _likes = likes + amount;
  bool hasLikes() => _likes != null;

  // "creation_date" field.
  DateTime? _creationDate;
  DateTime? get creationDate => _creationDate;
  set creationDate(DateTime? val) => _creationDate = val;
  bool hasCreationDate() => _creationDate != null;

  static RecipeStruct fromMap(Map<String, dynamic> data) => RecipeStruct(
        image: data['image'] as String?,
        title: data['title'] as String?,
        description: data['description'] as String?,
        type: data['type'] as String?,
        creator: CurrentUserStruct.maybeFromMap(data['creator']),
        likes: castToType<int>(data['likes']),
        creationDate: data['creation_date'] as DateTime?,
      );

  static RecipeStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? RecipeStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'image': _image,
        'title': _title,
        'description': _description,
        'type': _type,
        'creator': _creator?.toMap(),
        'likes': _likes,
        'creation_date': _creationDate,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'image': serializeParam(
          _image,
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
        'type': serializeParam(
          _type,
          ParamType.String,
        ),
        'creator': serializeParam(
          _creator,
          ParamType.DataStruct,
        ),
        'likes': serializeParam(
          _likes,
          ParamType.int,
        ),
        'creation_date': serializeParam(
          _creationDate,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static RecipeStruct fromSerializableMap(Map<String, dynamic> data) =>
      RecipeStruct(
        image: deserializeParam(
          data['image'],
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
        type: deserializeParam(
          data['type'],
          ParamType.String,
          false,
        ),
        creator: deserializeStructParam(
          data['creator'],
          ParamType.DataStruct,
          false,
          structBuilder: CurrentUserStruct.fromSerializableMap,
        ),
        likes: deserializeParam(
          data['likes'],
          ParamType.int,
          false,
        ),
        creationDate: deserializeParam(
          data['creation_date'],
          ParamType.DateTime,
          false,
        ),
      );

  @override
  String toString() => 'RecipeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is RecipeStruct &&
        image == other.image &&
        title == other.title &&
        description == other.description &&
        type == other.type &&
        creator == other.creator &&
        likes == other.likes &&
        creationDate == other.creationDate;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([image, title, description, type, creator, likes, creationDate]);
}

RecipeStruct createRecipeStruct({
  String? image,
  String? title,
  String? description,
  String? type,
  CurrentUserStruct? creator,
  int? likes,
  DateTime? creationDate,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    RecipeStruct(
      image: image,
      title: title,
      description: description,
      type: type,
      creator: creator ?? (clearUnsetFields ? CurrentUserStruct() : null),
      likes: likes,
      creationDate: creationDate,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

RecipeStruct? updateRecipeStruct(
  RecipeStruct? recipe, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    recipe
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addRecipeStructData(
  Map<String, dynamic> firestoreData,
  RecipeStruct? recipe,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (recipe == null) {
    return;
  }
  if (recipe.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && recipe.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final recipeData = getRecipeFirestoreData(recipe, forFieldValue);
  final nestedData = recipeData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = recipe.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getRecipeFirestoreData(
  RecipeStruct? recipe, [
  bool forFieldValue = false,
]) {
  if (recipe == null) {
    return {};
  }
  final firestoreData = mapToFirestore(recipe.toMap());

  // Handle nested data for "creator" field.
  addCurrentUserStructData(
    firestoreData,
    recipe.hasCreator() ? recipe.creator : null,
    'creator',
    forFieldValue,
  );

  // Add any Firestore field values
  recipe.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getRecipeListFirestoreData(
  List<RecipeStruct>? recipes,
) =>
    recipes?.map((e) => getRecipeFirestoreData(e, true)).toList() ?? [];
