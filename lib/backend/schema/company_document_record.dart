import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'company_document_record.g.dart';

abstract class CompanyDocumentRecord
    implements Built<CompanyDocumentRecord, CompanyDocumentRecordBuilder> {
  static Serializer<CompanyDocumentRecord> get serializer =>
      _$companyDocumentRecordSerializer;

  @BuiltValueField(wireName: 'company_name')
  String? get companyName;

  @BuiltValueField(wireName: 'too_name')
  String? get tooName;

  @BuiltValueField(wireName: 'fio_rukovoditel')
  String? get fioRukovoditel;

  @BuiltValueField(wireName: 'num_dogovor')
  String? get numDogovor;

  @BuiltValueField(wireName: 'date_dogovor')
  DateTime? get dateDogovor;

  String? get dogovor;

  @BuiltValueField(wireName: 'BIN')
  int? get bin;

  @BuiltValueField(wireName: 'IBAN')
  String? get iban;

  String? get status;

  String? get logo;

  @BuiltValueField(wireName: 'company_branches')
  BuiltList<DocumentReference>? get companyBranches;

  @BuiltValueField(wireName: 'company_users')
  BuiltList<DocumentReference>? get companyUsers;

  @BuiltValueField(wireName: 'company_admin')
  BuiltList<DocumentReference>? get companyAdmin;

  BuiltList<String>? get boxesName;

  double? get forCarProcent;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(CompanyDocumentRecordBuilder builder) =>
      builder
        ..companyName = ''
        ..tooName = ''
        ..fioRukovoditel = ''
        ..numDogovor = ''
        ..dogovor = ''
        ..bin = 0
        ..iban = ''
        ..status = ''
        ..logo = ''
        ..companyBranches = ListBuilder()
        ..companyUsers = ListBuilder()
        ..companyAdmin = ListBuilder()
        ..boxesName = ListBuilder()
        ..forCarProcent = 0.0;

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('company_document')
          : FirebaseFirestore.instance.collectionGroup('company_document');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('company_document').doc();

  static Stream<CompanyDocumentRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<CompanyDocumentRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  CompanyDocumentRecord._();
  factory CompanyDocumentRecord(
          [void Function(CompanyDocumentRecordBuilder) updates]) =
      _$CompanyDocumentRecord;

  static CompanyDocumentRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createCompanyDocumentRecordData({
  String? companyName,
  String? tooName,
  String? fioRukovoditel,
  String? numDogovor,
  DateTime? dateDogovor,
  String? dogovor,
  int? bin,
  String? iban,
  String? status,
  String? logo,
  double? forCarProcent,
}) {
  final firestoreData = serializers.toFirestore(
    CompanyDocumentRecord.serializer,
    CompanyDocumentRecord(
      (c) => c
        ..companyName = companyName
        ..tooName = tooName
        ..fioRukovoditel = fioRukovoditel
        ..numDogovor = numDogovor
        ..dateDogovor = dateDogovor
        ..dogovor = dogovor
        ..bin = bin
        ..iban = iban
        ..status = status
        ..logo = logo
        ..companyBranches = null
        ..companyUsers = null
        ..companyAdmin = null
        ..boxesName = null
        ..forCarProcent = forCarProcent,
    ),
  );

  return firestoreData;
}
