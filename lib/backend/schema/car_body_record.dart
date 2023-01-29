import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'car_body_record.g.dart';

abstract class CarBodyRecord
    implements Built<CarBodyRecord, CarBodyRecordBuilder> {
  static Serializer<CarBodyRecord> get serializer => _$carBodyRecordSerializer;

  @BuiltValueField(wireName: 'body_name')
  String? get bodyName;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(CarBodyRecordBuilder builder) =>
      builder..bodyName = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('car_body');

  static Stream<CarBodyRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<CarBodyRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  CarBodyRecord._();
  factory CarBodyRecord([void Function(CarBodyRecordBuilder) updates]) =
      _$CarBodyRecord;

  static CarBodyRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createCarBodyRecordData({
  String? bodyName,
}) {
  final firestoreData = serializers.toFirestore(
    CarBodyRecord.serializer,
    CarBodyRecord(
      (c) => c..bodyName = bodyName,
    ),
  );

  return firestoreData;
}
