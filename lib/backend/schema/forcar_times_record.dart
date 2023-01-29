import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'forcar_times_record.g.dart';

abstract class ForcarTimesRecord
    implements Built<ForcarTimesRecord, ForcarTimesRecordBuilder> {
  static Serializer<ForcarTimesRecord> get serializer =>
      _$forcarTimesRecordSerializer;

  @BuiltValueField(wireName: 'time_name')
  String? get timeName;

  @BuiltValueField(wireName: 'time_order')
  int? get timeOrder;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(ForcarTimesRecordBuilder builder) => builder
    ..timeName = ''
    ..timeOrder = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('ForcarTimes');

  static Stream<ForcarTimesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<ForcarTimesRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  ForcarTimesRecord._();
  factory ForcarTimesRecord([void Function(ForcarTimesRecordBuilder) updates]) =
      _$ForcarTimesRecord;

  static ForcarTimesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createForcarTimesRecordData({
  String? timeName,
  int? timeOrder,
}) {
  final firestoreData = serializers.toFirestore(
    ForcarTimesRecord.serializer,
    ForcarTimesRecord(
      (f) => f
        ..timeName = timeName
        ..timeOrder = timeOrder,
    ),
  );

  return firestoreData;
}
