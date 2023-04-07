// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_notifications_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<CompanyNotificationsRecord> _$companyNotificationsRecordSerializer =
    new _$CompanyNotificationsRecordSerializer();

class _$CompanyNotificationsRecordSerializer
    implements StructuredSerializer<CompanyNotificationsRecord> {
  @override
  final Iterable<Type> types = const [
    CompanyNotificationsRecord,
    _$CompanyNotificationsRecord
  ];
  @override
  final String wireName = 'CompanyNotificationsRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, CompanyNotificationsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.message;
    if (value != null) {
      result
        ..add('message')
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
    value = object.opened;
    if (value != null) {
      result
        ..add('opened')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.bookingRef;
    if (value != null) {
      result
        ..add('booking_ref')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.promotionRef;
    if (value != null) {
      result
        ..add('promotion_ref')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.type;
    if (value != null) {
      result
        ..add('type')
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
  CompanyNotificationsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CompanyNotificationsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'message':
          result.message = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'date':
          result.date = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'opened':
          result.opened = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'booking_ref':
          result.bookingRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'promotion_ref':
          result.promotionRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'type':
          result.type = serializers.deserialize(value,
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

class _$CompanyNotificationsRecord extends CompanyNotificationsRecord {
  @override
  final String? message;
  @override
  final DateTime? date;
  @override
  final bool? opened;
  @override
  final DocumentReference<Object?>? bookingRef;
  @override
  final DocumentReference<Object?>? promotionRef;
  @override
  final String? type;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$CompanyNotificationsRecord(
          [void Function(CompanyNotificationsRecordBuilder)? updates]) =>
      (new CompanyNotificationsRecordBuilder()..update(updates))._build();

  _$CompanyNotificationsRecord._(
      {this.message,
      this.date,
      this.opened,
      this.bookingRef,
      this.promotionRef,
      this.type,
      this.ffRef})
      : super._();

  @override
  CompanyNotificationsRecord rebuild(
          void Function(CompanyNotificationsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CompanyNotificationsRecordBuilder toBuilder() =>
      new CompanyNotificationsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CompanyNotificationsRecord &&
        message == other.message &&
        date == other.date &&
        opened == other.opened &&
        bookingRef == other.bookingRef &&
        promotionRef == other.promotionRef &&
        type == other.type &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, message.hashCode);
    _$hash = $jc(_$hash, date.hashCode);
    _$hash = $jc(_$hash, opened.hashCode);
    _$hash = $jc(_$hash, bookingRef.hashCode);
    _$hash = $jc(_$hash, promotionRef.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CompanyNotificationsRecord')
          ..add('message', message)
          ..add('date', date)
          ..add('opened', opened)
          ..add('bookingRef', bookingRef)
          ..add('promotionRef', promotionRef)
          ..add('type', type)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class CompanyNotificationsRecordBuilder
    implements
        Builder<CompanyNotificationsRecord, CompanyNotificationsRecordBuilder> {
  _$CompanyNotificationsRecord? _$v;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  DateTime? _date;
  DateTime? get date => _$this._date;
  set date(DateTime? date) => _$this._date = date;

  bool? _opened;
  bool? get opened => _$this._opened;
  set opened(bool? opened) => _$this._opened = opened;

  DocumentReference<Object?>? _bookingRef;
  DocumentReference<Object?>? get bookingRef => _$this._bookingRef;
  set bookingRef(DocumentReference<Object?>? bookingRef) =>
      _$this._bookingRef = bookingRef;

  DocumentReference<Object?>? _promotionRef;
  DocumentReference<Object?>? get promotionRef => _$this._promotionRef;
  set promotionRef(DocumentReference<Object?>? promotionRef) =>
      _$this._promotionRef = promotionRef;

  String? _type;
  String? get type => _$this._type;
  set type(String? type) => _$this._type = type;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  CompanyNotificationsRecordBuilder() {
    CompanyNotificationsRecord._initializeBuilder(this);
  }

  CompanyNotificationsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _message = $v.message;
      _date = $v.date;
      _opened = $v.opened;
      _bookingRef = $v.bookingRef;
      _promotionRef = $v.promotionRef;
      _type = $v.type;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CompanyNotificationsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CompanyNotificationsRecord;
  }

  @override
  void update(void Function(CompanyNotificationsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CompanyNotificationsRecord build() => _build();

  _$CompanyNotificationsRecord _build() {
    final _$result = _$v ??
        new _$CompanyNotificationsRecord._(
            message: message,
            date: date,
            opened: opened,
            bookingRef: bookingRef,
            promotionRef: promotionRef,
            type: type,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
