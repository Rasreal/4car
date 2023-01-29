// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forcar_times_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ForcarTimesRecord> _$forcarTimesRecordSerializer =
    new _$ForcarTimesRecordSerializer();

class _$ForcarTimesRecordSerializer
    implements StructuredSerializer<ForcarTimesRecord> {
  @override
  final Iterable<Type> types = const [ForcarTimesRecord, _$ForcarTimesRecord];
  @override
  final String wireName = 'ForcarTimesRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, ForcarTimesRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.timeName;
    if (value != null) {
      result
        ..add('time_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.timeOrder;
    if (value != null) {
      result
        ..add('time_order')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
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
  ForcarTimesRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ForcarTimesRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'time_name':
          result.timeName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'time_order':
          result.timeOrder = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
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

class _$ForcarTimesRecord extends ForcarTimesRecord {
  @override
  final String? timeName;
  @override
  final int? timeOrder;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$ForcarTimesRecord(
          [void Function(ForcarTimesRecordBuilder)? updates]) =>
      (new ForcarTimesRecordBuilder()..update(updates))._build();

  _$ForcarTimesRecord._({this.timeName, this.timeOrder, this.ffRef})
      : super._();

  @override
  ForcarTimesRecord rebuild(void Function(ForcarTimesRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ForcarTimesRecordBuilder toBuilder() =>
      new ForcarTimesRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ForcarTimesRecord &&
        timeName == other.timeName &&
        timeOrder == other.timeOrder &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc(0, timeName.hashCode), timeOrder.hashCode), ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ForcarTimesRecord')
          ..add('timeName', timeName)
          ..add('timeOrder', timeOrder)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class ForcarTimesRecordBuilder
    implements Builder<ForcarTimesRecord, ForcarTimesRecordBuilder> {
  _$ForcarTimesRecord? _$v;

  String? _timeName;
  String? get timeName => _$this._timeName;
  set timeName(String? timeName) => _$this._timeName = timeName;

  int? _timeOrder;
  int? get timeOrder => _$this._timeOrder;
  set timeOrder(int? timeOrder) => _$this._timeOrder = timeOrder;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  ForcarTimesRecordBuilder() {
    ForcarTimesRecord._initializeBuilder(this);
  }

  ForcarTimesRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _timeName = $v.timeName;
      _timeOrder = $v.timeOrder;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ForcarTimesRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ForcarTimesRecord;
  }

  @override
  void update(void Function(ForcarTimesRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ForcarTimesRecord build() => _build();

  _$ForcarTimesRecord _build() {
    final _$result = _$v ??
        new _$ForcarTimesRecord._(
            timeName: timeName, timeOrder: timeOrder, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
