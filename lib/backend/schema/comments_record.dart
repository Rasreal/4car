import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CommentsRecord extends FirestoreRecord {
  CommentsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "comment" field.
  String? _comment;
  String get comment => _comment ?? '';
  bool hasComment() => _comment != null;

  // "created_by" field.
  DocumentReference? _createdBy;
  DocumentReference? get createdBy => _createdBy;
  bool hasCreatedBy() => _createdBy != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "company" field.
  DocumentReference? _company;
  DocumentReference? get company => _company;
  bool hasCompany() => _company != null;

  // "rating" field.
  double? _rating;
  double get rating => _rating ?? 0.0;
  bool hasRating() => _rating != null;

  // "boolean_response" field.
  bool? _booleanResponse;
  bool get booleanResponse => _booleanResponse ?? false;
  bool hasBooleanResponse() => _booleanResponse != null;

  // "response_comment" field.
  String? _responseComment;
  String get responseComment => _responseComment ?? '';
  bool hasResponseComment() => _responseComment != null;

  // "booked_comment" field.
  bool? _bookedComment;
  bool get bookedComment => _bookedComment ?? false;
  bool hasBookedComment() => _bookedComment != null;

  // "bookingDoc" field.
  DocumentReference? _bookingDoc;
  DocumentReference? get bookingDoc => _bookingDoc;
  bool hasBookingDoc() => _bookingDoc != null;

  // "obtobotan" field.
  bool? _obtobotan;
  bool get obtobotan => _obtobotan ?? false;
  bool hasObtobotan() => _obtobotan != null;

  // "obrobotanFilter" field.
  String? _obrobotanFilter;
  String get obrobotanFilter => _obrobotanFilter ?? '';
  bool hasObrobotanFilter() => _obrobotanFilter != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _comment = snapshotData['comment'] as String?;
    _createdBy = snapshotData['created_by'] as DocumentReference?;
    _createdAt = snapshotData['created_at'] as DateTime?;
    _company = snapshotData['company'] as DocumentReference?;
    _rating = castToType<double>(snapshotData['rating']);
    _booleanResponse = snapshotData['boolean_response'] as bool?;
    _responseComment = snapshotData['response_comment'] as String?;
    _bookedComment = snapshotData['booked_comment'] as bool?;
    _bookingDoc = snapshotData['bookingDoc'] as DocumentReference?;
    _obtobotan = snapshotData['obtobotan'] as bool?;
    _obrobotanFilter = snapshotData['obrobotanFilter'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('comments')
          : FirebaseFirestore.instance.collectionGroup('comments');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('comments').doc();

  static Stream<CommentsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CommentsRecord.fromSnapshot(s));

  static Future<CommentsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CommentsRecord.fromSnapshot(s));

  static CommentsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CommentsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CommentsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CommentsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CommentsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CommentsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
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
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'comment': comment,
      'created_by': createdBy,
      'created_at': createdAt,
      'company': company,
      'rating': rating,
      'boolean_response': booleanResponse,
      'response_comment': responseComment,
      'booked_comment': bookedComment,
      'bookingDoc': bookingDoc,
      'obtobotan': obtobotan,
      'obrobotanFilter': obrobotanFilter,
    }.withoutNulls,
  );

  return firestoreData;
}

class CommentsRecordDocumentEquality implements Equality<CommentsRecord> {
  const CommentsRecordDocumentEquality();

  @override
  bool equals(CommentsRecord? e1, CommentsRecord? e2) {
    return e1?.comment == e2?.comment &&
        e1?.createdBy == e2?.createdBy &&
        e1?.createdAt == e2?.createdAt &&
        e1?.company == e2?.company &&
        e1?.rating == e2?.rating &&
        e1?.booleanResponse == e2?.booleanResponse &&
        e1?.responseComment == e2?.responseComment &&
        e1?.bookedComment == e2?.bookedComment &&
        e1?.bookingDoc == e2?.bookingDoc &&
        e1?.obtobotan == e2?.obtobotan &&
        e1?.obrobotanFilter == e2?.obrobotanFilter;
  }

  @override
  int hash(CommentsRecord? e) => const ListEquality().hash([
        e?.comment,
        e?.createdBy,
        e?.createdAt,
        e?.company,
        e?.rating,
        e?.booleanResponse,
        e?.responseComment,
        e?.bookedComment,
        e?.bookingDoc,
        e?.obtobotan,
        e?.obrobotanFilter
      ]);

  @override
  bool isValidKey(Object? o) => o is CommentsRecord;
}
