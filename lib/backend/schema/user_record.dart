import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'user_record.g.dart';

abstract class UserRecord implements Built<UserRecord, UserRecordBuilder> {
  static Serializer<UserRecord> get serializer => _$userRecordSerializer;

  String? get email;

  @BuiltValueField(wireName: 'display_name')
  String? get displayName;

  @BuiltValueField(wireName: 'photo_url')
  String? get photoUrl;

  String? get uid;

  @BuiltValueField(wireName: 'created_time')
  DateTime? get createdTime;

  String? get role;

  UserPermissionsStruct get permissions;

  BuiltList<DocumentReference>? get favCompany;

  @BuiltValueField(wireName: 'search_history')
  BuiltList<DocumentReference>? get searchHistory;

  int? get carscount;

  @BuiltValueField(wireName: 'phone_number')
  String? get phoneNumber;

  int? get text;

  DocumentReference? get country;

  @BuiltValueField(wireName: 'country_text')
  String? get countryText;

  @BuiltValueField(wireName: 'link_last_booking')
  DocumentReference? get linkLastBooking;

  @BuiltValueField(wireName: 'last_booking_boolean')
  bool? get lastBookingBoolean;

  @BuiltValueField(wireName: 'merchan_document')
  DocumentReference? get merchanDocument;

  DocumentReference? get firstCar;

  @BuiltValueField(wireName: 'sign_up_date')
  DateTime? get signUpDate;

  BuiltList<DocumentReference>? get bookingCompanies;

  String? get firstCarBody;

  String? get firstCarName;

  @BuiltValueField(wireName: 'admin_status')
  String? get adminStatus;

  DocumentReference? get createdByAdminCompanyRef;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(UserRecordBuilder builder) => builder
    ..email = ''
    ..displayName = ''
    ..photoUrl = ''
    ..uid = ''
    ..role = ''
    ..permissions = UserPermissionsStructBuilder()
    ..favCompany = ListBuilder()
    ..searchHistory = ListBuilder()
    ..carscount = 0
    ..phoneNumber = ''
    ..text = 0
    ..countryText = ''
    ..lastBookingBoolean = false
    ..bookingCompanies = ListBuilder()
    ..firstCarBody = ''
    ..firstCarName = ''
    ..adminStatus = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('user');

  static Stream<UserRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<UserRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  UserRecord._();
  factory UserRecord([void Function(UserRecordBuilder) updates]) = _$UserRecord;

  static UserRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createUserRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? role,
  UserPermissionsStruct? permissions,
  int? carscount,
  String? phoneNumber,
  int? text,
  DocumentReference? country,
  String? countryText,
  DocumentReference? linkLastBooking,
  bool? lastBookingBoolean,
  DocumentReference? merchanDocument,
  DocumentReference? firstCar,
  DateTime? signUpDate,
  String? firstCarBody,
  String? firstCarName,
  String? adminStatus,
  DocumentReference? createdByAdminCompanyRef,
}) {
  final firestoreData = serializers.toFirestore(
    UserRecord.serializer,
    UserRecord(
      (u) => u
        ..email = email
        ..displayName = displayName
        ..photoUrl = photoUrl
        ..uid = uid
        ..createdTime = createdTime
        ..role = role
        ..permissions = UserPermissionsStructBuilder()
        ..favCompany = null
        ..searchHistory = null
        ..carscount = carscount
        ..phoneNumber = phoneNumber
        ..text = text
        ..country = country
        ..countryText = countryText
        ..linkLastBooking = linkLastBooking
        ..lastBookingBoolean = lastBookingBoolean
        ..merchanDocument = merchanDocument
        ..firstCar = firstCar
        ..signUpDate = signUpDate
        ..bookingCompanies = null
        ..firstCarBody = firstCarBody
        ..firstCarName = firstCarName
        ..adminStatus = adminStatus
        ..createdByAdminCompanyRef = createdByAdminCompanyRef,
    ),
  );

  // Handle nested data for "permissions" field.
  addUserPermissionsStructData(firestoreData, permissions, 'permissions');

  return firestoreData;
}
