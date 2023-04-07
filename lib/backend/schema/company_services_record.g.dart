// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_services_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<CompanyServicesRecord> _$companyServicesRecordSerializer =
    new _$CompanyServicesRecordSerializer();

class _$CompanyServicesRecordSerializer
    implements StructuredSerializer<CompanyServicesRecord> {
  @override
  final Iterable<Type> types = const [
    CompanyServicesRecord,
    _$CompanyServicesRecord
  ];
  @override
  final String wireName = 'CompanyServicesRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, CompanyServicesRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.carBody;
    if (value != null) {
      result
        ..add('car_body')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.price;
    if (value != null) {
      result
        ..add('price')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.duration;
    if (value != null) {
      result
        ..add('duration')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.durationName;
    if (value != null) {
      result
        ..add('duration_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
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
  CompanyServicesRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CompanyServicesRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'car_body':
          result.carBody = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'price':
          result.price = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'duration':
          result.duration = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'duration_name':
          result.durationName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
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

class _$CompanyServicesRecord extends CompanyServicesRecord {
  @override
  final String? name;
  @override
  final String? carBody;
  @override
  final double? price;
  @override
  final int? duration;
  @override
  final String? durationName;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$CompanyServicesRecord(
          [void Function(CompanyServicesRecordBuilder)? updates]) =>
      (new CompanyServicesRecordBuilder()..update(updates))._build();

  _$CompanyServicesRecord._(
      {this.name,
      this.carBody,
      this.price,
      this.duration,
      this.durationName,
      this.ffRef})
      : super._();

  @override
  CompanyServicesRecord rebuild(
          void Function(CompanyServicesRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CompanyServicesRecordBuilder toBuilder() =>
      new CompanyServicesRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CompanyServicesRecord &&
        name == other.name &&
        carBody == other.carBody &&
        price == other.price &&
        duration == other.duration &&
        durationName == other.durationName &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, carBody.hashCode);
    _$hash = $jc(_$hash, price.hashCode);
    _$hash = $jc(_$hash, duration.hashCode);
    _$hash = $jc(_$hash, durationName.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CompanyServicesRecord')
          ..add('name', name)
          ..add('carBody', carBody)
          ..add('price', price)
          ..add('duration', duration)
          ..add('durationName', durationName)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class CompanyServicesRecordBuilder
    implements Builder<CompanyServicesRecord, CompanyServicesRecordBuilder> {
  _$CompanyServicesRecord? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _carBody;
  String? get carBody => _$this._carBody;
  set carBody(String? carBody) => _$this._carBody = carBody;

  double? _price;
  double? get price => _$this._price;
  set price(double? price) => _$this._price = price;

  int? _duration;
  int? get duration => _$this._duration;
  set duration(int? duration) => _$this._duration = duration;

  String? _durationName;
  String? get durationName => _$this._durationName;
  set durationName(String? durationName) => _$this._durationName = durationName;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  CompanyServicesRecordBuilder() {
    CompanyServicesRecord._initializeBuilder(this);
  }

  CompanyServicesRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _carBody = $v.carBody;
      _price = $v.price;
      _duration = $v.duration;
      _durationName = $v.durationName;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CompanyServicesRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CompanyServicesRecord;
  }

  @override
  void update(void Function(CompanyServicesRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CompanyServicesRecord build() => _build();

  _$CompanyServicesRecord _build() {
    final _$result = _$v ??
        new _$CompanyServicesRecord._(
            name: name,
            carBody: carBody,
            price: price,
            duration: duration,
            durationName: durationName,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
