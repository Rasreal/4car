import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CityesRecord extends FirestoreRecord {
  CityesRecord._(
      DocumentReference reference,
      Map<String, dynamic> data,
      ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "location" field.
  LatLng? _location;
  LatLng? get location => _location;
  bool hasLocation() => _location != null;

  // "first" field.
  String? _first;
  String get first => _first ?? '';
  bool hasFirst() => _first != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _location = snapshotData['location'] as LatLng?;
    _first = snapshotData['first'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('cityes');

  static Stream<CityesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CityesRecord.fromSnapshot(s));

  static Future<CityesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CityesRecord.fromSnapshot(s));

  static CityesRecord fromSnapshot(DocumentSnapshot snapshot) => CityesRecord._(
    snapshot.reference,
    mapFromFirestore(snapshot.data() as Map<String, dynamic>),
  );

  static CityesRecord getDocumentFromData(
      Map<String, dynamic> data,
      DocumentReference reference,
      ) =>
      CityesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CityesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CityesRecord &&
          reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCityesRecordData({
  String? name,
  LatLng? location,
  String? first,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'location': location,
      'first': first,
    }.withoutNulls,
  );

  return firestoreData;
}

class CityesRecordDocumentEquality implements Equality<CityesRecord> {
  const CityesRecordDocumentEquality();

  @override
  bool equals(CityesRecord? e1, CityesRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.location == e2?.location &&
        e1?.first == e2?.first;
  }

  @override
  int hash(CityesRecord? e) =>
      const ListEquality().hash([e?.name, e?.location, e?.first]);

  @override
  bool isValidKey(Object? o) => o is CityesRecord;
}
