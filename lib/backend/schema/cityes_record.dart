import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'cityes_record.g.dart';

abstract class CityesRecord
    implements Built<CityesRecord, CityesRecordBuilder> {
  static Serializer<CityesRecord> get serializer => _$cityesRecordSerializer;

  String? get name;

  LatLng? get location;

  String? get first;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(CityesRecordBuilder builder) => builder
    ..name = ''
    ..first = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('cityes');

  static Stream<CityesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<CityesRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  CityesRecord._();
  factory CityesRecord([void Function(CityesRecordBuilder) updates]) =
      _$CityesRecord;

  static CityesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createCityesRecordData({
  String? name,
  LatLng? location,
  String? first,
}) {
  final firestoreData = serializers.toFirestore(
    CityesRecord.serializer,
    CityesRecord(
      (c) => c
        ..name = name
        ..location = location
        ..first = first,
    ),
  );

  return firestoreData;
}
