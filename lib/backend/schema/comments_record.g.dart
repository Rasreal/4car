// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comments_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<CommentsRecord> _$commentsRecordSerializer =
    new _$CommentsRecordSerializer();

class _$CommentsRecordSerializer
    implements StructuredSerializer<CommentsRecord> {
  @override
  final Iterable<Type> types = const [CommentsRecord, _$CommentsRecord];
  @override
  final String wireName = 'CommentsRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, CommentsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.comment;
    if (value != null) {
      result
        ..add('comment')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.createdBy;
    if (value != null) {
      result
        ..add('created_by')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.createdAt;
    if (value != null) {
      result
        ..add('created_at')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.company;
    if (value != null) {
      result
        ..add('company')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.rating;
    if (value != null) {
      result
        ..add('rating')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.booleanResponse;
    if (value != null) {
      result
        ..add('boolean_response')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.responseComment;
    if (value != null) {
      result
        ..add('response_comment')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.bookedComment;
    if (value != null) {
      result
        ..add('booked_comment')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.bookingDoc;
    if (value != null) {
      result
        ..add('bookingDoc')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.obtobotan;
    if (value != null) {
      result
        ..add('obtobotan')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
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
  CommentsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CommentsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'comment':
          result.comment = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'created_by':
          result.createdBy = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'created_at':
          result.createdAt = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'company':
          result.company = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'rating':
          result.rating = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'boolean_response':
          result.booleanResponse = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'response_comment':
          result.responseComment = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'booked_comment':
          result.bookedComment = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'bookingDoc':
          result.bookingDoc = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'obtobotan':
          result.obtobotan = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
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

class _$CommentsRecord extends CommentsRecord {
  @override
  final String? comment;
  @override
  final DocumentReference<Object?>? createdBy;
  @override
  final DateTime? createdAt;
  @override
  final DocumentReference<Object?>? company;
  @override
  final double? rating;
  @override
  final bool? booleanResponse;
  @override
  final String? responseComment;
  @override
  final bool? bookedComment;
  @override
  final DocumentReference<Object?>? bookingDoc;
  @override
  final bool? obtobotan;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$CommentsRecord([void Function(CommentsRecordBuilder)? updates]) =>
      (new CommentsRecordBuilder()..update(updates))._build();

  _$CommentsRecord._(
      {this.comment,
      this.createdBy,
      this.createdAt,
      this.company,
      this.rating,
      this.booleanResponse,
      this.responseComment,
      this.bookedComment,
      this.bookingDoc,
      this.obtobotan,
      this.ffRef})
      : super._();

  @override
  CommentsRecord rebuild(void Function(CommentsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CommentsRecordBuilder toBuilder() =>
      new CommentsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CommentsRecord &&
        comment == other.comment &&
        createdBy == other.createdBy &&
        createdAt == other.createdAt &&
        company == other.company &&
        rating == other.rating &&
        booleanResponse == other.booleanResponse &&
        responseComment == other.responseComment &&
        bookedComment == other.bookedComment &&
        bookingDoc == other.bookingDoc &&
        obtobotan == other.obtobotan &&
        ffRef == other.ffRef;
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
                                $jc(
                                    $jc(
                                        $jc($jc(0, comment.hashCode),
                                            createdBy.hashCode),
                                        createdAt.hashCode),
                                    company.hashCode),
                                rating.hashCode),
                            booleanResponse.hashCode),
                        responseComment.hashCode),
                    bookedComment.hashCode),
                bookingDoc.hashCode),
            obtobotan.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CommentsRecord')
          ..add('comment', comment)
          ..add('createdBy', createdBy)
          ..add('createdAt', createdAt)
          ..add('company', company)
          ..add('rating', rating)
          ..add('booleanResponse', booleanResponse)
          ..add('responseComment', responseComment)
          ..add('bookedComment', bookedComment)
          ..add('bookingDoc', bookingDoc)
          ..add('obtobotan', obtobotan)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class CommentsRecordBuilder
    implements Builder<CommentsRecord, CommentsRecordBuilder> {
  _$CommentsRecord? _$v;

  String? _comment;
  String? get comment => _$this._comment;
  set comment(String? comment) => _$this._comment = comment;

  DocumentReference<Object?>? _createdBy;
  DocumentReference<Object?>? get createdBy => _$this._createdBy;
  set createdBy(DocumentReference<Object?>? createdBy) =>
      _$this._createdBy = createdBy;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  DocumentReference<Object?>? _company;
  DocumentReference<Object?>? get company => _$this._company;
  set company(DocumentReference<Object?>? company) => _$this._company = company;

  double? _rating;
  double? get rating => _$this._rating;
  set rating(double? rating) => _$this._rating = rating;

  bool? _booleanResponse;
  bool? get booleanResponse => _$this._booleanResponse;
  set booleanResponse(bool? booleanResponse) =>
      _$this._booleanResponse = booleanResponse;

  String? _responseComment;
  String? get responseComment => _$this._responseComment;
  set responseComment(String? responseComment) =>
      _$this._responseComment = responseComment;

  bool? _bookedComment;
  bool? get bookedComment => _$this._bookedComment;
  set bookedComment(bool? bookedComment) =>
      _$this._bookedComment = bookedComment;

  DocumentReference<Object?>? _bookingDoc;
  DocumentReference<Object?>? get bookingDoc => _$this._bookingDoc;
  set bookingDoc(DocumentReference<Object?>? bookingDoc) =>
      _$this._bookingDoc = bookingDoc;

  bool? _obtobotan;
  bool? get obtobotan => _$this._obtobotan;
  set obtobotan(bool? obtobotan) => _$this._obtobotan = obtobotan;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  CommentsRecordBuilder() {
    CommentsRecord._initializeBuilder(this);
  }

  CommentsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _comment = $v.comment;
      _createdBy = $v.createdBy;
      _createdAt = $v.createdAt;
      _company = $v.company;
      _rating = $v.rating;
      _booleanResponse = $v.booleanResponse;
      _responseComment = $v.responseComment;
      _bookedComment = $v.bookedComment;
      _bookingDoc = $v.bookingDoc;
      _obtobotan = $v.obtobotan;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CommentsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CommentsRecord;
  }

  @override
  void update(void Function(CommentsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CommentsRecord build() => _build();

  _$CommentsRecord _build() {
    final _$result = _$v ??
        new _$CommentsRecord._(
            comment: comment,
            createdBy: createdBy,
            createdAt: createdAt,
            company: company,
            rating: rating,
            booleanResponse: booleanResponse,
            responseComment: responseComment,
            bookedComment: bookedComment,
            bookingDoc: bookingDoc,
            obtobotan: obtobotan,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
