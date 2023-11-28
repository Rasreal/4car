import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CompanyDocumentRecord extends FirestoreRecord {
  CompanyDocumentRecord._(
      DocumentReference reference,
      Map<String, dynamic> data,
      ) : super(reference, data) {
    _initializeFields();
  }

  // "company_name" field.
  String? _companyName;
  String get companyName => _companyName ?? '';
  bool hasCompanyName() => _companyName != null;

  // "too_name" field.
  String? _tooName;
  String get tooName => _tooName ?? '';
  bool hasTooName() => _tooName != null;

  // "fio_rukovoditel" field.
  String? _fioRukovoditel;
  String get fioRukovoditel => _fioRukovoditel ?? '';
  bool hasFioRukovoditel() => _fioRukovoditel != null;

  // "num_dogovor" field.
  String? _numDogovor;
  String get numDogovor => _numDogovor ?? '';
  bool hasNumDogovor() => _numDogovor != null;

  // "date_dogovor" field.
  DateTime? _dateDogovor;
  DateTime? get dateDogovor => _dateDogovor;
  bool hasDateDogovor() => _dateDogovor != null;

  // "dogovor" field.
  String? _dogovor;
  String get dogovor => _dogovor ?? '';
  bool hasDogovor() => _dogovor != null;

  // "BIN" field.
  int? _bin;
  int get bin => _bin ?? 0;
  bool hasBin() => _bin != null;

  // "IBAN" field.
  String? _iban;
  String get iban => _iban ?? '';
  bool hasIban() => _iban != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "logo" field.
  String? _logo;
  String get logo => _logo ?? '';
  bool hasLogo() => _logo != null;

  // "company_branches" field.
  List<DocumentReference>? _companyBranches;
  List<DocumentReference> get companyBranches => _companyBranches ?? const [];
  bool hasCompanyBranches() => _companyBranches != null;

  // "company_users" field.
  List<DocumentReference>? _companyUsers;
  List<DocumentReference> get companyUsers => _companyUsers ?? const [];
  bool hasCompanyUsers() => _companyUsers != null;

  // "company_admin" field.
  List<DocumentReference>? _companyAdmin;
  List<DocumentReference> get companyAdmin => _companyAdmin ?? const [];
  bool hasCompanyAdmin() => _companyAdmin != null;

  // "boxesName" field.
  List<String>? _boxesName;
  List<String> get boxesName => _boxesName ?? const [];
  bool hasBoxesName() => _boxesName != null;

  // "forCarProcent" field.
  double? _forCarProcent;
  double get forCarProcent => _forCarProcent ?? 0.0;
  bool hasForCarProcent() => _forCarProcent != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _companyName = snapshotData['company_name'] as String?;
    _tooName = snapshotData['too_name'] as String?;
    _fioRukovoditel = snapshotData['fio_rukovoditel'] as String?;
    _numDogovor = snapshotData['num_dogovor'] as String?;
    _dateDogovor = snapshotData['date_dogovor'] as DateTime?;
    _dogovor = snapshotData['dogovor'] as String?;
    _bin = castToType<int>(snapshotData['BIN']);
    _iban = snapshotData['IBAN'] as String?;
    _status = snapshotData['status'] as String?;
    _logo = snapshotData['logo'] as String?;
    _companyBranches = getDataList(snapshotData['company_branches']);
    _companyUsers = getDataList(snapshotData['company_users']);
    _companyAdmin = getDataList(snapshotData['company_admin']);
    _boxesName = getDataList(snapshotData['boxesName']);
    _forCarProcent = castToType<double>(snapshotData['forCarProcent']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('company_document')
          : FirebaseFirestore.instance.collectionGroup('company_document');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('company_document').doc();

  static Stream<CompanyDocumentRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CompanyDocumentRecord.fromSnapshot(s));

  static Future<CompanyDocumentRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CompanyDocumentRecord.fromSnapshot(s));

  static CompanyDocumentRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CompanyDocumentRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CompanyDocumentRecord getDocumentFromData(
      Map<String, dynamic> data,
      DocumentReference reference,
      ) =>
      CompanyDocumentRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CompanyDocumentRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CompanyDocumentRecord &&
          reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCompanyDocumentRecordData({
  String? companyName,
  String? tooName,
  String? fioRukovoditel,
  String? numDogovor,
  DateTime? dateDogovor,
  String? dogovor,
  int? bin,
  String? iban,
  String? status,
  String? logo,
  double? forCarProcent,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'company_name': companyName,
      'too_name': tooName,
      'fio_rukovoditel': fioRukovoditel,
      'num_dogovor': numDogovor,
      'date_dogovor': dateDogovor,
      'dogovor': dogovor,
      'BIN': bin,
      'IBAN': iban,
      'status': status,
      'logo': logo,
      'forCarProcent': forCarProcent,
    }.withoutNulls,
  );

  return firestoreData;
}

class CompanyDocumentRecordDocumentEquality
    implements Equality<CompanyDocumentRecord> {
  const CompanyDocumentRecordDocumentEquality();

  @override
  bool equals(CompanyDocumentRecord? e1, CompanyDocumentRecord? e2) {
    const listEquality = ListEquality();
    return e1?.companyName == e2?.companyName &&
        e1?.tooName == e2?.tooName &&
        e1?.fioRukovoditel == e2?.fioRukovoditel &&
        e1?.numDogovor == e2?.numDogovor &&
        e1?.dateDogovor == e2?.dateDogovor &&
        e1?.dogovor == e2?.dogovor &&
        e1?.bin == e2?.bin &&
        e1?.iban == e2?.iban &&
        e1?.status == e2?.status &&
        e1?.logo == e2?.logo &&
        listEquality.equals(e1?.companyBranches, e2?.companyBranches) &&
        listEquality.equals(e1?.companyUsers, e2?.companyUsers) &&
        listEquality.equals(e1?.companyAdmin, e2?.companyAdmin) &&
        listEquality.equals(e1?.boxesName, e2?.boxesName) &&
        e1?.forCarProcent == e2?.forCarProcent;
  }

  @override
  int hash(CompanyDocumentRecord? e) => const ListEquality().hash([
    e?.companyName,
    e?.tooName,
    e?.fioRukovoditel,
    e?.numDogovor,
    e?.dateDogovor,
    e?.dogovor,
    e?.bin,
    e?.iban,
    e?.status,
    e?.logo,
    e?.companyBranches,
    e?.companyUsers,
    e?.companyAdmin,
    e?.boxesName,
    e?.forCarProcent
  ]);

  @override
  bool isValidKey(Object? o) => o is CompanyDocumentRecord;
}
