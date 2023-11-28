import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CompaniesRecord extends FirestoreRecord {
  CompaniesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "rating" field.
  List<double>? _rating;
  List<double> get rating => _rating ?? const [];
  bool hasRating() => _rating != null;

  // "location" field.
  LatLng? _location;
  LatLng? get location => _location;
  bool hasLocation() => _location != null;

  // "logo" field.
  String? _logo;
  String get logo => _logo ?? '';
  bool hasLogo() => _logo != null;

  // "city" field.
  String? _city;
  String get city => _city ?? '';
  bool hasCity() => _city != null;

  // "street" field.
  String? _street;
  String get street => _street ?? '';
  bool hasStreet() => _street != null;

  // "address_2GIS" field.
  String? _address2GIS;
  String get address2GIS => _address2GIS ?? '';
  bool hasAddress2GIS() => _address2GIS != null;

  // "admin_created_by" field.
  DocumentReference? _adminCreatedBy;
  DocumentReference? get adminCreatedBy => _adminCreatedBy;
  bool hasAdminCreatedBy() => _adminCreatedBy != null;

  // "conveniences" field.
  String? _conveniences;
  String get conveniences => _conveniences ?? '';
  bool hasConveniences() => _conveniences != null;

  // "count_box" field.
  int? _countBox;
  int get countBox => _countBox ?? 0;
  bool hasCountBox() => _countBox != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "too_name" field.
  String? _tooName;
  String get tooName => _tooName ?? '';
  bool hasTooName() => _tooName != null;

  // "bin_iin" field.
  int? _binIin;
  int get binIin => _binIin ?? 0;
  bool hasBinIin() => _binIin != null;

  // "iban" field.
  String? _iban;
  String get iban => _iban ?? '';
  bool hasIban() => _iban != null;

  // "fio_admin" field.
  String? _fioAdmin;
  String get fioAdmin => _fioAdmin ?? '';
  bool hasFioAdmin() => _fioAdmin != null;

  // "date_dogovor" field.
  DateTime? _dateDogovor;
  DateTime? get dateDogovor => _dateDogovor;
  bool hasDateDogovor() => _dateDogovor != null;

  // "dogovor_pdf" field.
  String? _dogovorPdf;
  String get dogovorPdf => _dogovorPdf ?? '';
  bool hasDogovorPdf() => _dogovorPdf != null;

  // "link_city" field.
  DocumentReference? _linkCity;
  DocumentReference? get linkCity => _linkCity;
  bool hasLinkCity() => _linkCity != null;

  // "phone_num" field.
  String? _phoneNum;
  String get phoneNum => _phoneNum ?? '';
  bool hasPhoneNum() => _phoneNum != null;

  // "open_time" field.
  String? _openTime;
  String get openTime => _openTime ?? '';
  bool hasOpenTime() => _openTime != null;

  // "close_time" field.
  String? _closeTime;
  String get closeTime => _closeTime ?? '';
  bool hasCloseTime() => _closeTime != null;

  // "open_time_order" field.
  int? _openTimeOrder;
  int get openTimeOrder => _openTimeOrder ?? 0;
  bool hasOpenTimeOrder() => _openTimeOrder != null;

  // "closed_time_order" field.
  int? _closedTimeOrder;
  int get closedTimeOrder => _closedTimeOrder ?? 0;
  bool hasClosedTimeOrder() => _closedTimeOrder != null;

  // "company_document" field.
  DocumentReference? _companyDocument;
  DocumentReference? get companyDocument => _companyDocument;
  bool hasCompanyDocument() => _companyDocument != null;

  // "forCarPercent" field.
  double? _forCarPercent;
  double get forCarPercent => _forCarPercent ?? 0.0;
  bool hasForCarPercent() => _forCarPercent != null;

  // "count_box_string" field.
  List<String>? _countBoxString;
  List<String> get countBoxString => _countBoxString ?? const [];
  bool hasCountBoxString() => _countBoxString != null;

  // "company_users" field.
  List<DocumentReference>? _companyUsers;
  List<DocumentReference> get companyUsers => _companyUsers ?? const [];
  bool hasCompanyUsers() => _companyUsers != null;

  // "num_dogovor" field.
  String? _numDogovor;
  String get numDogovor => _numDogovor ?? '';
  bool hasNumDogovor() => _numDogovor != null;

  // "address_google_map" field.
  String? _addressGoogleMap;
  String get addressGoogleMap => _addressGoogleMap ?? '';
  bool hasAddressGoogleMap() => _addressGoogleMap != null;

  // "address_yandex_map" field.
  String? _addressYandexMap;
  String get addressYandexMap => _addressYandexMap ?? '';
  bool hasAddressYandexMap() => _addressYandexMap != null;

  // "ref" field.
  String? _ref;
  String get ref => _ref ?? '';
  bool hasRef() => _ref != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _rating = getDataList(snapshotData['rating']);
    _location = snapshotData['location'] as LatLng?;
    _logo = snapshotData['logo'] as String?;
    _city = snapshotData['city'] as String?;
    _street = snapshotData['street'] as String?;
    _address2GIS = snapshotData['address_2GIS'] as String?;
    _adminCreatedBy = snapshotData['admin_created_by'] as DocumentReference?;
    _conveniences = snapshotData['conveniences'] as String?;
    _countBox = castToType<int>(snapshotData['count_box']);
    _status = snapshotData['status'] as String?;
    _tooName = snapshotData['too_name'] as String?;
    _binIin = castToType<int>(snapshotData['bin_iin']);
    _iban = snapshotData['iban'] as String?;
    _fioAdmin = snapshotData['fio_admin'] as String?;
    _dateDogovor = snapshotData['date_dogovor'] as DateTime?;
    _dogovorPdf = snapshotData['dogovor_pdf'] as String?;
    _linkCity = snapshotData['link_city'] as DocumentReference?;
    _phoneNum = snapshotData['phone_num'] as String?;
    _openTime = snapshotData['open_time'] as String?;
    _closeTime = snapshotData['close_time'] as String?;
    _openTimeOrder = castToType<int>(snapshotData['open_time_order']);
    _closedTimeOrder = castToType<int>(snapshotData['closed_time_order']);
    _companyDocument = snapshotData['company_document'] as DocumentReference?;
    _forCarPercent = castToType<double>(snapshotData['forCarPercent']);
    _countBoxString = getDataList(snapshotData['count_box_string']);
    _companyUsers = getDataList(snapshotData['company_users']);
    _numDogovor = snapshotData['num_dogovor'] as String?;
    _addressGoogleMap = snapshotData['address_google_map'] as String?;
    _addressYandexMap = snapshotData['address_yandex_map'] as String?;
    _ref = snapshotData['ref'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('companies');

  static Stream<CompaniesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CompaniesRecord.fromSnapshot(s));

  static Future<CompaniesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CompaniesRecord.fromSnapshot(s));

  static CompaniesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CompaniesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CompaniesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CompaniesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CompaniesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CompaniesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCompaniesRecordData({
  String? name,
  LatLng? location,
  String? logo,
  String? city,
  String? street,
  String? address2GIS,
  DocumentReference? adminCreatedBy,
  String? conveniences,
  int? countBox,
  String? status,
  String? tooName,
  int? binIin,
  String? iban,
  String? fioAdmin,
  DateTime? dateDogovor,
  String? dogovorPdf,
  DocumentReference? linkCity,
  String? phoneNum,
  String? openTime,
  String? closeTime,
  int? openTimeOrder,
  int? closedTimeOrder,
  DocumentReference? companyDocument,
  double? forCarPercent,
  String? numDogovor,
  String? addressGoogleMap,
  String? addressYandexMap,
  String? ref,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'location': location,
      'logo': logo,
      'city': city,
      'street': street,
      'address_2GIS': address2GIS,
      'admin_created_by': adminCreatedBy,
      'conveniences': conveniences,
      'count_box': countBox,
      'status': status,
      'too_name': tooName,
      'bin_iin': binIin,
      'iban': iban,
      'fio_admin': fioAdmin,
      'date_dogovor': dateDogovor,
      'dogovor_pdf': dogovorPdf,
      'link_city': linkCity,
      'phone_num': phoneNum,
      'open_time': openTime,
      'close_time': closeTime,
      'open_time_order': openTimeOrder,
      'closed_time_order': closedTimeOrder,
      'company_document': companyDocument,
      'forCarPercent': forCarPercent,
      'num_dogovor': numDogovor,
      'address_google_map': addressGoogleMap,
      'address_yandex_map': addressYandexMap,
      'ref': ref,
    }.withoutNulls,
  );

  return firestoreData;
}

