import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CompanyNotificationsRecord extends FirestoreRecord {
  CompanyNotificationsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "message" field.
  String? _message;
  String get message => _message ?? '';
  bool hasMessage() => _message != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "opened" field.
  bool? _opened;
  bool get opened => _opened ?? false;
  bool hasOpened() => _opened != null;

  // "booking_ref" field.
  DocumentReference? _bookingRef;
  DocumentReference? get bookingRef => _bookingRef;
  bool hasBookingRef() => _bookingRef != null;

  // "promotion_ref" field.
  DocumentReference? _promotionRef;
  DocumentReference? get promotionRef => _promotionRef;
  bool hasPromotionRef() => _promotionRef != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _message = snapshotData['message'] as String?;
    _date = snapshotData['date'] as DateTime?;
    _opened = snapshotData['opened'] as bool?;
    _bookingRef = snapshotData['booking_ref'] as DocumentReference?;
    _promotionRef = snapshotData['promotion_ref'] as DocumentReference?;
    _type = snapshotData['type'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('company_notifications')
          : FirebaseFirestore.instance.collectionGroup('company_notifications');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('company_notifications').doc();

  static Stream<CompanyNotificationsRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map((s) => CompanyNotificationsRecord.fromSnapshot(s));

  static Future<CompanyNotificationsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => CompanyNotificationsRecord.fromSnapshot(s));

  static CompanyNotificationsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CompanyNotificationsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CompanyNotificationsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CompanyNotificationsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CompanyNotificationsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CompanyNotificationsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCompanyNotificationsRecordData({
  String? message,
  DateTime? date,
  bool? opened,
  DocumentReference? bookingRef,
  DocumentReference? promotionRef,
  String? type,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'message': message,
      'date': date,
      'opened': opened,
      'booking_ref': bookingRef,
      'promotion_ref': promotionRef,
      'type': type,
    }.withoutNulls,
  );

  return firestoreData;
}

class CompanyNotificationsRecordDocumentEquality
    implements Equality<CompanyNotificationsRecord> {
  const CompanyNotificationsRecordDocumentEquality();

  @override
  bool equals(CompanyNotificationsRecord? e1, CompanyNotificationsRecord? e2) {
    return e1?.message == e2?.message &&
        e1?.date == e2?.date &&
        e1?.opened == e2?.opened &&
        e1?.bookingRef == e2?.bookingRef &&
        e1?.promotionRef == e2?.promotionRef &&
        e1?.type == e2?.type;
  }

  @override
  int hash(CompanyNotificationsRecord? e) => const ListEquality().hash([
        e?.message,
        e?.date,
        e?.opened,
        e?.bookingRef,
        e?.promotionRef,
        e?.type
      ]);

  @override
  bool isValidKey(Object? o) => o is CompanyNotificationsRecord;
}
