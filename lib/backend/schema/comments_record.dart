import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'comments_record.g.dart';

abstract class CommentsRecord
    implements Built<CommentsRecord, CommentsRecordBuilder> {
  static Serializer<CommentsRecord> get serializer =>
      _$commentsRecordSerializer;

  String? get comment;

  @BuiltValueField(wireName: 'created_by')
  DocumentReference? get createdBy;

  @BuiltValueField(wireName: 'created_at')
  DateTime? get createdAt;

  DocumentReference? get company;

  double? get rating;

  @BuiltValueField(wireName: 'boolean_response')
  bool? get booleanResponse;

  @BuiltValueField(wireName: 'response_comment')
  String? get responseComment;

  @BuiltValueField(wireName: 'booked_comment')
  bool? get bookedComment;

  DocumentReference? get bookingDoc;

  bool? get obtobotan;

  String? get obrobotanFilter;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(CommentsRecordBuilder builder) => builder
    ..comment = ''
    ..rating = 0.0
    ..booleanResponse = false
    ..responseComment = ''
    ..bookedComment = false
    ..obtobotan = false
    ..obrobotanFilter = '';

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('comments')
          : FirebaseFirestore.instance.collectionGroup('comments');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('comments').doc();

  static Stream<CommentsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<CommentsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  CommentsRecord._();
  factory CommentsRecord([void Function(CommentsRecordBuilder) updates]) =
      _$CommentsRecord;

  static CommentsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createCommentsRecordData({
  String? comment,
  DocumentReference? createdBy,
  DateTime? createdAt,
  DocumentReference? company,
  double? rating,
  bool? booleanResponse,
  String? responseComment,
  bool? bookedComment,
  DocumentReference? bookingDoc,
  bool? obtobotan,
  String? obrobotanFilter,
}) {
  final firestoreData = serializers.toFirestore(
    CommentsRecord.serializer,
    CommentsRecord(
      (c) => c
        ..comment = comment
        ..createdBy = createdBy
        ..createdAt = createdAt
        ..company = company
        ..rating = rating
        ..booleanResponse = booleanResponse
        ..responseComment = responseComment
        ..bookedComment = bookedComment
        ..bookingDoc = bookingDoc
        ..obtobotan = obtobotan
        ..obrobotanFilter = obrobotanFilter,
    ),
  );

  return firestoreData;
}
