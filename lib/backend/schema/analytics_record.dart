import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AnalyticsRecord extends FirestoreRecord {
  AnalyticsRecord._(
      DocumentReference reference,
      Map<String, dynamic> data,
      ) : super(reference, data) {
    _initializeFields();
  }

  // "date_sum" field.
  int? _dateSum;
  int get dateSum => _dateSum ?? 0;
  bool hasDateSum() => _dateSum != null;

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  bool hasPrice() => _price != null;

  // "dateStringDMY" field.
  String? _dateStringDMY;
  String get dateStringDMY => _dateStringDMY ?? '';
  bool hasDateStringDMY() => _dateStringDMY != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _dateSum = castToType<int>(snapshotData['date_sum']);
    _price = castToType<double>(snapshotData['price']);
    _dateStringDMY = snapshotData['dateStringDMY'] as String?;
    _date = snapshotData['date'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('analytics')
          : FirebaseFirestore.instance.collectionGroup('analytics');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('analytics').doc();

  static Stream<AnalyticsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AnalyticsRecord.fromSnapshot(s));

  static Future<AnalyticsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AnalyticsRecord.fromSnapshot(s));

  static AnalyticsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AnalyticsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AnalyticsRecord getDocumentFromData(
      Map<String, dynamic> data,
      DocumentReference reference,
      ) =>
      AnalyticsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AnalyticsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AnalyticsRecord &&
          reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAnalyticsRecordData({
  int? dateSum,
  double? price,
  String? dateStringDMY,
  DateTime? date,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'date_sum': dateSum,
      'price': price,
      'dateStringDMY': dateStringDMY,
      'date': date,
    }.withoutNulls,
  );

  return firestoreData;
}

class AnalyticsRecordDocumentEquality implements Equality<AnalyticsRecord> {
  const AnalyticsRecordDocumentEquality();

  @override
  bool equals(AnalyticsRecord? e1, AnalyticsRecord? e2) {
    return e1?.dateSum == e2?.dateSum &&
        e1?.price == e2?.price &&
        e1?.dateStringDMY == e2?.dateStringDMY &&
        e1?.date == e2?.date;
  }

  @override
  int hash(AnalyticsRecord? e) => const ListEquality()
      .hash([e?.dateSum, e?.price, e?.dateStringDMY, e?.date]);

  @override
  bool isValidKey(Object? o) => o is AnalyticsRecord;
}
