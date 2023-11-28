import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MyCarsRecord extends FirestoreRecord {
  MyCarsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "car_num" field.
  String? _carNum;
  String get carNum => _carNum ?? '';
  bool hasCarNum() => _carNum != null;

  // "car_body" field.
  String? _carBody;
  String get carBody => _carBody ?? '';
  bool hasCarBody() => _carBody != null;

  // "car_order" field.
  int? _carOrder;
  int get carOrder => _carOrder ?? 0;
  bool hasCarOrder() => _carOrder != null;

  // "link_body" field.
  DocumentReference? _linkBody;
  DocumentReference? get linkBody => _linkBody;
  bool hasLinkBody() => _linkBody != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _carNum = snapshotData['car_num'] as String?;
    _carBody = snapshotData['car_body'] as String?;
    _carOrder = castToType<int>(snapshotData['car_order']);
    _linkBody = snapshotData['link_body'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('my_cars')
          : FirebaseFirestore.instance.collectionGroup('my_cars');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('my_cars').doc();

  static Stream<MyCarsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MyCarsRecord.fromSnapshot(s));

  static Future<MyCarsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MyCarsRecord.fromSnapshot(s));

  static MyCarsRecord fromSnapshot(DocumentSnapshot snapshot) => MyCarsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MyCarsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MyCarsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MyCarsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MyCarsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMyCarsRecordData({
  String? carNum,
  String? carBody,
  int? carOrder,
  DocumentReference? linkBody,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'car_num': carNum,
      'car_body': carBody,
      'car_order': carOrder,
      'link_body': linkBody,
    }.withoutNulls,
  );

  return firestoreData;
}

class MyCarsRecordDocumentEquality implements Equality<MyCarsRecord> {
  const MyCarsRecordDocumentEquality();

  @override
  bool equals(MyCarsRecord? e1, MyCarsRecord? e2) {
    return e1?.carNum == e2?.carNum &&
        e1?.carBody == e2?.carBody &&
        e1?.carOrder == e2?.carOrder &&
        e1?.linkBody == e2?.linkBody;
  }

  @override
  int hash(MyCarsRecord? e) => const ListEquality()
      .hash([e?.carNum, e?.carBody, e?.carOrder, e?.linkBody]);

  @override
  bool isValidKey(Object? o) => o is MyCarsRecord;
}
