import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'promotion_record.g.dart';

abstract class PromotionRecord
    implements Built<PromotionRecord, PromotionRecordBuilder> {
  static Serializer<PromotionRecord> get serializer =>
      _$promotionRecordSerializer;

  String? get title;

  String? get subtitle;

  String? get img;

  @BuiltValueField(wireName: 'city_link')
  DocumentReference? get cityLink;

  String? get status;

  bool? get moderation;

  bool? get top;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(PromotionRecordBuilder builder) => builder
    ..title = ''
    ..subtitle = ''
    ..img = ''
    ..status = ''
    ..moderation = false
    ..top = false;

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('promotion')
          : FirebaseFirestore.instance.collectionGroup('promotion');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('promotion').doc();

  static Stream<PromotionRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<PromotionRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  PromotionRecord._();
  factory PromotionRecord([void Function(PromotionRecordBuilder) updates]) =
      _$PromotionRecord;

  static PromotionRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createPromotionRecordData({
  String? title,
  String? subtitle,
  String? img,
  DocumentReference? cityLink,
  String? status,
  bool? moderation,
  bool? top,
}) {
  final firestoreData = serializers.toFirestore(
    PromotionRecord.serializer,
    PromotionRecord(
      (p) => p
        ..title = title
        ..subtitle = subtitle
        ..img = img
        ..cityLink = cityLink
        ..status = status
        ..moderation = moderation
        ..top = top,
    ),
  );

  return firestoreData;
}
