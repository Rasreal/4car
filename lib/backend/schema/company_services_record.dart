import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CompanyServicesRecord extends FirestoreRecord {
  CompanyServicesRecord._(
      DocumentReference reference,
      Map<String, dynamic> data,
      ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "car_body" field.
  String? _carBody;
  String get carBody => _carBody ?? '';
  bool hasCarBody() => _carBody != null;

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  bool hasPrice() => _price != null;

  // "duration" field.
  int? _duration;
  int get duration => _duration ?? 0;
  bool hasDuration() => _duration != null;

  // "duration_name" field.
  String? _durationName;
  String get durationName => _durationName ?? '';
  bool hasDurationName() => _durationName != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _carBody = snapshotData['car_body'] as String?;
    _price = castToType<double>(snapshotData['price']);
    _duration = castToType<int>(snapshotData['duration']);
    _durationName = snapshotData['duration_name'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('company_services')
          : FirebaseFirestore.instance.collectionGroup('company_services');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('company_services').doc();

  static Stream<CompanyServicesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CompanyServicesRecord.fromSnapshot(s));

  static Future<CompanyServicesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CompanyServicesRecord.fromSnapshot(s));

  static CompanyServicesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CompanyServicesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CompanyServicesRecord getDocumentFromData(
      Map<String, dynamic> data,
      DocumentReference reference,
      ) =>
      CompanyServicesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CompanyServicesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CompanyServicesRecord &&
          reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCompanyServicesRecordData({
  String? name,
  String? carBody,
  double? price,
  int? duration,
  String? durationName,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'car_body': carBody,
      'price': price,
      'duration': duration,
      'duration_name': durationName,
    }.withoutNulls,
  );

  return firestoreData;
}

class CompanyServicesRecordDocumentEquality
    implements Equality<CompanyServicesRecord> {
  const CompanyServicesRecordDocumentEquality();

  @override
  bool equals(CompanyServicesRecord? e1, CompanyServicesRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.carBody == e2?.carBody &&
        e1?.price == e2?.price &&
        e1?.duration == e2?.duration &&
        e1?.durationName == e2?.durationName;
  }

  @override
  int hash(CompanyServicesRecord? e) => const ListEquality()
      .hash([e?.name, e?.carBody, e?.price, e?.duration, e?.durationName]);

  @override
  bool isValidKey(Object? o) => o is CompanyServicesRecord;
}
