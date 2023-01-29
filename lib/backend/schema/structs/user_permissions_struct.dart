import 'dart:async';

import '../index.dart';
import '../serializers.dart';
import 'package:built_value/built_value.dart';

part 'user_permissions_struct.g.dart';

abstract class UserPermissionsStruct
    implements Built<UserPermissionsStruct, UserPermissionsStructBuilder> {
  static Serializer<UserPermissionsStruct> get serializer =>
      _$userPermissionsStructSerializer;

  @BuiltValueField(wireName: 'create_booking')
  bool? get createBooking;

  @BuiltValueField(wireName: 'read_booking')
  bool? get readBooking;

  @BuiltValueField(wireName: 'update_booking')
  bool? get updateBooking;

  @BuiltValueField(wireName: 'delete_booking')
  bool? get deleteBooking;

  @BuiltValueField(wireName: 'create_company')
  bool? get createCompany;

  @BuiltValueField(wireName: 'read_company')
  bool? get readCompany;

  @BuiltValueField(wireName: 'update_company')
  bool? get updateCompany;

  @BuiltValueField(wireName: 'delete_company')
  bool? get deleteCompany;

  /// Utility class for Firestore updates
  FirestoreUtilData get firestoreUtilData;

  static void _initializeBuilder(UserPermissionsStructBuilder builder) =>
      builder
        ..createBooking = false
        ..readBooking = false
        ..updateBooking = false
        ..deleteBooking = false
        ..createCompany = false
        ..readCompany = false
        ..updateCompany = false
        ..deleteCompany = false
        ..firestoreUtilData = FirestoreUtilData();

  UserPermissionsStruct._();
  factory UserPermissionsStruct(
          [void Function(UserPermissionsStructBuilder) updates]) =
      _$UserPermissionsStruct;
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
      (u) => u
        ..createBooking = createBooking
        ..readBooking = readBooking
        ..updateBooking = updateBooking
        ..deleteBooking = deleteBooking
        ..createCompany = createCompany
        ..readCompany = readCompany
        ..updateCompany = updateCompany
        ..deleteCompany = deleteCompany
        ..firestoreUtilData = FirestoreUtilData(
          clearUnsetFields: clearUnsetFields,
          create: create,
          delete: delete,
          fieldValues: fieldValues,
        ),
    );

UserPermissionsStruct? updateUserPermissionsStruct(
  UserPermissionsStruct? userPermissions, {
  bool clearUnsetFields = true,
}) =>
    userPermissions != null
        ? (userPermissions.toBuilder()
              ..firestoreUtilData =
                  FirestoreUtilData(clearUnsetFields: clearUnsetFields))
            .build()
        : null;

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
  if (!forFieldValue && userPermissions.firestoreUtilData.clearUnsetFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final userPermissionsData =
      getUserPermissionsFirestoreData(userPermissions, forFieldValue);
  final nestedData =
      userPermissionsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final create = userPermissions.firestoreUtilData.create;
  firestoreData.addAll(create ? mergeNestedFields(nestedData) : nestedData);

  return;
}

Map<String, dynamic> getUserPermissionsFirestoreData(
  UserPermissionsStruct? userPermissions, [
  bool forFieldValue = false,
]) {
  if (userPermissions == null) {
    return {};
  }
  final firestoreData = serializers.toFirestore(
      UserPermissionsStruct.serializer, userPermissions);

  // Add any Firestore field values
  userPermissions.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getUserPermissionsListFirestoreData(
  List<UserPermissionsStruct>? userPermissionss,
) =>
    userPermissionss
        ?.map((u) => getUserPermissionsFirestoreData(u, true))
        .toList() ??
    [];
