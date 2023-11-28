import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BookingsRecord extends FirestoreRecord {
  BookingsRecord._(
      DocumentReference reference,
      Map<String, dynamic> data,
      ) : super(reference, data) {
    _initializeFields();
  }

  // "booked_user" field.
  DocumentReference? _bookedUser;
  DocumentReference? get bookedUser => _bookedUser;
  bool hasBookedUser() => _bookedUser != null;

  // "booked_company" field.
  DocumentReference? _bookedCompany;
  DocumentReference? get bookedCompany => _bookedCompany;
  bool hasBookedCompany() => _bookedCompany != null;

  // "time_name" field.
  String? _timeName;
  String get timeName => _timeName ?? '';
  bool hasTimeName() => _timeName != null;

  // "time_order" field.
  int? _timeOrder;
  int get timeOrder => _timeOrder ?? 0;
  bool hasTimeOrder() => _timeOrder != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "booked_date" field.
  DateTime? _bookedDate;
  DateTime? get bookedDate => _bookedDate;
  bool hasBookedDate() => _bookedDate != null;

  // "selected_company_services" field.
  List<DocumentReference>? _selectedCompanyServices;
  List<DocumentReference> get selectedCompanyServices =>
      _selectedCompanyServices ?? const [];
  bool hasSelectedCompanyServices() => _selectedCompanyServices != null;

  // "car_body" field.
  String? _carBody;
  String get carBody => _carBody ?? '';
  bool hasCarBody() => _carBody != null;

  // "car_name" field.
  String? _carName;
  String get carName => _carName ?? '';
  bool hasCarName() => _carName != null;

  // "car_order" field.
  int? _carOrder;
  int get carOrder => _carOrder ?? 0;
  bool hasCarOrder() => _carOrder != null;

  // "cancel_why" field.
  String? _cancelWhy;
  String get cancelWhy => _cancelWhy ?? '';
  bool hasCancelWhy() => _cancelWhy != null;

  // "cancel_comment" field.
  String? _cancelComment;
  String get cancelComment => _cancelComment ?? '';
  bool hasCancelComment() => _cancelComment != null;

  // "cancel_time_date" field.
  DateTime? _cancelTimeDate;
  DateTime? get cancelTimeDate => _cancelTimeDate;
  bool hasCancelTimeDate() => _cancelTimeDate != null;

  // "ID" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  // "duration" field.
  double? _duration;
  double get duration => _duration ?? 0.0;
  bool hasDuration() => _duration != null;

  // "total_price" field.
  int? _totalPrice;
  int get totalPrice => _totalPrice ?? 0;
  bool hasTotalPrice() => _totalPrice != null;

  // "notify_time_name" field.
  DateTime? _notifyTimeName;
  DateTime? get notifyTimeName => _notifyTimeName;
  bool hasNotifyTimeName() => _notifyTimeName != null;

  // "selected_times_order" field.
  List<int>? _selectedTimesOrder;
  List<int> get selectedTimesOrder => _selectedTimesOrder ?? const [];
  bool hasSelectedTimesOrder() => _selectedTimesOrder != null;

  // "cancelled" field.
  bool? _cancelled;
  bool get cancelled => _cancelled ?? false;
  bool hasCancelled() => _cancelled != null;

  // "booked_company_document" field.
  DocumentReference? _bookedCompanyDocument;
  DocumentReference? get bookedCompanyDocument => _bookedCompanyDocument;
  bool hasBookedCompanyDocument() => _bookedCompanyDocument != null;

  // "selected_company_services_name" field.
  List<String>? _selectedCompanyServicesName;
  List<String> get selectedCompanyServicesName =>
      _selectedCompanyServicesName ?? const [];
  bool hasSelectedCompanyServicesName() => _selectedCompanyServicesName != null;

  // "booked_date_string" field.
  String? _bookedDateString;
  String get bookedDateString => _bookedDateString ?? '';
  bool hasBookedDateString() => _bookedDateString != null;

  // "boxName" field.
  String? _boxName;
  String get boxName => _boxName ?? '';
  bool hasBoxName() => _boxName != null;

  // "forCarPay" field.
  double? _forCarPay;
  double get forCarPay => _forCarPay ?? 0.0;
  bool hasForCarPay() => _forCarPay != null;

  // "createdByUser" field.
  bool? _createdByUser;
  bool get createdByUser => _createdByUser ?? false;
  bool hasCreatedByUser() => _createdByUser != null;

  // "createdByAdmin" field.
  bool? _createdByAdmin;
  bool get createdByAdmin => _createdByAdmin ?? false;
  bool hasCreatedByAdmin() => _createdByAdmin != null;

  // "createdAdminUserName" field.
  String? _createdAdminUserName;
  String get createdAdminUserName => _createdAdminUserName ?? '';
  bool hasCreatedAdminUserName() => _createdAdminUserName != null;

  // "opened_super_admin" field.
  bool? _openedSuperAdmin;
  bool get openedSuperAdmin => _openedSuperAdmin ?? false;
  bool hasOpenedSuperAdmin() => _openedSuperAdmin != null;

  void _initializeFields() {
    _bookedUser = snapshotData['booked_user'] as DocumentReference?;
    _bookedCompany = snapshotData['booked_company'] as DocumentReference?;
    _timeName = snapshotData['time_name'] as String?;
    _timeOrder = castToType<int>(snapshotData['time_order']);
    _status = snapshotData['status'] as String?;
    _bookedDate = snapshotData['booked_date'] as DateTime?;
    _selectedCompanyServices =
        getDataList(snapshotData['selected_company_services']);
    _carBody = snapshotData['car_body'] as String?;
    _carName = snapshotData['car_name'] as String?;
    _carOrder = castToType<int>(snapshotData['car_order']);
    _cancelWhy = snapshotData['cancel_why'] as String?;
    _cancelComment = snapshotData['cancel_comment'] as String?;
    _cancelTimeDate = snapshotData['cancel_time_date'] as DateTime?;
    _id = snapshotData['ID'] as String?;
    _duration = castToType<double>(snapshotData['duration']);
    _totalPrice = castToType<int>(snapshotData['total_price']);
    _notifyTimeName = snapshotData['notify_time_name'] as DateTime?;
    _selectedTimesOrder = getDataList(snapshotData['selected_times_order']);
    _cancelled = snapshotData['cancelled'] as bool?;
    _bookedCompanyDocument =
    snapshotData['booked_company_document'] as DocumentReference?;
    _selectedCompanyServicesName =
        getDataList(snapshotData['selected_company_services_name']);
    _bookedDateString = snapshotData['booked_date_string'] as String?;
    _boxName = snapshotData['boxName'] as String?;
    _forCarPay = castToType<double>(snapshotData['forCarPay']);
    _createdByUser = snapshotData['createdByUser'] as bool?;
    _createdByAdmin = snapshotData['createdByAdmin'] as bool?;
    _createdAdminUserName = snapshotData['createdAdminUserName'] as String?;
    _openedSuperAdmin = snapshotData['opened_super_admin'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('bookings');

  static Stream<BookingsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BookingsRecord.fromSnapshot(s));

  static Future<BookingsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BookingsRecord.fromSnapshot(s));

  static BookingsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      BookingsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BookingsRecord getDocumentFromData(
      Map<String, dynamic> data,
      DocumentReference reference,
      ) =>
      BookingsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BookingsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BookingsRecord &&
          reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBookingsRecordData({
  DocumentReference? bookedUser,
  DocumentReference? bookedCompany,
  String? timeName,
  int? timeOrder,
  String? status,
  DateTime? bookedDate,
  String? carBody,
  String? carName,
  int? carOrder,
  String? cancelWhy,
  String? cancelComment,
  DateTime? cancelTimeDate,
  String? id,
  double? duration,
  int? totalPrice,
  DateTime? notifyTimeName,
  bool? cancelled,
  DocumentReference? bookedCompanyDocument,
  String? bookedDateString,
  String? boxName,
  double? forCarPay,
  bool? createdByUser,
  bool? createdByAdmin,
  String? createdAdminUserName,
  bool? openedSuperAdmin,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'booked_user': bookedUser,
      'booked_company': bookedCompany,
      'time_name': timeName,
      'time_order': timeOrder,
      'status': status,
      'booked_date': bookedDate,
      'car_body': carBody,
      'car_name': carName,
      'car_order': carOrder,
      'cancel_why': cancelWhy,
      'cancel_comment': cancelComment,
      'cancel_time_date': cancelTimeDate,
      'ID': id,
      'duration': duration,
      'total_price': totalPrice,
      'notify_time_name': notifyTimeName,
      'cancelled': cancelled,
      'booked_company_document': bookedCompanyDocument,
      'booked_date_string': bookedDateString,
      'boxName': boxName,
      'forCarPay': forCarPay,
      'createdByUser': createdByUser,
      'createdByAdmin': createdByAdmin,
      'createdAdminUserName': createdAdminUserName,
      'opened_super_admin': openedSuperAdmin,
    }.withoutNulls,
  );

  return firestoreData;
}

