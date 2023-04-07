// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car_body_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<CarBodyRecord> _$carBodyRecordSerializer =
    new _$CarBodyRecordSerializer();

class _$CarBodyRecordSerializer implements StructuredSerializer<CarBodyRecord> {
  @override
  final Iterable<Type> types = const [CarBodyRecord, _$CarBodyRecord];
  @override
  final String wireName = 'CarBodyRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, CarBodyRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.bodyName;
    if (value != null) {
      result
        ..add('body_name')
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
  CarBodyRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CarBodyRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'body_name':
          result.bodyName = serializers.deserialize(value,
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

class _$CarBodyRecord extends CarBodyRecord {
  @override
  final String? bodyName;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$CarBodyRecord([void Function(CarBodyRecordBuilder)? updates]) =>
      (new CarBodyRecordBuilder()..update(updates))._build();

  _$CarBodyRecord._({this.bodyName, this.ffRef}) : super._();

  @override
  CarBodyRecord rebuild(void Function(CarBodyRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CarBodyRecordBuilder toBuilder() => new CarBodyRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CarBodyRecord &&
        bodyName == other.bodyName &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, bodyName.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CarBodyRecord')
          ..add('bodyName', bodyName)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class CarBodyRecordBuilder
    implements Builder<CarBodyRecord, CarBodyRecordBuilder> {
  _$CarBodyRecord? _$v;

  String? _bodyName;
  String? get bodyName => _$this._bodyName;
  set bodyName(String? bodyName) => _$this._bodyName = bodyName;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  CarBodyRecordBuilder() {
    CarBodyRecord._initializeBuilder(this);
  }

  CarBodyRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _bodyName = $v.bodyName;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CarBodyRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CarBodyRecord;
  }

  @override
  void update(void Function(CarBodyRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CarBodyRecord build() => _build();

  _$CarBodyRecord _build() {
    final _$result =
        _$v ?? new _$CarBodyRecord._(bodyName: bodyName, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
