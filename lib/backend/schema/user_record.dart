import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserRecord extends FirestoreRecord {
  UserRecord._(
      DocumentReference reference,
      Map<String, dynamic> data,
      ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "role" field.
  String? _role;
  String get role => _role ?? '';
  bool hasRole() => _role != null;

  // "permissions" field.
  UserPermissionsStruct? _permissions;
  UserPermissionsStruct get permissions =>
      _permissions ?? UserPermissionsStruct();
  bool hasPermissions() => _permissions != null;

  // "favCompany" field.
  List<DocumentReference>? _favCompany;
  List<DocumentReference> get favCompany => _favCompany ?? const [];
  bool hasFavCompany() => _favCompany != null;

  // "search_history" field.
  List<DocumentReference>? _searchHistory;
  List<DocumentReference> get searchHistory => _searchHistory ?? const [];
  bool hasSearchHistory() => _searchHistory != null;

  // "carscount" field.
  int? _carscount;
  int get carscount => _carscount ?? 0;
  bool hasCarscount() => _carscount != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "text" field.
  int? _text;
  int get text => _text ?? 0;
  bool hasText() => _text != null;

  // "country" field.
  DocumentReference? _country;
  DocumentReference? get country => _country;
  bool hasCountry() => _country != null;

  // "country_text" field.
  String? _countryText;
  String get countryText => _countryText ?? '';
  bool hasCountryText() => _countryText != null;

  // "link_last_booking" field.
  DocumentReference? _linkLastBooking;
  DocumentReference? get linkLastBooking => _linkLastBooking;
  bool hasLinkLastBooking() => _linkLastBooking != null;

  // "last_booking_boolean" field.
  bool? _lastBookingBoolean;
  bool get lastBookingBoolean => _lastBookingBoolean ?? false;
  bool hasLastBookingBoolean() => _lastBookingBoolean != null;

  // "merchan_document" field.
  DocumentReference? _merchanDocument;
  DocumentReference? get merchanDocument => _merchanDocument;
  bool hasMerchanDocument() => _merchanDocument != null;

  // "firstCar" field.
  DocumentReference? _firstCar;
  DocumentReference? get firstCar => _firstCar;
  bool hasFirstCar() => _firstCar != null;

  // "sign_up_date" field.
  DateTime? _signUpDate;
  DateTime? get signUpDate => _signUpDate;
  bool hasSignUpDate() => _signUpDate != null;

  // "bookingCompanies" field.
  List<DocumentReference>? _bookingCompanies;
  List<DocumentReference> get bookingCompanies => _bookingCompanies ?? const [];
  bool hasBookingCompanies() => _bookingCompanies != null;

  // "firstCarBody" field.
  String? _firstCarBody;
  String get firstCarBody => _firstCarBody ?? '';
  bool hasFirstCarBody() => _firstCarBody != null;

  // "firstCarName" field.
  String? _firstCarName;
  String get firstCarName => _firstCarName ?? '';
  bool hasFirstCarName() => _firstCarName != null;

  // "admin_status" field.
  String? _adminStatus;
  String get adminStatus => _adminStatus ?? '';
  bool hasAdminStatus() => _adminStatus != null;

  // "createdByAdminCompanyRef" field.
  DocumentReference? _createdByAdminCompanyRef;
  DocumentReference? get createdByAdminCompanyRef => _createdByAdminCompanyRef;
  bool hasCreatedByAdminCompanyRef() => _createdByAdminCompanyRef != null;

  // "StuffID" field.
  String? _stuffID;
  String get stuffID => _stuffID ?? '';
  bool hasStuffID() => _stuffID != null;

  // "Added_company" field.
  bool? _addedCompany;
  bool get addedCompany => _addedCompany ?? false;
  bool hasAddedCompany() => _addedCompany != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _role = snapshotData['role'] as String?;
    _permissions =
        UserPermissionsStruct.maybeFromMap(snapshotData['permissions']);
    _favCompany = getDataList(snapshotData['favCompany']);
    _searchHistory = getDataList(snapshotData['search_history']);
    _carscount = castToType<int>(snapshotData['carscount']);
    _phoneNumber = snapshotData['phone_number'] as String?;
    _text = castToType<int>(snapshotData['text']);
    _country = snapshotData['country'] as DocumentReference?;
    _countryText = snapshotData['country_text'] as String?;
    _linkLastBooking = snapshotData['link_last_booking'] as DocumentReference?;
    _lastBookingBoolean = snapshotData['last_booking_boolean'] as bool?;
    _merchanDocument = snapshotData['merchan_document'] as DocumentReference?;
    _firstCar = snapshotData['firstCar'] as DocumentReference?;
    _signUpDate = snapshotData['sign_up_date'] as DateTime?;
    _bookingCompanies = getDataList(snapshotData['bookingCompanies']);
    _firstCarBody = snapshotData['firstCarBody'] as String?;
    _firstCarName = snapshotData['firstCarName'] as String?;
    _adminStatus = snapshotData['admin_status'] as String?;
    _createdByAdminCompanyRef =
    snapshotData['createdByAdminCompanyRef'] as DocumentReference?;
    _stuffID = snapshotData['StuffID'] as String?;
    _addedCompany = snapshotData['Added_company'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('user');

  static Stream<UserRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserRecord.fromSnapshot(s));

  static Future<UserRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UserRecord.fromSnapshot(s));

  static UserRecord fromSnapshot(DocumentSnapshot snapshot) => UserRecord._(
    snapshot.reference,
    mapFromFirestore(snapshot.data() as Map<String, dynamic>),
  );

  static UserRecord getDocumentFromData(
      Map<String, dynamic> data,
      DocumentReference reference,
      ) =>
      UserRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserRecord &&
          reference.path.hashCode == other.reference.path.hashCode;
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
  String? stuffID,
  bool? addedCompany,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'role': role,
      'permissions': UserPermissionsStruct().toMap(),
      'carscount': carscount,
      'phone_number': phoneNumber,
      'text': text,
      'country': country,
      'country_text': countryText,
      'link_last_booking': linkLastBooking,
      'last_booking_boolean': lastBookingBoolean,
      'merchan_document': merchanDocument,
      'firstCar': firstCar,
      'sign_up_date': signUpDate,
      'firstCarBody': firstCarBody,
      'firstCarName': firstCarName,
      'admin_status': adminStatus,
      'createdByAdminCompanyRef': createdByAdminCompanyRef,
      'StuffID': stuffID,
      'Added_company': addedCompany,
    }.withoutNulls,
  );

  // Handle nested data for "permissions" field.
  addUserPermissionsStructData(firestoreData, permissions, 'permissions');

  return firestoreData;
}

