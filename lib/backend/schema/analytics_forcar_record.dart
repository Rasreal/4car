import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'analytics_forcar_record.g.dart';

abstract class AnalyticsForcarRecord
    implements Built<AnalyticsForcarRecord, AnalyticsForcarRecordBuilder> {
  static Serializer<AnalyticsForcarRecord> get serializer =>
      _$analyticsForcarRecordSerializer;

  int? get oborot;

  String? get dateStringDMY;

  int? get day;

  DateTime? get date;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(AnalyticsForcarRecordBuilder builder) =>
      builder
        ..oborot = 0
        ..dateStringDMY = ''
        ..day = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('analytics_forcar');

  static Stream<AnalyticsForcarRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<AnalyticsForcarRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  AnalyticsForcarRecord._();
  factory AnalyticsForcarRecord(
          [void Function(AnalyticsForcarRecordBuilder) updates]) =
      _$AnalyticsForcarRecord;

  static AnalyticsForcarRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createAnalyticsForcarRecordData({
  int? oborot,
  String? dateStringDMY,
  int? day,
  DateTime? date,
}) {
  final firestoreData = serializers.toFirestore(
    AnalyticsForcarRecord.serializer,
    AnalyticsForcarRecord(
      (a) => a
        ..oborot = oborot
        ..dateStringDMY = dateStringDMY
        ..day = day
        ..date = date,
    ),
  );

  return firestoreData;
}
