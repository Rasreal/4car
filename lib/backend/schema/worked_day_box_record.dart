import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WorkedDayBoxRecord extends FirestoreRecord {
  WorkedDayBoxRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "count_box_name" field.
  String? _countBoxName;
  String get countBoxName => _countBoxName ?? '';
  bool hasCountBoxName() => _countBoxName != null;

  // "date_DMY" field.
  String? _dateDMY;
  String get dateDMY => _dateDMY ?? '';
  bool hasDateDMY() => _dateDMY != null;

  // "count" field.
  int? _count;
  int get count => _count ?? 0;
  bool hasCount() => _count != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _countBoxName = snapshotData['count_box_name'] as String?;
    _dateDMY = snapshotData['date_DMY'] as String?;
    _count = castToType<int>(snapshotData['count']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('worked_day_box')
          : FirebaseFirestore.instance.collectionGroup('worked_day_box');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('worked_day_box').doc();

  static Stream<WorkedDayBoxRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => WorkedDayBoxRecord.fromSnapshot(s));

  static Future<WorkedDayBoxRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => WorkedDayBoxRecord.fromSnapshot(s));

  static WorkedDayBoxRecord fromSnapshot(DocumentSnapshot snapshot) =>
      WorkedDayBoxRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static WorkedDayBoxRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      WorkedDayBoxRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'WorkedDayBoxRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is WorkedDayBoxRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createWorkedDayBoxRecordData({
  String? countBoxName,
  String? dateDMY,
  int? count,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'count_box_name': countBoxName,
      'date_DMY': dateDMY,
      'count': count,
    }.withoutNulls,
  );

  return firestoreData;
}

class WorkedDayBoxRecordDocumentEquality
    implements Equality<WorkedDayBoxRecord> {
  const WorkedDayBoxRecordDocumentEquality();

  @override
  bool equals(WorkedDayBoxRecord? e1, WorkedDayBoxRecord? e2) {
    return e1?.countBoxName == e2?.countBoxName &&
        e1?.dateDMY == e2?.dateDMY &&
        e1?.count == e2?.count;
  }

  @override
  int hash(WorkedDayBoxRecord? e) =>
      const ListEquality().hash([e?.countBoxName, e?.dateDMY, e?.count]);

  @override
  bool isValidKey(Object? o) => o is WorkedDayBoxRecord;
}