class UserRecordDocumentEquality implements Equality<UserRecord> {
  const UserRecordDocumentEquality();

  @override
  bool equals(UserRecord? e1, UserRecord? e2) {
    const listEquality = ListEquality();
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.role == e2?.role &&
        e1?.permissions == e2?.permissions &&
        listEquality.equals(e1?.favCompany, e2?.favCompany) &&
        listEquality.equals(e1?.searchHistory, e2?.searchHistory) &&
        e1?.carscount == e2?.carscount &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.text == e2?.text &&
        e1?.country == e2?.country &&
        e1?.countryText == e2?.countryText &&
        e1?.linkLastBooking == e2?.linkLastBooking &&
        e1?.lastBookingBoolean == e2?.lastBookingBoolean &&
        e1?.merchanDocument == e2?.merchanDocument &&
        e1?.firstCar == e2?.firstCar &&
        e1?.signUpDate == e2?.signUpDate &&
        listEquality.equals(e1?.bookingCompanies, e2?.bookingCompanies) &&
        e1?.firstCarBody == e2?.firstCarBody &&
        e1?.firstCarName == e2?.firstCarName &&
        e1?.adminStatus == e2?.adminStatus &&
        e1?.createdByAdminCompanyRef == e2?.createdByAdminCompanyRef &&
        e1?.stuffID == e2?.stuffID &&
        e1?.addedCompany == e2?.addedCompany;
  }

  @override
  int hash(UserRecord? e) => const ListEquality().hash([
    e?.email,
    e?.displayName,
    e?.photoUrl,
    e?.uid,
    e?.createdTime,
    e?.role,
    e?.permissions,
    e?.favCompany,
    e?.searchHistory,
    e?.carscount,
    e?.phoneNumber,
    e?.text,
    e?.country,
    e?.countryText,
    e?.linkLastBooking,
    e?.lastBookingBoolean,
    e?.merchanDocument,
    e?.firstCar,
    e?.signUpDate,
    e?.bookingCompanies,
    e?.firstCarBody,
    e?.firstCarName,
    e?.adminStatus,
    e?.createdByAdminCompanyRef,
    e?.stuffID,
    e?.addedCompany
  ]);

  @override
  bool isValidKey(Object? o) => o is UserRecord;
}
