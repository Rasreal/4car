// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserPermissionsStruct extends FFFirebaseStruct {
  UserPermissionsStruct({
    bool? createBooking,
    bool? readBooking,
    bool? updateBooking,
    bool? deleteBooking,
    bool? createCompany,
    bool? readCompany,
    bool? updateCompany,
    bool? deleteCompany,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _createBooking = createBooking,
        _readBooking = readBooking,
        _updateBooking = updateBooking,
        _deleteBooking = deleteBooking,
        _createCompany = createCompany,
        _readCompany = readCompany,
        _updateCompany = updateCompany,
        _deleteCompany = deleteCompany,
        super(firestoreUtilData);

  // "create_booking" field.
  bool? _createBooking;
  bool get createBooking => _createBooking ?? false;
  set createBooking(bool? val) => _createBooking = val;
  bool hasCreateBooking() => _createBooking != null;

  // "read_booking" field.
  bool? _readBooking;
  bool get readBooking => _readBooking ?? false;
  set readBooking(bool? val) => _readBooking = val;
  bool hasReadBooking() => _readBooking != null;

  // "update_booking" field.
  bool? _updateBooking;
  bool get updateBooking => _updateBooking ?? false;
  set updateBooking(bool? val) => _updateBooking = val;
  bool hasUpdateBooking() => _updateBooking != null;

  // "delete_booking" field.
  bool? _deleteBooking;
  bool get deleteBooking => _deleteBooking ?? false;
  set deleteBooking(bool? val) => _deleteBooking = val;
  bool hasDeleteBooking() => _deleteBooking != null;

  // "create_company" field.
  bool? _createCompany;
  bool get createCompany => _createCompany ?? false;
  set createCompany(bool? val) => _createCompany = val;
  bool hasCreateCompany() => _createCompany != null;

  // "read_company" field.
  bool? _readCompany;
  bool get readCompany => _readCompany ?? false;
  set readCompany(bool? val) => _readCompany = val;
  bool hasReadCompany() => _readCompany != null;

  // "update_company" field.
  bool? _updateCompany;
  bool get updateCompany => _updateCompany ?? false;
  set updateCompany(bool? val) => _updateCompany = val;
  bool hasUpdateCompany() => _updateCompany != null;

  // "delete_company" field.
  bool? _deleteCompany;
  bool get deleteCompany => _deleteCompany ?? false;
  set deleteCompany(bool? val) => _deleteCompany = val;
  bool hasDeleteCompany() => _deleteCompany != null;

  static UserPermissionsStruct fromMap(Map<String, dynamic> data) =>
      UserPermissionsStruct(
        createBooking: data['create_booking'] as bool?,
        readBooking: data['read_booking'] as bool?,
        updateBooking: data['update_booking'] as bool?,
        deleteBooking: data['delete_booking'] as bool?,
        createCompany: data['create_company'] as bool?,
        readCompany: data['read_company'] as bool?,
        updateCompany: data['update_company'] as bool?,
        deleteCompany: data['delete_company'] as bool?,
      );

  static UserPermissionsStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? UserPermissionsStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'create_booking': _createBooking,
        'read_booking': _readBooking,
        'update_booking': _updateBooking,
        'delete_booking': _deleteBooking,
        'create_company': _createCompany,
        'read_company': _readCompany,
        'update_company': _updateCompany,
        'delete_company': _deleteCompany,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'create_booking': serializeParam(
          _createBooking,
          ParamType.bool,
        ),
        'read_booking': serializeParam(
          _readBooking,
          ParamType.bool,
        ),
        'update_booking': serializeParam(
          _updateBooking,
          ParamType.bool,
        ),
        'delete_booking': serializeParam(
          _deleteBooking,
          ParamType.bool,
        ),
        'create_company': serializeParam(
          _createCompany,
          ParamType.bool,
        ),
        'read_company': serializeParam(
          _readCompany,
          ParamType.bool,
        ),
        'update_company': serializeParam(
          _updateCompany,
          ParamType.bool,
        ),
        'delete_company': serializeParam(
          _deleteCompany,
          ParamType.bool,
        ),
      }.withoutNulls;

  static UserPermissionsStruct fromSerializableMap(Map<String, dynamic> data) =>
      UserPermissionsStruct(
        createBooking: deserializeParam(
          data['create_booking'],
          ParamType.bool,
          false,
        ),
        readBooking: deserializeParam(
          data['read_booking'],
          ParamType.bool,
          false,
        ),
        updateBooking: deserializeParam(
          data['update_booking'],
          ParamType.bool,
          false,
        ),
        deleteBooking: deserializeParam(
          data['delete_booking'],
          ParamType.bool,
          false,
        ),
        createCompany: deserializeParam(
          data['create_company'],
          ParamType.bool,
          false,
        ),
        readCompany: deserializeParam(
          data['read_company'],
          ParamType.bool,
          false,
        ),
        updateCompany: deserializeParam(
          data['update_company'],
          ParamType.bool,
          false,
        ),
        deleteCompany: deserializeParam(
          data['delete_company'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'UserPermissionsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UserPermissionsStruct &&
        createBooking == other.createBooking &&
        readBooking == other.readBooking &&
        updateBooking == other.updateBooking &&
        deleteBooking == other.deleteBooking &&
        createCompany == other.createCompany &&
        readCompany == other.readCompany &&
        updateCompany == other.updateCompany &&
        deleteCompany == other.deleteCompany;
  }

  @override
  int get hashCode => const ListEquality().hash([
        createBooking,
        readBooking,
        updateBooking,
        deleteBooking,
        createCompany,
        readCompany,
        updateCompany,
        deleteCompany
      ]);
}

UserPermissionsStruct createUserPermissionsStruct({
  bool? createBooking,
  bool? readBooking,
  bool? updateBooking,
  bool? deleteBooking,
  bool? createCompany,
  bool? readCompany,
  bool? updateCompany,
  bool? deleteCompany,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    UserPermissionsStruct(
      createBooking: createBooking,
      readBooking: readBooking,
      updateBooking: updateBooking,
      deleteBooking: deleteBooking,
      createCompany: createCompany,
      readCompany: readCompany,
      updateCompany: updateCompany,
      deleteCompany: deleteCompany,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

UserPermissionsStruct? updateUserPermissionsStruct(
  UserPermissionsStruct? userPermissions, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    userPermissions
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addUserPermissionsStructData(
  Map<String, dynamic> firestoreData,
  UserPermissionsStruct? userPermissions,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (userPermissions == null) {
    return;
  }
  if (userPermissions.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && userPermissions.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final userPermissionsData =
      getUserPermissionsFirestoreData(userPermissions, forFieldValue);
  final nestedData =
      userPermissionsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = userPermissions.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getUserPermissionsFirestoreData(
  UserPermissionsStruct? userPermissions, [
  bool forFieldValue = false,
]) {
  if (userPermissions == null) {
    return {};
  }
  final firestoreData = mapToFirestore(userPermissions.toMap());

  // Add any Firestore field values
  userPermissions.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getUserPermissionsListFirestoreData(
  List<UserPermissionsStruct>? userPermissionss,
) =>
    userPermissionss
        ?.map((e) => getUserPermissionsFirestoreData(e, true))
        .toList() ??
    [];
