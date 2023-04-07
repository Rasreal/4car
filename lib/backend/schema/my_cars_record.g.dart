// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_cars_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<MyCarsRecord> _$myCarsRecordSerializer =
    new _$MyCarsRecordSerializer();

class _$MyCarsRecordSerializer implements StructuredSerializer<MyCarsRecord> {
  @override
  final Iterable<Type> types = const [MyCarsRecord, _$MyCarsRecord];
  @override
  final String wireName = 'MyCarsRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, MyCarsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.carNum;
    if (value != null) {
      result
        ..add('car_num')
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
    value = object.carOrder;
    if (value != null) {
      result
        ..add('car_order')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.linkBody;
    if (value != null) {
      result
        ..add('link_body')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
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
  MyCarsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MyCarsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'car_num':
          result.carNum = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'car_body':
          result.carBody = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'car_order':
          result.carOrder = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'link_body':
          result.linkBody = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
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

class _$MyCarsRecord extends MyCarsRecord {
  @override
  final String? carNum;
  @override
  final String? carBody;
  @override
  final int? carOrder;
  @override
  final DocumentReference<Object?>? linkBody;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$MyCarsRecord([void Function(MyCarsRecordBuilder)? updates]) =>
      (new MyCarsRecordBuilder()..update(updates))._build();

  _$MyCarsRecord._(
      {this.carNum, this.carBody, this.carOrder, this.linkBody, this.ffRef})
      : super._();

  @override
  MyCarsRecord rebuild(void Function(MyCarsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MyCarsRecordBuilder toBuilder() => new MyCarsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MyCarsRecord &&
        carNum == other.carNum &&
        carBody == other.carBody &&
        carOrder == other.carOrder &&
        linkBody == other.linkBody &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, carNum.hashCode);
    _$hash = $jc(_$hash, carBody.hashCode);
    _$hash = $jc(_$hash, carOrder.hashCode);
    _$hash = $jc(_$hash, linkBody.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'MyCarsRecord')
          ..add('carNum', carNum)
          ..add('carBody', carBody)
          ..add('carOrder', carOrder)
          ..add('linkBody', linkBody)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class MyCarsRecordBuilder
    implements Builder<MyCarsRecord, MyCarsRecordBuilder> {
  _$MyCarsRecord? _$v;

  String? _carNum;
  String? get carNum => _$this._carNum;
  set carNum(String? carNum) => _$this._carNum = carNum;

  String? _carBody;
  String? get carBody => _$this._carBody;
  set carBody(String? carBody) => _$this._carBody = carBody;

  int? _carOrder;
  int? get carOrder => _$this._carOrder;
  set carOrder(int? carOrder) => _$this._carOrder = carOrder;

  DocumentReference<Object?>? _linkBody;
  DocumentReference<Object?>? get linkBody => _$this._linkBody;
  set linkBody(DocumentReference<Object?>? linkBody) =>
      _$this._linkBody = linkBody;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  MyCarsRecordBuilder() {
    MyCarsRecord._initializeBuilder(this);
  }

  MyCarsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _carNum = $v.carNum;
      _carBody = $v.carBody;
      _carOrder = $v.carOrder;
      _linkBody = $v.linkBody;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MyCarsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MyCarsRecord;
  }

  @override
  void update(void Function(MyCarsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  MyCarsRecord build() => _build();

  _$MyCarsRecord _build() {
    final _$result = _$v ??
        new _$MyCarsRecord._(
            carNum: carNum,
            carBody: carBody,
            carOrder: carOrder,
            linkBody: linkBody,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
