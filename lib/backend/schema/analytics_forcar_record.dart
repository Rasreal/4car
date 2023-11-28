import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AnalyticsForcarRecord extends FirestoreRecord {
  AnalyticsForcarRecord._(
      DocumentReference reference,
      Map<String, dynamic> data,
      ) : super(reference, data) {
    _initializeFields();
  }

  // "oborot" field.
  int? _oborot;
  int get oborot => _oborot ?? 0;
  bool hasOborot() => _oborot != null;

  // "dateStringDMY" field.
  String? _dateStringDMY;
  String get dateStringDMY => _dateStringDMY ?? '';
  bool hasDateStringDMY() => _dateStringDMY != null;

  // "day" field.
  int? _day;
  int get day => _day ?? 0;
  bool hasDay() => _day != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  void _initializeFields() {
    _oborot = castToType<int>(snapshotData['oborot']);
    _dateStringDMY = snapshotData['dateStringDMY'] as String?;
    _day = castToType<int>(snapshotData['day']);
    _date = snapshotData['date'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('analytics_forcar');

  static Stream<AnalyticsForcarRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AnalyticsForcarRecord.fromSnapshot(s));

  static Future<AnalyticsForcarRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AnalyticsForcarRecord.fromSnapshot(s));

  static AnalyticsForcarRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AnalyticsForcarRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AnalyticsForcarRecord getDocumentFromData(
      Map<String, dynamic> data,
      DocumentReference reference,
      ) =>
      AnalyticsForcarRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AnalyticsForcarRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AnalyticsForcarRecord &&
          reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAnalyticsForcarRecordData({
  int? oborot,
  String? dateStringDMY,
  int? day,
  DateTime? date,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'oborot': oborot,
      'dateStringDMY': dateStringDMY,
      'day': day,
      'date': date,
    }.withoutNulls,
  );

  return firestoreData;
}

class AnalyticsForcarRecordDocumentEquality
    implements Equality<AnalyticsForcarRecord> {
  const AnalyticsForcarRecordDocumentEquality();

  @override
  bool equals(AnalyticsForcarRecord? e1, AnalyticsForcarRecord? e2) {
    return e1?.oborot == e2?.oborot &&
        e1?.dateStringDMY == e2?.dateStringDMY &&
        e1?.day == e2?.day &&
        e1?.date == e2?.date;
  }

  @override
  int hash(AnalyticsForcarRecord? e) =>
      const ListEquality().hash([e?.oborot, e?.dateStringDMY, e?.day, e?.date]);

  @override
  bool isValidKey(Object? o) => o is AnalyticsForcarRecord;
}
