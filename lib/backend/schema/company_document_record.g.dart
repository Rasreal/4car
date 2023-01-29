// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_document_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<CompanyDocumentRecord> _$companyDocumentRecordSerializer =
    new _$CompanyDocumentRecordSerializer();

class _$CompanyDocumentRecordSerializer
    implements StructuredSerializer<CompanyDocumentRecord> {
  @override
  final Iterable<Type> types = const [
    CompanyDocumentRecord,
    _$CompanyDocumentRecord
  ];
  @override
  final String wireName = 'CompanyDocumentRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, CompanyDocumentRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.companyName;
    if (value != null) {
      result
        ..add('company_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.tooName;
    if (value != null) {
      result
        ..add('too_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.fioRukovoditel;
    if (value != null) {
      result
        ..add('fio_rukovoditel')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.numDogovor;
    if (value != null) {
      result
        ..add('num_dogovor')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.dateDogovor;
    if (value != null) {
      result
        ..add('date_dogovor')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.dogovor;
    if (value != null) {
      result
        ..add('dogovor')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.bin;
    if (value != null) {
      result
        ..add('BIN')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.iban;
    if (value != null) {
      result
        ..add('IBAN')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.status;
    if (value != null) {
      result
        ..add('status')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.logo;
    if (value != null) {
      result
        ..add('logo')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.companyBranches;
    if (value != null) {
      result
        ..add('company_branches')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
    }
    value = object.companyUsers;
    if (value != null) {
      result
        ..add('company_users')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
    }
    value = object.companyAdmin;
    if (value != null) {
      result
        ..add('company_admin')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
    }
    value = object.boxesName;
    if (value != null) {
      result
        ..add('boxesName')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.forCarProcent;
    if (value != null) {
      result
        ..add('forCarProcent')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
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
  CompanyDocumentRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CompanyDocumentRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'company_name':
          result.companyName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'too_name':
          result.tooName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'fio_rukovoditel':
          result.fioRukovoditel = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'num_dogovor':
          result.numDogovor = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'date_dogovor':
          result.dateDogovor = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'dogovor':
          result.dogovor = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'BIN':
          result.bin = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'IBAN':
          result.iban = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'status':
          result.status = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'logo':
          result.logo = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'company_branches':
          result.companyBranches.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
          break;
        case 'company_users':
          result.companyUsers.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
          break;
        case 'company_admin':
          result.companyAdmin.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
          break;
        case 'boxesName':
          result.boxesName.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'forCarProcent':
          result.forCarProcent = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
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

class _$CompanyDocumentRecord extends CompanyDocumentRecord {
  @override
  final String? companyName;
  @override
  final String? tooName;
  @override
  final String? fioRukovoditel;
  @override
  final String? numDogovor;
  @override
  final DateTime? dateDogovor;
  @override
  final String? dogovor;
  @override
  final int? bin;
  @override
  final String? iban;
  @override
  final String? status;
  @override
  final String? logo;
  @override
  final BuiltList<DocumentReference<Object?>>? companyBranches;
  @override
  final BuiltList<DocumentReference<Object?>>? companyUsers;
  @override
  final BuiltList<DocumentReference<Object?>>? companyAdmin;
  @override
  final BuiltList<String>? boxesName;
  @override
  final double? forCarProcent;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$CompanyDocumentRecord(
          [void Function(CompanyDocumentRecordBuilder)? updates]) =>
      (new CompanyDocumentRecordBuilder()..update(updates))._build();

  _$CompanyDocumentRecord._(
      {this.companyName,
      this.tooName,
      this.fioRukovoditel,
      this.numDogovor,
      this.dateDogovor,
      this.dogovor,
      this.bin,
      this.iban,
      this.status,
      this.logo,
      this.companyBranches,
      this.companyUsers,
      this.companyAdmin,
      this.boxesName,
      this.forCarProcent,
      this.ffRef})
      : super._();

  @override
  CompanyDocumentRecord rebuild(
          void Function(CompanyDocumentRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CompanyDocumentRecordBuilder toBuilder() =>
      new CompanyDocumentRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CompanyDocumentRecord &&
        companyName == other.companyName &&
        tooName == other.tooName &&
        fioRukovoditel == other.fioRukovoditel &&
        numDogovor == other.numDogovor &&
        dateDogovor == other.dateDogovor &&
        dogovor == other.dogovor &&
        bin == other.bin &&
        iban == other.iban &&
        status == other.status &&
        logo == other.logo &&
        companyBranches == other.companyBranches &&
        companyUsers == other.companyUsers &&
        companyAdmin == other.companyAdmin &&
        boxesName == other.boxesName &&
        forCarProcent == other.forCarProcent &&
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
                                        $jc(
                                            $jc(
                                                $jc(
                                                    $jc(
                                                        $jc(
                                                            $jc(
                                                                $jc(
                                                                    0,
                                                                    companyName
                                                                        .hashCode),
                                                                tooName
                                                                    .hashCode),
                                                            fioRukovoditel
                                                                .hashCode),
                                                        numDogovor.hashCode),
                                                    dateDogovor.hashCode),
                                                dogovor.hashCode),
                                            bin.hashCode),
                                        iban.hashCode),
                                    status.hashCode),
                                logo.hashCode),
                            companyBranches.hashCode),
                        companyUsers.hashCode),
                    companyAdmin.hashCode),
                boxesName.hashCode),
            forCarProcent.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CompanyDocumentRecord')
          ..add('companyName', companyName)
          ..add('tooName', tooName)
          ..add('fioRukovoditel', fioRukovoditel)
          ..add('numDogovor', numDogovor)
          ..add('dateDogovor', dateDogovor)
          ..add('dogovor', dogovor)
          ..add('bin', bin)
          ..add('iban', iban)
          ..add('status', status)
          ..add('logo', logo)
          ..add('companyBranches', companyBranches)
          ..add('companyUsers', companyUsers)
          ..add('companyAdmin', companyAdmin)
          ..add('boxesName', boxesName)
          ..add('forCarProcent', forCarProcent)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class CompanyDocumentRecordBuilder
    implements Builder<CompanyDocumentRecord, CompanyDocumentRecordBuilder> {
  _$CompanyDocumentRecord? _$v;

  String? _companyName;
  String? get companyName => _$this._companyName;
  set companyName(String? companyName) => _$this._companyName = companyName;

  String? _tooName;
  String? get tooName => _$this._tooName;
  set tooName(String? tooName) => _$this._tooName = tooName;

  String? _fioRukovoditel;
  String? get fioRukovoditel => _$this._fioRukovoditel;
  set fioRukovoditel(String? fioRukovoditel) =>
      _$this._fioRukovoditel = fioRukovoditel;

  String? _numDogovor;
  String? get numDogovor => _$this._numDogovor;
  set numDogovor(String? numDogovor) => _$this._numDogovor = numDogovor;

  DateTime? _dateDogovor;
  DateTime? get dateDogovor => _$this._dateDogovor;
  set dateDogovor(DateTime? dateDogovor) => _$this._dateDogovor = dateDogovor;

  String? _dogovor;
  String? get dogovor => _$this._dogovor;
  set dogovor(String? dogovor) => _$this._dogovor = dogovor;

  int? _bin;
  int? get bin => _$this._bin;
  set bin(int? bin) => _$this._bin = bin;

  String? _iban;
  String? get iban => _$this._iban;
  set iban(String? iban) => _$this._iban = iban;

  String? _status;
  String? get status => _$this._status;
  set status(String? status) => _$this._status = status;

  String? _logo;
  String? get logo => _$this._logo;
  set logo(String? logo) => _$this._logo = logo;

  ListBuilder<DocumentReference<Object?>>? _companyBranches;
  ListBuilder<DocumentReference<Object?>> get companyBranches =>
      _$this._companyBranches ??= new ListBuilder<DocumentReference<Object?>>();
  set companyBranches(
          ListBuilder<DocumentReference<Object?>>? companyBranches) =>
      _$this._companyBranches = companyBranches;

  ListBuilder<DocumentReference<Object?>>? _companyUsers;
  ListBuilder<DocumentReference<Object?>> get companyUsers =>
      _$this._companyUsers ??= new ListBuilder<DocumentReference<Object?>>();
  set companyUsers(ListBuilder<DocumentReference<Object?>>? companyUsers) =>
      _$this._companyUsers = companyUsers;

  ListBuilder<DocumentReference<Object?>>? _companyAdmin;
  ListBuilder<DocumentReference<Object?>> get companyAdmin =>
      _$this._companyAdmin ??= new ListBuilder<DocumentReference<Object?>>();
  set companyAdmin(ListBuilder<DocumentReference<Object?>>? companyAdmin) =>
      _$this._companyAdmin = companyAdmin;

  ListBuilder<String>? _boxesName;
  ListBuilder<String> get boxesName =>
      _$this._boxesName ??= new ListBuilder<String>();
  set boxesName(ListBuilder<String>? boxesName) =>
      _$this._boxesName = boxesName;

  double? _forCarProcent;
  double? get forCarProcent => _$this._forCarProcent;
  set forCarProcent(double? forCarProcent) =>
      _$this._forCarProcent = forCarProcent;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  CompanyDocumentRecordBuilder() {
    CompanyDocumentRecord._initializeBuilder(this);
  }

  CompanyDocumentRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _companyName = $v.companyName;
      _tooName = $v.tooName;
      _fioRukovoditel = $v.fioRukovoditel;
      _numDogovor = $v.numDogovor;
      _dateDogovor = $v.dateDogovor;
      _dogovor = $v.dogovor;
      _bin = $v.bin;
      _iban = $v.iban;
      _status = $v.status;
      _logo = $v.logo;
      _companyBranches = $v.companyBranches?.toBuilder();
      _companyUsers = $v.companyUsers?.toBuilder();
      _companyAdmin = $v.companyAdmin?.toBuilder();
      _boxesName = $v.boxesName?.toBuilder();
      _forCarProcent = $v.forCarProcent;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CompanyDocumentRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CompanyDocumentRecord;
  }

  @override
  void update(void Function(CompanyDocumentRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CompanyDocumentRecord build() => _build();

  _$CompanyDocumentRecord _build() {
    _$CompanyDocumentRecord _$result;
    try {
      _$result = _$v ??
          new _$CompanyDocumentRecord._(
              companyName: companyName,
              tooName: tooName,
              fioRukovoditel: fioRukovoditel,
              numDogovor: numDogovor,
              dateDogovor: dateDogovor,
              dogovor: dogovor,
              bin: bin,
              iban: iban,
              status: status,
              logo: logo,
              companyBranches: _companyBranches?.build(),
              companyUsers: _companyUsers?.build(),
              companyAdmin: _companyAdmin?.build(),
              boxesName: _boxesName?.build(),
              forCarProcent: forCarProcent,
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'companyBranches';
        _companyBranches?.build();
        _$failedField = 'companyUsers';
        _companyUsers?.build();
        _$failedField = 'companyAdmin';
        _companyAdmin?.build();
        _$failedField = 'boxesName';
        _boxesName?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'CompanyDocumentRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
