// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'analytics_forcar_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AnalyticsForcarRecord> _$analyticsForcarRecordSerializer =
    new _$AnalyticsForcarRecordSerializer();

class _$AnalyticsForcarRecordSerializer
    implements StructuredSerializer<AnalyticsForcarRecord> {
  @override
  final Iterable<Type> types = const [
    AnalyticsForcarRecord,
    _$AnalyticsForcarRecord
  ];
  @override
  final String wireName = 'AnalyticsForcarRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, AnalyticsForcarRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.oborot;
    if (value != null) {
      result
        ..add('oborot')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.dateStringDMY;
    if (value != null) {
      result
        ..add('dateStringDMY')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.day;
    if (value != null) {
      result
        ..add('day')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.date;
    if (value != null) {
      result
        ..add('date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.ffRef;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    return result;
  }

  @override
  AnalyticsForcarRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AnalyticsForcarRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'oborot':
          result.oborot = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'dateStringDMY':
          result.dateStringDMY = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'day':
          result.day = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'date':
          result.date = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'Document__Reference__Field':
          result.ffRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
      }
    }

    return result.build();
  }
}

class _$AnalyticsForcarRecord extends AnalyticsForcarRecord {
  @override
  final int? oborot;
  @override
  final String? dateStringDMY;
  @override
  final int? day;
  @override
  final DateTime? date;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$AnalyticsForcarRecord(
          [void Function(AnalyticsForcarRecordBuilder)? updates]) =>
      (new AnalyticsForcarRecordBuilder()..update(updates))._build();

  _$AnalyticsForcarRecord._(
      {this.oborot, this.dateStringDMY, this.day, this.date, this.ffRef})
      : super._();

  @override
  AnalyticsForcarRecord rebuild(
          void Function(AnalyticsForcarRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AnalyticsForcarRecordBuilder toBuilder() =>
      new AnalyticsForcarRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AnalyticsForcarRecord &&
        oborot == other.oborot &&
        dateStringDMY == other.dateStringDMY &&
        day == other.day &&
        date == other.date &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, oborot.hashCode);
    _$hash = $jc(_$hash, dateStringDMY.hashCode);
    _$hash = $jc(_$hash, day.hashCode);
    _$hash = $jc(_$hash, date.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AnalyticsForcarRecord')
          ..add('oborot', oborot)
          ..add('dateStringDMY', dateStringDMY)
          ..add('day', day)
          ..add('date', date)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class AnalyticsForcarRecordBuilder
    implements Builder<AnalyticsForcarRecord, AnalyticsForcarRecordBuilder> {
  _$AnalyticsForcarRecord? _$v;

  int? _oborot;
  int? get oborot => _$this._oborot;
  set oborot(int? oborot) => _$this._oborot = oborot;

  String? _dateStringDMY;
  String? get dateStringDMY => _$this._dateStringDMY;
  set dateStringDMY(String? dateStringDMY) =>
      _$this._dateStringDMY = dateStringDMY;

  int? _day;
  int? get day => _$this._day;
  set day(int? day) => _$this._day = day;

  DateTime? _date;
  DateTime? get date => _$this._date;
  set date(DateTime? date) => _$this._date = date;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  AnalyticsForcarRecordBuilder() {
    AnalyticsForcarRecord._initializeBuilder(this);
  }

  AnalyticsForcarRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _oborot = $v.oborot;
      _dateStringDMY = $v.dateStringDMY;
      _day = $v.day;
      _date = $v.date;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AnalyticsForcarRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AnalyticsForcarRecord;
  }

  @override
  void update(void Function(AnalyticsForcarRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AnalyticsForcarRecord build() => _build();

  _$AnalyticsForcarRecord _build() {
    final _$result = _$v ??
        new _$AnalyticsForcarRecord._(
            oborot: oborot,
            dateStringDMY: dateStringDMY,
            day: day,
            date: date,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
