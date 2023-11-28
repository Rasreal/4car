import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ForcarTimesRecord extends FirestoreRecord {
  ForcarTimesRecord._(
      DocumentReference reference,
      Map<String, dynamic> data,
      ) : super(reference, data) {
    _initializeFields();
  }

  // "time_name" field.
  String? _timeName;
  String get timeName => _timeName ?? '';
  bool hasTimeName() => _timeName != null;

  // "time_order" field.
  int? _timeOrder;
  int get timeOrder => _timeOrder ?? 0;
  bool hasTimeOrder() => _timeOrder != null;

  void _initializeFields() {
    _timeName = snapshotData['time_name'] as String?;
    _timeOrder = castToType<int>(snapshotData['time_order']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('ForcarTimes');

  static Stream<ForcarTimesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ForcarTimesRecord.fromSnapshot(s));

  static Future<ForcarTimesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ForcarTimesRecord.fromSnapshot(s));

  static ForcarTimesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ForcarTimesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ForcarTimesRecord getDocumentFromData(
      Map<String, dynamic> data,
      DocumentReference reference,
      ) =>
      ForcarTimesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ForcarTimesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ForcarTimesRecord &&
          reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createForcarTimesRecordData({
  String? timeName,
  int? timeOrder,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'time_name': timeName,
      'time_order': timeOrder,
    }.withoutNulls,
  );

  return firestoreData;
}

class ForcarTimesRecordDocumentEquality implements Equality<ForcarTimesRecord> {
  const ForcarTimesRecordDocumentEquality();

  @override
  bool equals(ForcarTimesRecord? e1, ForcarTimesRecord? e2) {
    return e1?.timeName == e2?.timeName && e1?.timeOrder == e2?.timeOrder;
  }

  @override
  int hash(ForcarTimesRecord? e) =>
      const ListEquality().hash([e?.timeName, e?.timeOrder]);

  @override
  bool isValidKey(Object? o) => o is ForcarTimesRecord;
}
