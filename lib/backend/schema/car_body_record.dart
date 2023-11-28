import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CarBodyRecord extends FirestoreRecord {
  CarBodyRecord._(
      DocumentReference reference,
      Map<String, dynamic> data,
      ) : super(reference, data) {
    _initializeFields();
  }

  // "body_name" field.
  String? _bodyName;
  String get bodyName => _bodyName ?? '';
  bool hasBodyName() => _bodyName != null;

  void _initializeFields() {
    _bodyName = snapshotData['body_name'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('car_body');

  static Stream<CarBodyRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CarBodyRecord.fromSnapshot(s));

  static Future<CarBodyRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CarBodyRecord.fromSnapshot(s));

  static CarBodyRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CarBodyRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CarBodyRecord getDocumentFromData(
      Map<String, dynamic> data,
      DocumentReference reference,
      ) =>
      CarBodyRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CarBodyRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CarBodyRecord &&
          reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCarBodyRecordData({
  String? bodyName,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'body_name': bodyName,
    }.withoutNulls,
  );

  return firestoreData;
}

class CarBodyRecordDocumentEquality implements Equality<CarBodyRecord> {
  const CarBodyRecordDocumentEquality();

  @override
  bool equals(CarBodyRecord? e1, CarBodyRecord? e2) {
    return e1?.bodyName == e2?.bodyName;
  }

  @override
  int hash(CarBodyRecord? e) => const ListEquality().hash([e?.bodyName]);

  @override
  bool isValidKey(Object? o) => o is CarBodyRecord;
}
