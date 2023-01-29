// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_permissions_struct.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UserPermissionsStruct> _$userPermissionsStructSerializer =
    new _$UserPermissionsStructSerializer();

class _$UserPermissionsStructSerializer
    implements StructuredSerializer<UserPermissionsStruct> {
  @override
  final Iterable<Type> types = const [
    UserPermissionsStruct,
    _$UserPermissionsStruct
  ];
  @override
  final String wireName = 'UserPermissionsStruct';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, UserPermissionsStruct object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'firestoreUtilData',
      serializers.serialize(object.firestoreUtilData,
          specifiedType: const FullType(FirestoreUtilData)),
    ];
    Object? value;
    value = object.createBooking;
    if (value != null) {
      result
        ..add('create_booking')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.readBooking;
    if (value != null) {
      result
        ..add('read_booking')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.updateBooking;
    if (value != null) {
      result
        ..add('update_booking')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.deleteBooking;
    if (value != null) {
      result
        ..add('delete_booking')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.createCompany;
    if (value != null) {
      result
        ..add('create_company')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.readCompany;
    if (value != null) {
      result
        ..add('read_company')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.updateCompany;
    if (value != null) {
      result
        ..add('update_company')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.deleteCompany;
    if (value != null) {
      result
        ..add('delete_company')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    return result;
  }

  @override
  UserPermissionsStruct deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UserPermissionsStructBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'create_booking':
          result.createBooking = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'read_booking':
          result.readBooking = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'update_booking':
          result.updateBooking = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'delete_booking':
          result.deleteBooking = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'create_company':
          result.createCompany = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'read_company':
          result.readCompany = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'update_company':
          result.updateCompany = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'delete_company':
          result.deleteCompany = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'firestoreUtilData':
          result.firestoreUtilData = serializers.deserialize(value,
                  specifiedType: const FullType(FirestoreUtilData))!
              as FirestoreUtilData;
          break;
      }
    }

    return result.build();
  }
}

class _$UserPermissionsStruct extends UserPermissionsStruct {
  @override
  final bool? createBooking;
  @override
  final bool? readBooking;
  @override
  final bool? updateBooking;
  @override
  final bool? deleteBooking;
  @override
  final bool? createCompany;
  @override
  final bool? readCompany;
  @override
  final bool? updateCompany;
  @override
  final bool? deleteCompany;
  @override
  final FirestoreUtilData firestoreUtilData;

  factory _$UserPermissionsStruct(
          [void Function(UserPermissionsStructBuilder)? updates]) =>
      (new UserPermissionsStructBuilder()..update(updates))._build();

  _$UserPermissionsStruct._(
      {this.createBooking,
      this.readBooking,
      this.updateBooking,
      this.deleteBooking,
      this.createCompany,
      this.readCompany,
      this.updateCompany,
      this.deleteCompany,
      required this.firestoreUtilData})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        firestoreUtilData, r'UserPermissionsStruct', 'firestoreUtilData');
  }

  @override
  UserPermissionsStruct rebuild(
          void Function(UserPermissionsStructBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserPermissionsStructBuilder toBuilder() =>
      new UserPermissionsStructBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserPermissionsStruct &&
        createBooking == other.createBooking &&
        readBooking == other.readBooking &&
        updateBooking == other.updateBooking &&
        deleteBooking == other.deleteBooking &&
        createCompany == other.createCompany &&
        readCompany == other.readCompany &&
        updateCompany == other.updateCompany &&
        deleteCompany == other.deleteCompany &&
        firestoreUtilData == other.firestoreUtilData;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc($jc(0, createBooking.hashCode),
                                    readBooking.hashCode),
                                updateBooking.hashCode),
                            deleteBooking.hashCode),
                        createCompany.hashCode),
                    readCompany.hashCode),
                updateCompany.hashCode),
            deleteCompany.hashCode),
        firestoreUtilData.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UserPermissionsStruct')
          ..add('createBooking', createBooking)
          ..add('readBooking', readBooking)
          ..add('updateBooking', updateBooking)
          ..add('deleteBooking', deleteBooking)
          ..add('createCompany', createCompany)
          ..add('readCompany', readCompany)
          ..add('updateCompany', updateCompany)
          ..add('deleteCompany', deleteCompany)
          ..add('firestoreUtilData', firestoreUtilData))
        .toString();
  }
}

class UserPermissionsStructBuilder
    implements Builder<UserPermissionsStruct, UserPermissionsStructBuilder> {
  _$UserPermissionsStruct? _$v;

  bool? _createBooking;
  bool? get createBooking => _$this._createBooking;
  set createBooking(bool? createBooking) =>
      _$this._createBooking = createBooking;

  bool? _readBooking;
  bool? get readBooking => _$this._readBooking;
  set readBooking(bool? readBooking) => _$this._readBooking = readBooking;

  bool? _updateBooking;
  bool? get updateBooking => _$this._updateBooking;
  set updateBooking(bool? updateBooking) =>
      _$this._updateBooking = updateBooking;

  bool? _deleteBooking;
  bool? get deleteBooking => _$this._deleteBooking;
  set deleteBooking(bool? deleteBooking) =>
      _$this._deleteBooking = deleteBooking;

  bool? _createCompany;
  bool? get createCompany => _$this._createCompany;
  set createCompany(bool? createCompany) =>
      _$this._createCompany = createCompany;

  bool? _readCompany;
  bool? get readCompany => _$this._readCompany;
  set readCompany(bool? readCompany) => _$this._readCompany = readCompany;

  bool? _updateCompany;
  bool? get updateCompany => _$this._updateCompany;
  set updateCompany(bool? updateCompany) =>
      _$this._updateCompany = updateCompany;

  bool? _deleteCompany;
  bool? get deleteCompany => _$this._deleteCompany;
  set deleteCompany(bool? deleteCompany) =>
      _$this._deleteCompany = deleteCompany;

  FirestoreUtilData? _firestoreUtilData;
  FirestoreUtilData? get firestoreUtilData => _$this._firestoreUtilData;
  set firestoreUtilData(FirestoreUtilData? firestoreUtilData) =>
      _$this._firestoreUtilData = firestoreUtilData;

  UserPermissionsStructBuilder() {
    UserPermissionsStruct._initializeBuilder(this);
  }

  UserPermissionsStructBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _createBooking = $v.createBooking;
      _readBooking = $v.readBooking;
      _updateBooking = $v.updateBooking;
      _deleteBooking = $v.deleteBooking;
      _createCompany = $v.createCompany;
      _readCompany = $v.readCompany;
      _updateCompany = $v.updateCompany;
      _deleteCompany = $v.deleteCompany;
      _firestoreUtilData = $v.firestoreUtilData;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserPermissionsStruct other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserPermissionsStruct;
  }

  @override
  void update(void Function(UserPermissionsStructBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserPermissionsStruct build() => _build();

  _$UserPermissionsStruct _build() {
    final _$result = _$v ??
        new _$UserPermissionsStruct._(
            createBooking: createBooking,
            readBooking: readBooking,
            updateBooking: updateBooking,
            deleteBooking: deleteBooking,
            createCompany: createCompany,
            readCompany: readCompany,
            updateCompany: updateCompany,
            deleteCompany: deleteCompany,
            firestoreUtilData: BuiltValueNullFieldError.checkNotNull(
                firestoreUtilData,
                r'UserPermissionsStruct',
                'firestoreUtilData'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
