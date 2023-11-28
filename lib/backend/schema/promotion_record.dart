import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PromotionRecord extends FirestoreRecord {
  PromotionRecord._(
      DocumentReference reference,
      Map<String, dynamic> data,
      ) : super(reference, data) {
    _initializeFields();
  }

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "subtitle" field.
  String? _subtitle;
  String get subtitle => _subtitle ?? '';
  bool hasSubtitle() => _subtitle != null;

  // "img" field.
  String? _img;
  String get img => _img ?? '';
  bool hasImg() => _img != null;

  // "city_link" field.
  DocumentReference? _cityLink;
  DocumentReference? get cityLink => _cityLink;
  bool hasCityLink() => _cityLink != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "moderation" field.
  bool? _moderation;
  bool get moderation => _moderation ?? false;
  bool hasModeration() => _moderation != null;

  // "top" field.
  bool? _top;
  bool get top => _top ?? false;
  bool hasTop() => _top != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _subtitle = snapshotData['subtitle'] as String?;
    _img = snapshotData['img'] as String?;
    _cityLink = snapshotData['city_link'] as DocumentReference?;
    _status = snapshotData['status'] as String?;
    _moderation = snapshotData['moderation'] as bool?;
    _top = snapshotData['top'] as bool?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('promotion')
          : FirebaseFirestore.instance.collectionGroup('promotion');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('promotion').doc();

  static Stream<PromotionRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PromotionRecord.fromSnapshot(s));

  static Future<PromotionRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PromotionRecord.fromSnapshot(s));

  static PromotionRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PromotionRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PromotionRecord getDocumentFromData(
      Map<String, dynamic> data,
      DocumentReference reference,
      ) =>
      PromotionRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PromotionRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PromotionRecord &&
          reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPromotionRecordData({
  String? title,
  String? subtitle,
  String? img,
  DocumentReference? cityLink,
  String? status,
  bool? moderation,
  bool? top,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'subtitle': subtitle,
      'img': img,
      'city_link': cityLink,
      'status': status,
      'moderation': moderation,
      'top': top,
    }.withoutNulls,
  );

  return firestoreData;
}

class PromotionRecordDocumentEquality implements Equality<PromotionRecord> {
  const PromotionRecordDocumentEquality();

  @override
  bool equals(PromotionRecord? e1, PromotionRecord? e2) {
    return e1?.title == e2?.title &&
        e1?.subtitle == e2?.subtitle &&
        e1?.img == e2?.img &&
        e1?.cityLink == e2?.cityLink &&
        e1?.status == e2?.status &&
        e1?.moderation == e2?.moderation &&
        e1?.top == e2?.top;
  }

  @override
  int hash(PromotionRecord? e) => const ListEquality().hash([
    e?.title,
    e?.subtitle,
    e?.img,
    e?.cityLink,
    e?.status,
    e?.moderation,
    e?.top
  ]);

  @override
  bool isValidKey(Object? o) => o is PromotionRecord;
}
