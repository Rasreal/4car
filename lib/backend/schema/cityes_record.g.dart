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
  final DocumentReference<Object?>? ffRef;

  factory _$CityesRecord([void Function(CityesRecordBuilder)? updates]) =>
      (new CityesRecordBuilder()..update(updates))._build();

  _$CityesRecord._({this.name, this.location, this.ffRef}) : super._();

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
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, name.hashCode), location.hashCode), ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CityesRecord')
          ..add('name', name)
          ..add('location', location)
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
        new _$CityesRecord._(name: name, location: location, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
