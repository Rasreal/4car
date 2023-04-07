// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'analytics_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AnalyticsRecord> _$analyticsRecordSerializer =
    new _$AnalyticsRecordSerializer();

class _$AnalyticsRecordSerializer
    implements StructuredSerializer<AnalyticsRecord> {
  @override
  final Iterable<Type> types = const [AnalyticsRecord, _$AnalyticsRecord];
  @override
  final String wireName = 'AnalyticsRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, AnalyticsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.dateSum;
    if (value != null) {
      result
        ..add('date_sum')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.price;
    if (value != null) {
      result
        ..add('price')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.dateStringDMY;
    if (value != null) {
      result
        ..add('dateStringDMY')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
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
  AnalyticsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AnalyticsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'date_sum':
          result.dateSum = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'price':
          result.price = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'dateStringDMY':
          result.dateStringDMY = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
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

class _$AnalyticsRecord extends AnalyticsRecord {
  @override
  final int? dateSum;
  @override
  final double? price;
  @override
  final String? dateStringDMY;
  @override
  final DateTime? date;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$AnalyticsRecord([void Function(AnalyticsRecordBuilder)? updates]) =>
      (new AnalyticsRecordBuilder()..update(updates))._build();

  _$AnalyticsRecord._(
      {this.dateSum, this.price, this.dateStringDMY, this.date, this.ffRef})
      : super._();

  @override
  AnalyticsRecord rebuild(void Function(AnalyticsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AnalyticsRecordBuilder toBuilder() =>
      new AnalyticsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AnalyticsRecord &&
        dateSum == other.dateSum &&
        price == other.price &&
        dateStringDMY == other.dateStringDMY &&
        date == other.date &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, dateSum.hashCode);
    _$hash = $jc(_$hash, price.hashCode);
    _$hash = $jc(_$hash, dateStringDMY.hashCode);
    _$hash = $jc(_$hash, date.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AnalyticsRecord')
          ..add('dateSum', dateSum)
          ..add('price', price)
          ..add('dateStringDMY', dateStringDMY)
          ..add('date', date)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class AnalyticsRecordBuilder
    implements Builder<AnalyticsRecord, AnalyticsRecordBuilder> {
  _$AnalyticsRecord? _$v;

  int? _dateSum;
  int? get dateSum => _$this._dateSum;
  set dateSum(int? dateSum) => _$this._dateSum = dateSum;

  double? _price;
  double? get price => _$this._price;
  set price(double? price) => _$this._price = price;

  String? _dateStringDMY;
  String? get dateStringDMY => _$this._dateStringDMY;
  set dateStringDMY(String? dateStringDMY) =>
      _$this._dateStringDMY = dateStringDMY;

  DateTime? _date;
  DateTime? get date => _$this._date;
  set date(DateTime? date) => _$this._date = date;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  AnalyticsRecordBuilder() {
    AnalyticsRecord._initializeBuilder(this);
  }

  AnalyticsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _dateSum = $v.dateSum;
      _price = $v.price;
      _dateStringDMY = $v.dateStringDMY;
      _date = $v.date;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AnalyticsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AnalyticsRecord;
  }

  @override
  void update(void Function(AnalyticsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AnalyticsRecord build() => _build();

  _$AnalyticsRecord _build() {
    final _$result = _$v ??
        new _$AnalyticsRecord._(
            dateSum: dateSum,
            price: price,
            dateStringDMY: dateStringDMY,
            date: date,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
