import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'analytics_record.g.dart';

abstract class AnalyticsRecord
    implements Built<AnalyticsRecord, AnalyticsRecordBuilder> {
  static Serializer<AnalyticsRecord> get serializer =>
      _$analyticsRecordSerializer;

  @BuiltValueField(wireName: 'date_sum')
  int? get dateSum;

  double? get price;

  String? get dateStringDMY;

  DateTime? get date;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(AnalyticsRecordBuilder builder) => builder
    ..dateSum = 0
    ..price = 0.0
    ..dateStringDMY = '';

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('analytics')
          : FirebaseFirestore.instance.collectionGroup('analytics');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('analytics').doc();

  static Stream<AnalyticsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<AnalyticsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  AnalyticsRecord._();
  factory AnalyticsRecord([void Function(AnalyticsRecordBuilder) updates]) =
      _$AnalyticsRecord;

  static AnalyticsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createAnalyticsRecordData({
  int? dateSum,
  double? price,
  String? dateStringDMY,
  DateTime? date,
}) {
  final firestoreData = serializers.toFirestore(
    AnalyticsRecord.serializer,
    AnalyticsRecord(
      (a) => a
        ..dateSum = dateSum
        ..price = price
        ..dateStringDMY = dateStringDMY
        ..date = date,
    ),
  );

  return firestoreData;
}