class CompaniesRecordDocumentEquality implements Equality<CompaniesRecord> {
  const CompaniesRecordDocumentEquality();

  @override
  bool equals(CompaniesRecord? e1, CompaniesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        listEquality.equals(e1?.rating, e2?.rating) &&
        e1?.location == e2?.location &&
        e1?.logo == e2?.logo &&
        e1?.city == e2?.city &&
        e1?.street == e2?.street &&
        e1?.address2GIS == e2?.address2GIS &&
        e1?.adminCreatedBy == e2?.adminCreatedBy &&
        e1?.conveniences == e2?.conveniences &&
        e1?.countBox == e2?.countBox &&
        e1?.status == e2?.status &&
        e1?.tooName == e2?.tooName &&
        e1?.binIin == e2?.binIin &&
        e1?.iban == e2?.iban &&
        e1?.fioAdmin == e2?.fioAdmin &&
        e1?.dateDogovor == e2?.dateDogovor &&
        e1?.dogovorPdf == e2?.dogovorPdf &&
        e1?.linkCity == e2?.linkCity &&
        e1?.phoneNum == e2?.phoneNum &&
        e1?.openTime == e2?.openTime &&
        e1?.closeTime == e2?.closeTime &&
        e1?.openTimeOrder == e2?.openTimeOrder &&
        e1?.closedTimeOrder == e2?.closedTimeOrder &&
        e1?.companyDocument == e2?.companyDocument &&
        e1?.forCarPercent == e2?.forCarPercent &&
        listEquality.equals(e1?.countBoxString, e2?.countBoxString) &&
        listEquality.equals(e1?.companyUsers, e2?.companyUsers) &&
        e1?.numDogovor == e2?.numDogovor &&
        e1?.addressGoogleMap == e2?.addressGoogleMap &&
        e1?.addressYandexMap == e2?.addressYandexMap &&
        e1?.ref == e2?.ref;
  }

  @override
  int hash(CompaniesRecord? e) => const ListEquality().hash([
        e?.name,
        e?.rating,
        e?.location,
        e?.logo,
        e?.city,
        e?.street,
        e?.address2GIS,
        e?.adminCreatedBy,
        e?.conveniences,
        e?.countBox,
        e?.status,
        e?.tooName,
        e?.binIin,
        e?.iban,
        e?.fioAdmin,
        e?.dateDogovor,
        e?.dogovorPdf,
        e?.linkCity,
        e?.phoneNum,
        e?.openTime,
        e?.closeTime,
        e?.openTimeOrder,
        e?.closedTimeOrder,
        e?.companyDocument,
        e?.forCarPercent,
        e?.countBoxString,
        e?.companyUsers,
        e?.numDogovor,
        e?.addressGoogleMap,
        e?.addressYandexMap,
        e?.ref
      ]);

  @override
  bool isValidKey(Object? o) => o is CompaniesRecord;
}