class BookingsRecordDocumentEquality implements Equality<BookingsRecord> {
  const BookingsRecordDocumentEquality();

  @override
  bool equals(BookingsRecord? e1, BookingsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.bookedUser == e2?.bookedUser &&
        e1?.bookedCompany == e2?.bookedCompany &&
        e1?.timeName == e2?.timeName &&
        e1?.timeOrder == e2?.timeOrder &&
        e1?.status == e2?.status &&
        e1?.bookedDate == e2?.bookedDate &&
        listEquality.equals(
            e1?.selectedCompanyServices, e2?.selectedCompanyServices) &&
        e1?.carBody == e2?.carBody &&
        e1?.carName == e2?.carName &&
        e1?.carOrder == e2?.carOrder &&
        e1?.cancelWhy == e2?.cancelWhy &&
        e1?.cancelComment == e2?.cancelComment &&
        e1?.cancelTimeDate == e2?.cancelTimeDate &&
        e1?.id == e2?.id &&
        e1?.duration == e2?.duration &&
        e1?.totalPrice == e2?.totalPrice &&
        e1?.notifyTimeName == e2?.notifyTimeName &&
        listEquality.equals(e1?.selectedTimesOrder, e2?.selectedTimesOrder) &&
        e1?.cancelled == e2?.cancelled &&
        e1?.bookedCompanyDocument == e2?.bookedCompanyDocument &&
        listEquality.equals(
            e1?.selectedCompanyServicesName, e2?.selectedCompanyServicesName) &&
        e1?.bookedDateString == e2?.bookedDateString &&
        e1?.boxName == e2?.boxName &&
        e1?.forCarPay == e2?.forCarPay &&
        e1?.createdByUser == e2?.createdByUser &&
        e1?.createdByAdmin == e2?.createdByAdmin &&
        e1?.createdAdminUserName == e2?.createdAdminUserName &&
        e1?.openedSuperAdmin == e2?.openedSuperAdmin;
  }

  @override
  int hash(BookingsRecord? e) => const ListEquality().hash([
    e?.bookedUser,
    e?.bookedCompany,
    e?.timeName,
    e?.timeOrder,
    e?.status,
    e?.bookedDate,
    e?.selectedCompanyServices,
    e?.carBody,
    e?.carName,
    e?.carOrder,
    e?.cancelWhy,
    e?.cancelComment,
    e?.cancelTimeDate,
    e?.id,
    e?.duration,
    e?.totalPrice,
    e?.notifyTimeName,
    e?.selectedTimesOrder,
    e?.cancelled,
    e?.bookedCompanyDocument,
    e?.selectedCompanyServicesName,
    e?.bookedDateString,
    e?.boxName,
    e?.forCarPay,
    e?.createdByUser,
    e?.createdByAdmin,
    e?.createdAdminUserName,
    e?.openedSuperAdmin
  ]);

  @override
  bool isValidKey(Object? o) => o is BookingsRecord;
}
