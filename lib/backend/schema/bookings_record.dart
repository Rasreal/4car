import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'bookings_record.g.dart';

abstract class BookingsRecord
    implements Built<BookingsRecord, BookingsRecordBuilder> {
  static Serializer<BookingsRecord> get serializer =>
      _$bookingsRecordSerializer;

  @BuiltValueField(wireName: 'booked_user')
  DocumentReference? get bookedUser;

  @BuiltValueField(wireName: 'booked_company')
  DocumentReference? get bookedCompany;

  @BuiltValueField(wireName: 'time_name')
  String? get timeName;

  @BuiltValueField(wireName: 'time_order')
  int? get timeOrder;

  String? get status;

  @BuiltValueField(wireName: 'booked_date')
  DateTime? get bookedDate;

  @BuiltValueField(wireName: 'selected_company_services')
  BuiltList<DocumentReference>? get selectedCompanyServices;

  @BuiltValueField(wireName: 'car_body')
  String? get carBody;

  @BuiltValueField(wireName: 'car_name')
  String? get carName;

  @BuiltValueField(wireName: 'car_order')
  int? get carOrder;

  @BuiltValueField(wireName: 'cancel_why')
  String? get cancelWhy;

  @BuiltValueField(wireName: 'cancel_comment')
  String? get cancelComment;

  @BuiltValueField(wireName: 'cancel_time_date')
  DateTime? get cancelTimeDate;

  @BuiltValueField(wireName: 'ID')
  String? get id;

  double? get duration;

  @BuiltValueField(wireName: 'total_price')
  int? get totalPrice;

  @BuiltValueField(wireName: 'notify_time_name')
  DateTime? get notifyTimeName;

  @BuiltValueField(wireName: 'selected_times_order')
  BuiltList<int>? get selectedTimesOrder;

  bool? get cancelled;

  @BuiltValueField(wireName: 'booked_company_document')
  DocumentReference? get bookedCompanyDocument;

  @BuiltValueField(wireName: 'selected_company_services_name')
  BuiltList<String>? get selectedCompanyServicesName;

  @BuiltValueField(wireName: 'booked_date_string')
  String? get bookedDateString;

  String? get boxName;

  double? get forCarPay;

  bool? get createdByUser;

  bool? get createdByAdmin;

  String? get createdAdminUserName;

  @BuiltValueField(wireName: 'opened_super_admin')
  bool? get openedSuperAdmin;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(BookingsRecordBuilder builder) => builder
    ..timeName = ''
    ..timeOrder = 0
    ..status = ''
    ..selectedCompanyServices = ListBuilder()
    ..carBody = ''
    ..carName = ''
    ..carOrder = 0
    ..cancelWhy = ''
    ..cancelComment = ''
    ..id = ''
    ..duration = 0.0
    ..totalPrice = 0
    ..selectedTimesOrder = ListBuilder()
    ..cancelled = false
    ..selectedCompanyServicesName = ListBuilder()
    ..bookedDateString = ''
    ..boxName = ''
    ..forCarPay = 0.0
    ..createdByUser = false
    ..createdByAdmin = false
    ..createdAdminUserName = ''
    ..openedSuperAdmin = false;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('bookings');

  static Stream<BookingsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<BookingsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  BookingsRecord._();
  factory BookingsRecord([void Function(BookingsRecordBuilder) updates]) =
      _$BookingsRecord;

  static BookingsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
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
  final firestoreData = serializers.toFirestore(
    BookingsRecord.serializer,
    BookingsRecord(
      (b) => b
        ..bookedUser = bookedUser
        ..bookedCompany = bookedCompany
        ..timeName = timeName
        ..timeOrder = timeOrder
        ..status = status
        ..bookedDate = bookedDate
        ..selectedCompanyServices = null
        ..carBody = carBody
        ..carName = carName
        ..carOrder = carOrder
        ..cancelWhy = cancelWhy
        ..cancelComment = cancelComment
        ..cancelTimeDate = cancelTimeDate
        ..id = id
        ..duration = duration
        ..totalPrice = totalPrice
        ..notifyTimeName = notifyTimeName
        ..selectedTimesOrder = null
        ..cancelled = cancelled
        ..bookedCompanyDocument = bookedCompanyDocument
        ..selectedCompanyServicesName = null
        ..bookedDateString = bookedDateString
        ..boxName = boxName
        ..forCarPay = forCarPay
        ..createdByUser = createdByUser
        ..createdByAdmin = createdByAdmin
        ..createdAdminUserName = createdAdminUserName
        ..openedSuperAdmin = openedSuperAdmin,
    ),
  );

  return firestoreData;
}
