// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'promotion_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PromotionRecord> _$promotionRecordSerializer =
    new _$PromotionRecordSerializer();

class _$PromotionRecordSerializer
    implements StructuredSerializer<PromotionRecord> {
  @override
  final Iterable<Type> types = const [PromotionRecord, _$PromotionRecord];
  @override
  final String wireName = 'PromotionRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, PromotionRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.title;
    if (value != null) {
      result
        ..add('title')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.subtitle;
    if (value != null) {
      result
        ..add('subtitle')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.img;
    if (value != null) {
      result
        ..add('img')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.cityLink;
    if (value != null) {
      result
        ..add('city_link')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.status;
    if (value != null) {
      result
        ..add('status')
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
  PromotionRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PromotionRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'subtitle':
          result.subtitle = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'img':
          result.img = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'city_link':
          result.cityLink = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'status':
          result.status = serializers.deserialize(value,
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

class _$PromotionRecord extends PromotionRecord {
  @override
  final String? title;
  @override
  final String? subtitle;
  @override
  final String? img;
  @override
  final DocumentReference<Object?>? cityLink;
  @override
  final String? status;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$PromotionRecord([void Function(PromotionRecordBuilder)? updates]) =>
      (new PromotionRecordBuilder()..update(updates))._build();

  _$PromotionRecord._(
      {this.title,
      this.subtitle,
      this.img,
      this.cityLink,
      this.status,
      this.ffRef})
      : super._();

  @override
  PromotionRecord rebuild(void Function(PromotionRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PromotionRecordBuilder toBuilder() =>
      new PromotionRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PromotionRecord &&
        title == other.title &&
        subtitle == other.subtitle &&
        img == other.img &&
        cityLink == other.cityLink &&
        status == other.status &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, title.hashCode), subtitle.hashCode),
                    img.hashCode),
                cityLink.hashCode),
            status.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PromotionRecord')
          ..add('title', title)
          ..add('subtitle', subtitle)
          ..add('img', img)
          ..add('cityLink', cityLink)
          ..add('status', status)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class PromotionRecordBuilder
    implements Builder<PromotionRecord, PromotionRecordBuilder> {
  _$PromotionRecord? _$v;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  String? _subtitle;
  String? get subtitle => _$this._subtitle;
  set subtitle(String? subtitle) => _$this._subtitle = subtitle;

  String? _img;
  String? get img => _$this._img;
  set img(String? img) => _$this._img = img;

  DocumentReference<Object?>? _cityLink;
  DocumentReference<Object?>? get cityLink => _$this._cityLink;
  set cityLink(DocumentReference<Object?>? cityLink) =>
      _$this._cityLink = cityLink;

  String? _status;
  String? get status => _$this._status;
  set status(String? status) => _$this._status = status;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  PromotionRecordBuilder() {
    PromotionRecord._initializeBuilder(this);
  }

  PromotionRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _title = $v.title;
      _subtitle = $v.subtitle;
      _img = $v.img;
      _cityLink = $v.cityLink;
      _status = $v.status;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PromotionRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PromotionRecord;
  }

  @override
  void update(void Function(PromotionRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PromotionRecord build() => _build();

  _$PromotionRecord _build() {
    final _$result = _$v ??
        new _$PromotionRecord._(
            title: title,
            subtitle: subtitle,
            img: img,
            cityLink: cityLink,
            status: status,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
