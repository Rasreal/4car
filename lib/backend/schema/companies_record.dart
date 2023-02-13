import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'companies_record.g.dart';

abstract class CompaniesRecord
    implements Built<CompaniesRecord, CompaniesRecordBuilder> {
  static Serializer<CompaniesRecord> get serializer =>
      _$companiesRecordSerializer;

  String? get name;

  BuiltList<double>? get rating;

  LatLng? get location;

  String? get logo;

  String? get city;

  String? get street;

  @BuiltValueField(wireName: 'address_2GIS')
  String? get address2GIS;

  @BuiltValueField(wireName: 'admin_created_by')
  DocumentReference? get adminCreatedBy;

  String? get conveniences;

  @BuiltValueField(wireName: 'count_box')
  int? get countBox;

  String? get status;

  @BuiltValueField(wireName: 'too_name')
  String? get tooName;

  @BuiltValueField(wireName: 'bin_iin')
  int? get binIin;

  String? get iban;

  @BuiltValueField(wireName: 'fio_admin')
  String? get fioAdmin;

  @BuiltValueField(wireName: 'date_dogovor')
  DateTime? get dateDogovor;

  @BuiltValueField(wireName: 'dogovor_pdf')
  String? get dogovorPdf;

  @BuiltValueField(wireName: 'link_city')
  DocumentReference? get linkCity;

  @BuiltValueField(wireName: 'phone_num')
  String? get phoneNum;

  @BuiltValueField(wireName: 'open_time')
  String? get openTime;

  @BuiltValueField(wireName: 'close_time')
  String? get closeTime;

  @BuiltValueField(wireName: 'open_time_order')
  int? get openTimeOrder;

  @BuiltValueField(wireName: 'closed_time_order')
  int? get closedTimeOrder;

  @BuiltValueField(wireName: 'company_document')
  DocumentReference? get companyDocument;

  double? get forCarPercent;

  @BuiltValueField(wireName: 'count_box_string')
  BuiltList<String>? get countBoxString;

  @BuiltValueField(wireName: 'company_users')
  BuiltList<DocumentReference>? get companyUsers;

  @BuiltValueField(wireName: 'num_dogovor')
  String? get numDogovor;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(CompaniesRecordBuilder builder) => builder
    ..name = ''
    ..rating = ListBuilder()
    ..logo = ''
    ..city = ''
    ..street = ''
    ..address2GIS = ''
    ..conveniences = ''
    ..countBox = 0
    ..status = ''
    ..tooName = ''
    ..binIin = 0
    ..iban = ''
    ..fioAdmin = ''
    ..dogovorPdf = ''
    ..phoneNum = ''
    ..openTime = ''
    ..closeTime = ''
    ..openTimeOrder = 0
    ..closedTimeOrder = 0
    ..forCarPercent = 0.0
    ..countBoxString = ListBuilder()
    ..companyUsers = ListBuilder()
    ..numDogovor = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('companies');

  static Stream<CompaniesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<CompaniesRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  CompaniesRecord._();
  factory CompaniesRecord([void Function(CompaniesRecordBuilder) updates]) =
      _$CompaniesRecord;

  static CompaniesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
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
}) {
  final firestoreData = serializers.toFirestore(
    CompaniesRecord.serializer,
    CompaniesRecord(
      (c) => c
        ..name = name
        ..rating = null
        ..location = location
        ..logo = logo
        ..city = city
        ..street = street
        ..address2GIS = address2GIS
        ..adminCreatedBy = adminCreatedBy
        ..conveniences = conveniences
        ..countBox = countBox
        ..status = status
        ..tooName = tooName
        ..binIin = binIin
        ..iban = iban
        ..fioAdmin = fioAdmin
        ..dateDogovor = dateDogovor
        ..dogovorPdf = dogovorPdf
        ..linkCity = linkCity
        ..phoneNum = phoneNum
        ..openTime = openTime
        ..closeTime = closeTime
        ..openTimeOrder = openTimeOrder
        ..closedTimeOrder = closedTimeOrder
        ..companyDocument = companyDocument
        ..forCarPercent = forCarPercent
        ..countBoxString = null
        ..companyUsers = null
        ..numDogovor = numDogovor,
    ),
  );

  return firestoreData;
}
