// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cityes_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<CityesRecord> _$cityesRecordSerializer =
    new _$CityesRecordSerializer();

class _$CityesRecordSerializer implements StructuredSerializer<CityesRecord> {
  @override
  final Iterable<Type> types = const [CityesRecord, _$CityesRecord];
  @override
  final String wireName = 'CityesRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, CityesRecord object,
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
    value = object.location;
    if (value != null) {
      result
        ..add('location')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(LatLng)));
    }
    value = object.first;
    if (value != null) {
      result
        ..add('first')
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
  CityesRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CityesRecordBuilder();

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
        case 'location':
          result.location = serializers.deserialize(value,
              specifiedType: const FullType(LatLng)) as LatLng?;
          break;
        case 'first':
          result.first = serializers.deserialize(value,
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

class _$CityesRecord extends CityesRecord {
  @override
  final String? name;
  @override
  final LatLng? location;
  @override
  final String? first;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$CityesRecord([void Function(CityesRecordBuilder)? updates]) =>
      (new CityesRecordBuilder()..update(updates))._build();

  _$CityesRecord._({this.name, this.location, this.first, this.ffRef})
      : super._();

  @override
  CityesRecord rebuild(void Function(CityesRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CityesRecordBuilder toBuilder() => new CityesRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CityesRecord &&
        name == other.name &&
        location == other.location &&
        first == other.first &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, location.hashCode);
    _$hash = $jc(_$hash, first.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CityesRecord')
          ..add('name', name)
          ..add('location', location)
          ..add('first', first)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class CityesRecordBuilder
    implements Builder<CityesRecord, CityesRecordBuilder> {
  _$CityesRecord? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  LatLng? _location;
  LatLng? get location => _$this._location;
  set location(LatLng? location) => _$this._location = location;

  String? _first;
  String? get first => _$this._first;
  set first(String? first) => _$this._first = first;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  CityesRecordBuilder() {
    CityesRecord._initializeBuilder(this);
  }

  CityesRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _location = $v.location;
      _first = $v.first;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CityesRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CityesRecord;
  }

  @override
  void update(void Function(CityesRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CityesRecord build() => _build();

  _$CityesRecord _build() {
    final _$result = _$v ??
        new _$CityesRecord._(
            name: name, location: location, first: first, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
