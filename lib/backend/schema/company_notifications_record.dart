import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'company_notifications_record.g.dart';

abstract class CompanyNotificationsRecord
    implements
        Built<CompanyNotificationsRecord, CompanyNotificationsRecordBuilder> {
  static Serializer<CompanyNotificationsRecord> get serializer =>
      _$companyNotificationsRecordSerializer;

  String? get message;

  DateTime? get date;

  bool? get opened;

  @BuiltValueField(wireName: 'booking_ref')
  DocumentReference? get bookingRef;

  @BuiltValueField(wireName: 'promotion_ref')
  DocumentReference? get promotionRef;

  String? get type;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(CompanyNotificationsRecordBuilder builder) =>
      builder
        ..message = ''
        ..opened = false
        ..type = '';

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('company_notifications')
          : FirebaseFirestore.instance.collectionGroup('company_notifications');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('company_notifications').doc();

  static Stream<CompanyNotificationsRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<CompanyNotificationsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  CompanyNotificationsRecord._();
  factory CompanyNotificationsRecord(
          [void Function(CompanyNotificationsRecordBuilder) updates]) =
      _$CompanyNotificationsRecord;

  static CompanyNotificationsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createCompanyNotificationsRecordData({
  String? message,
  DateTime? date,
  bool? opened,
  DocumentReference? bookingRef,
  DocumentReference? promotionRef,
  String? type,
}) {
  final firestoreData = serializers.toFirestore(
    CompanyNotificationsRecord.serializer,
    CompanyNotificationsRecord(
      (c) => c
        ..message = message
        ..date = date
        ..opened = opened
        ..bookingRef = bookingRef
        ..promotionRef = promotionRef
        ..type = type,
    ),
  );

  return firestoreData;
}
