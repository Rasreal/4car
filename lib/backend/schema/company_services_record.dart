import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'company_services_record.g.dart';

abstract class CompanyServicesRecord
    implements Built<CompanyServicesRecord, CompanyServicesRecordBuilder> {
  static Serializer<CompanyServicesRecord> get serializer =>
      _$companyServicesRecordSerializer;

  String? get name;

  @BuiltValueField(wireName: 'car_body')
  String? get carBody;

  double? get price;

  int? get duration;

  @BuiltValueField(wireName: 'duration_name')
  String? get durationName;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(CompanyServicesRecordBuilder builder) =>
      builder
        ..name = ''
        ..carBody = ''
        ..price = 0.0
        ..duration = 0
        ..durationName = '';

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('company_services')
          : FirebaseFirestore.instance.collectionGroup('company_services');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('company_services').doc();

  static Stream<CompanyServicesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<CompanyServicesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  CompanyServicesRecord._();
  factory CompanyServicesRecord(
          [void Function(CompanyServicesRecordBuilder) updates]) =
      _$CompanyServicesRecord;

  static CompanyServicesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createCompanyServicesRecordData({
  String? name,
  String? carBody,
  double? price,
  int? duration,
  String? durationName,
}) {
  final firestoreData = serializers.toFirestore(
    CompanyServicesRecord.serializer,
    CompanyServicesRecord(
      (c) => c
        ..name = name
        ..carBody = carBody
        ..price = price
        ..duration = duration
        ..durationName = durationName,
    ),
  );

  return firestoreData;
}
