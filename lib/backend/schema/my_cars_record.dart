import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'my_cars_record.g.dart';

abstract class MyCarsRecord
    implements Built<MyCarsRecord, MyCarsRecordBuilder> {
  static Serializer<MyCarsRecord> get serializer => _$myCarsRecordSerializer;

  @BuiltValueField(wireName: 'car_num')
  String? get carNum;

  @BuiltValueField(wireName: 'car_body')
  String? get carBody;

  @BuiltValueField(wireName: 'car_order')
  int? get carOrder;

  @BuiltValueField(wireName: 'link_body')
  DocumentReference? get linkBody;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(MyCarsRecordBuilder builder) => builder
    ..carNum = ''
    ..carBody = ''
    ..carOrder = 0;

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('my_cars')
          : FirebaseFirestore.instance.collectionGroup('my_cars');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('my_cars').doc();

  static Stream<MyCarsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<MyCarsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  MyCarsRecord._();
  factory MyCarsRecord([void Function(MyCarsRecordBuilder) updates]) =
      _$MyCarsRecord;

  static MyCarsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createMyCarsRecordData({
  String? carNum,
  String? carBody,
  int? carOrder,
  DocumentReference? linkBody,
}) {
  final firestoreData = serializers.toFirestore(
    MyCarsRecord.serializer,
    MyCarsRecord(
      (m) => m
        ..carNum = carNum
        ..carBody = carBody
        ..carOrder = carOrder
        ..linkBody = linkBody,
    ),
  );

  return firestoreData;
}
