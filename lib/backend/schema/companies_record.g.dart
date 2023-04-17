part of 'companies_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<CompaniesRecord> _$companiesRecordSerializer =
new _$CompaniesRecordSerializer();

class _$CompaniesRecordSerializer
    implements StructuredSerializer<CompaniesRecord> {
  @override
  final Iterable<Type> types = const [CompaniesRecord, _$CompaniesRecord];
  @override
  final String wireName = 'CompaniesRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, CompaniesRecord object,
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
    value = object.rating;
    if (value != null) {
      result
        ..add('rating')
        ..add(serializers.serialize(value,
            specifiedType:
            const FullType(BuiltList, const [const FullType(double)])));
    }
    value = object.location;
    if (value != null) {
      result
        ..add('location')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(LatLng)));
    }
    value = object.logo;
    if (value != null) {
      result
        ..add('logo')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.city;
    if (value != null) {
      result
        ..add('city')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.street;
    if (value != null) {
      result
        ..add('street')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.address2GIS;
    if (value != null) {
      result
        ..add('address_2GIS')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.adminCreatedBy;
    if (value != null) {
      result
        ..add('admin_created_by')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.conveniences;
    if (value != null) {
      result
        ..add('conveniences')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.countBox;
    if (value != null) {
      result
        ..add('count_box')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.status;
    if (value != null) {
      result
        ..add('status')
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
    value = object.binIin;
    if (value != null) {
      result
        ..add('bin_iin')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.iban;
    if (value != null) {
      result
        ..add('iban')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.fioAdmin;
    if (value != null) {
      result
        ..add('fio_admin')
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
    value = object.dogovorPdf;
    if (value != null) {
      result
        ..add('dogovor_pdf')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.linkCity;
    if (value != null) {
      result
        ..add('link_city')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.phoneNum;
    if (value != null) {
      result
        ..add('phone_num')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.openTime;
    if (value != null) {
      result
        ..add('open_time')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.closeTime;
    if (value != null) {
      result
        ..add('close_time')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.openTimeOrder;
    if (value != null) {
      result
        ..add('open_time_order')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.closedTimeOrder;
    if (value != null) {
      result
        ..add('closed_time_order')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.companyDocument;
    if (value != null) {
      result
        ..add('company_document')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.forCarPercent;
    if (value != null) {
      result
        ..add('forCarPercent')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.countBoxString;
    if (value != null) {
      result
        ..add('count_box_string')
        ..add(serializers.serialize(value,
            specifiedType:
            const FullType(BuiltList, const [const FullType(String)])));
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
    value = object.numDogovor;
    if (value != null) {
      result
        ..add('num_dogovor')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.addressGoogleMap;
    if (value != null) {
      result
        ..add('address_google_map')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.addressYandexMap;
    if (value != null) {
      result
        ..add('address_yandex_map')
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
  CompaniesRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CompaniesRecordBuilder();

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
        case 'rating':
          result.rating.replace(serializers.deserialize(value,
              specifiedType: const FullType(
                  BuiltList, const [const FullType(double)]))!
          as BuiltList<Object?>);
          break;
        case 'location':
          result.location = serializers.deserialize(value,
              specifiedType: const FullType(LatLng)) as LatLng?;
          break;
        case 'logo':
          result.logo = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'city':
          result.city = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'street':
          result.street = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'address_2GIS':
          result.address2GIS = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'admin_created_by':
          result.adminCreatedBy = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'conveniences':
          result.conveniences = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'count_box':
          result.countBox = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'status':
          result.status = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'too_name':
          result.tooName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'bin_iin':
          result.binIin = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'iban':
          result.iban = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'fio_admin':
          result.fioAdmin = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'date_dogovor':
          result.dateDogovor = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'dogovor_pdf':
          result.dogovorPdf = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'link_city':
          result.linkCity = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'phone_num':
          result.phoneNum = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'open_time':
          result.openTime = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'close_time':
          result.closeTime = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'open_time_order':
          result.openTimeOrder = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'closed_time_order':
          result.closedTimeOrder = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'company_document':
          result.companyDocument = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'forCarPercent':
          result.forCarPercent = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'count_box_string':
          result.countBoxString.replace(serializers.deserialize(value,
              specifiedType: const FullType(
                  BuiltList, const [const FullType(String)]))!
          as BuiltList<Object?>);
          break;
        case 'company_users':
          result.companyUsers.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
          break;
        case 'num_dogovor':
          result.numDogovor = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'address_google_map':
          result.addressGoogleMap = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'address_yandex_map':
          result.addressYandexMap = serializers.deserialize(value,
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

class _$CompaniesRecord extends CompaniesRecord {
  @override
  final String? name;
  @override
  final BuiltList<double>? rating;
  @override
  final LatLng? location;
  @override
  final String? logo;
  @override
  final String? city;
  @override
  final String? street;
  @override
  final String? address2GIS;
  @override
  final DocumentReference<Object?>? adminCreatedBy;
  @override
  final String? conveniences;
  @override
  final int? countBox;
  @override
  final String? status;
  @override
  final String? tooName;
  @override
  final int? binIin;
  @override
  final String? iban;
  @override
  final String? fioAdmin;
  @override
  final DateTime? dateDogovor;
  @override
  final String? dogovorPdf;
  @override
  final DocumentReference<Object?>? linkCity;
  @override
  final String? phoneNum;
  @override
  final String? openTime;
  @override
  final String? closeTime;
  @override
  final int? openTimeOrder;
  @override
  final int? closedTimeOrder;
  @override
  final DocumentReference<Object?>? companyDocument;
  @override
  final double? forCarPercent;
  @override
  final BuiltList<String>? countBoxString;
  @override
  final BuiltList<DocumentReference<Object?>>? companyUsers;
  @override
  final String? numDogovor;
  @override
  final String? addressGoogleMap;
  @override
  final String? addressYandexMap;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$CompaniesRecord([void Function(CompaniesRecordBuilder)? updates]) =>
      (new CompaniesRecordBuilder()..update(updates))._build();

  _$CompaniesRecord._(
      {this.name,
        this.rating,
        this.location,
        this.logo,
        this.city,
        this.street,
        this.address2GIS,
        this.adminCreatedBy,
        this.conveniences,
        this.countBox,
        this.status,
        this.tooName,
        this.binIin,
        this.iban,
        this.fioAdmin,
        this.dateDogovor,
        this.dogovorPdf,
        this.linkCity,
        this.phoneNum,
        this.openTime,
        this.closeTime,
        this.openTimeOrder,
        this.closedTimeOrder,
        this.companyDocument,
        this.forCarPercent,
        this.countBoxString,
        this.companyUsers,
        this.numDogovor,
        this.addressGoogleMap,
        this.addressYandexMap,
        this.ffRef})
      : super._();

  @override
  CompaniesRecord rebuild(void Function(CompaniesRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CompaniesRecordBuilder toBuilder() =>
      new CompaniesRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CompaniesRecord &&
        name == other.name &&
        rating == other.rating &&
        location == other.location &&
        logo == other.logo &&
        city == other.city &&
        street == other.street &&
        address2GIS == other.address2GIS &&
        adminCreatedBy == other.adminCreatedBy &&
        conveniences == other.conveniences &&
        countBox == other.countBox &&
        status == other.status &&
        tooName == other.tooName &&
        binIin == other.binIin &&
        iban == other.iban &&
        fioAdmin == other.fioAdmin &&
        dateDogovor == other.dateDogovor &&
        dogovorPdf == other.dogovorPdf &&
        linkCity == other.linkCity &&
        phoneNum == other.phoneNum &&
        openTime == other.openTime &&
        closeTime == other.closeTime &&
        openTimeOrder == other.openTimeOrder &&
        closedTimeOrder == other.closedTimeOrder &&
        companyDocument == other.companyDocument &&
        forCarPercent == other.forCarPercent &&
        countBoxString == other.countBoxString &&
        companyUsers == other.companyUsers &&
        numDogovor == other.numDogovor &&
        addressGoogleMap == other.addressGoogleMap &&
        addressYandexMap == other.addressYandexMap &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, rating.hashCode);
    _$hash = $jc(_$hash, location.hashCode);
    _$hash = $jc(_$hash, logo.hashCode);
    _$hash = $jc(_$hash, city.hashCode);
    _$hash = $jc(_$hash, street.hashCode);
    _$hash = $jc(_$hash, address2GIS.hashCode);
    _$hash = $jc(_$hash, adminCreatedBy.hashCode);
    _$hash = $jc(_$hash, conveniences.hashCode);
    _$hash = $jc(_$hash, countBox.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, tooName.hashCode);
    _$hash = $jc(_$hash, binIin.hashCode);
    _$hash = $jc(_$hash, iban.hashCode);
    _$hash = $jc(_$hash, fioAdmin.hashCode);
    _$hash = $jc(_$hash, dateDogovor.hashCode);
    _$hash = $jc(_$hash, dogovorPdf.hashCode);
    _$hash = $jc(_$hash, linkCity.hashCode);
    _$hash = $jc(_$hash, phoneNum.hashCode);
    _$hash = $jc(_$hash, openTime.hashCode);
    _$hash = $jc(_$hash, closeTime.hashCode);
    _$hash = $jc(_$hash, openTimeOrder.hashCode);
    _$hash = $jc(_$hash, closedTimeOrder.hashCode);
    _$hash = $jc(_$hash, companyDocument.hashCode);
    _$hash = $jc(_$hash, forCarPercent.hashCode);
    _$hash = $jc(_$hash, countBoxString.hashCode);
    _$hash = $jc(_$hash, companyUsers.hashCode);
    _$hash = $jc(_$hash, numDogovor.hashCode);
    _$hash = $jc(_$hash, addressGoogleMap.hashCode);
    _$hash = $jc(_$hash, addressYandexMap.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CompaniesRecord')
      ..add('name', name)
      ..add('rating', rating)
      ..add('location', location)
      ..add('logo', logo)
      ..add('city', city)
      ..add('street', street)
      ..add('address2GIS', address2GIS)
      ..add('adminCreatedBy', adminCreatedBy)
      ..add('conveniences', conveniences)
      ..add('countBox', countBox)
      ..add('status', status)
      ..add('tooName', tooName)
      ..add('binIin', binIin)
      ..add('iban', iban)
      ..add('fioAdmin', fioAdmin)
      ..add('dateDogovor', dateDogovor)
      ..add('dogovorPdf', dogovorPdf)
      ..add('linkCity', linkCity)
      ..add('phoneNum', phoneNum)
      ..add('openTime', openTime)
      ..add('closeTime', closeTime)
      ..add('openTimeOrder', openTimeOrder)
      ..add('closedTimeOrder', closedTimeOrder)
      ..add('companyDocument', companyDocument)
      ..add('forCarPercent', forCarPercent)
      ..add('countBoxString', countBoxString)
      ..add('companyUsers', companyUsers)
      ..add('numDogovor', numDogovor)
      ..add('addressGoogleMap', addressGoogleMap)
      ..add('addressYandexMap', addressYandexMap)
      ..add('ffRef', ffRef))
        .toString();
  }
}

class CompaniesRecordBuilder
    implements Builder<CompaniesRecord, CompaniesRecordBuilder> {
  _$CompaniesRecord? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  ListBuilder<double>? _rating;
  ListBuilder<double> get rating =>
      _$this._rating ??= new ListBuilder<double>();
  set rating(ListBuilder<double>? rating) => _$this._rating = rating;

  LatLng? _location;
  LatLng? get location => _$this._location;
  set location(LatLng? location) => _$this._location = location;

  String? _logo;
  String? get logo => _$this._logo;
  set logo(String? logo) => _$this._logo = logo;

  String? _city;
  String? get city => _$this._city;
  set city(String? city) => _$this._city = city;

  String? _street;
  String? get street => _$this._street;
  set street(String? street) => _$this._street = street;

  String? _address2GIS;
  String? get address2GIS => _$this._address2GIS;
  set address2GIS(String? address2GIS) => _$this._address2GIS = address2GIS;

  DocumentReference<Object?>? _adminCreatedBy;
  DocumentReference<Object?>? get adminCreatedBy => _$this._adminCreatedBy;
  set adminCreatedBy(DocumentReference<Object?>? adminCreatedBy) =>
      _$this._adminCreatedBy = adminCreatedBy;

  String? _conveniences;
  String? get conveniences => _$this._conveniences;
  set conveniences(String? conveniences) => _$this._conveniences = conveniences;

  int? _countBox;
  int? get countBox => _$this._countBox;
  set countBox(int? countBox) => _$this._countBox = countBox;

  String? _status;
  String? get status => _$this._status;
  set status(String? status) => _$this._status = status;

  String? _tooName;
  String? get tooName => _$this._tooName;
  set tooName(String? tooName) => _$this._tooName = tooName;

  int? _binIin;
  int? get binIin => _$this._binIin;
  set binIin(int? binIin) => _$this._binIin = binIin;

  String? _iban;
  String? get iban => _$this._iban;
  set iban(String? iban) => _$this._iban = iban;

  String? _fioAdmin;
  String? get fioAdmin => _$this._fioAdmin;
  set fioAdmin(String? fioAdmin) => _$this._fioAdmin = fioAdmin;

  DateTime? _dateDogovor;
  DateTime? get dateDogovor => _$this._dateDogovor;
  set dateDogovor(DateTime? dateDogovor) => _$this._dateDogovor = dateDogovor;

  String? _dogovorPdf;
  String? get dogovorPdf => _$this._dogovorPdf;
  set dogovorPdf(String? dogovorPdf) => _$this._dogovorPdf = dogovorPdf;

  DocumentReference<Object?>? _linkCity;
  DocumentReference<Object?>? get linkCity => _$this._linkCity;
  set linkCity(DocumentReference<Object?>? linkCity) =>
      _$this._linkCity = linkCity;

  String? _phoneNum;
  String? get phoneNum => _$this._phoneNum;
  set phoneNum(String? phoneNum) => _$this._phoneNum = phoneNum;

  String? _openTime;
  String? get openTime => _$this._openTime;
  set openTime(String? openTime) => _$this._openTime = openTime;

  String? _closeTime;
  String? get closeTime => _$this._closeTime;
  set closeTime(String? closeTime) => _$this._closeTime = closeTime;

  int? _openTimeOrder;
  int? get openTimeOrder => _$this._openTimeOrder;
  set openTimeOrder(int? openTimeOrder) =>
      _$this._openTimeOrder = openTimeOrder;

  int? _closedTimeOrder;
  int? get closedTimeOrder => _$this._closedTimeOrder;
  set closedTimeOrder(int? closedTimeOrder) =>
      _$this._closedTimeOrder = closedTimeOrder;

  DocumentReference<Object?>? _companyDocument;
  DocumentReference<Object?>? get companyDocument => _$this._companyDocument;
  set companyDocument(DocumentReference<Object?>? companyDocument) =>
      _$this._companyDocument = companyDocument;

  double? _forCarPercent;
  double? get forCarPercent => _$this._forCarPercent;
  set forCarPercent(double? forCarPercent) =>
      _$this._forCarPercent = forCarPercent;

  ListBuilder<String>? _countBoxString;
  ListBuilder<String> get countBoxString =>
      _$this._countBoxString ??= new ListBuilder<String>();
  set countBoxString(ListBuilder<String>? countBoxString) =>
      _$this._countBoxString = countBoxString;

  ListBuilder<DocumentReference<Object?>>? _companyUsers;
  ListBuilder<DocumentReference<Object?>> get companyUsers =>
      _$this._companyUsers ??= new ListBuilder<DocumentReference<Object?>>();
  set companyUsers(ListBuilder<DocumentReference<Object?>>? companyUsers) =>
      _$this._companyUsers = companyUsers;

  String? _numDogovor;
  String? get numDogovor => _$this._numDogovor;
  set numDogovor(String? numDogovor) => _$this._numDogovor = numDogovor;

  String? _addressGoogleMap;
  String? get addressGoogleMap => _$this._addressGoogleMap;
  set addressGoogleMap(String? addressGoogleMap) =>
      _$this._addressGoogleMap = addressGoogleMap;

  String? _addressYandexMap;
  String? get addressYandexMap => _$this._addressYandexMap;
  set addressYandexMap(String? addressYandexMap) =>
      _$this._addressYandexMap = addressYandexMap;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  CompaniesRecordBuilder() {
    CompaniesRecord._initializeBuilder(this);
  }

  CompaniesRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _rating = $v.rating?.toBuilder();
      _location = $v.location;
      _logo = $v.logo;
      _city = $v.city;
      _street = $v.street;
      _address2GIS = $v.address2GIS;
      _adminCreatedBy = $v.adminCreatedBy;
      _conveniences = $v.conveniences;
      _countBox = $v.countBox;
      _status = $v.status;
      _tooName = $v.tooName;
      _binIin = $v.binIin;
      _iban = $v.iban;
      _fioAdmin = $v.fioAdmin;
      _dateDogovor = $v.dateDogovor;
      _dogovorPdf = $v.dogovorPdf;
      _linkCity = $v.linkCity;
      _phoneNum = $v.phoneNum;
      _openTime = $v.openTime;
      _closeTime = $v.closeTime;
      _openTimeOrder = $v.openTimeOrder;
      _closedTimeOrder = $v.closedTimeOrder;
      _companyDocument = $v.companyDocument;
      _forCarPercent = $v.forCarPercent;
      _countBoxString = $v.countBoxString?.toBuilder();
      _companyUsers = $v.companyUsers?.toBuilder();
      _numDogovor = $v.numDogovor;
      _addressGoogleMap = $v.addressGoogleMap;
      _addressYandexMap = $v.addressYandexMap;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CompaniesRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CompaniesRecord;
  }

  @override
  void update(void Function(CompaniesRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CompaniesRecord build() => _build();

  _$CompaniesRecord _build() {
    _$CompaniesRecord _$result;
    try {
      _$result = _$v ??
          new _$CompaniesRecord._(
              name: name,
              rating: _rating?.build(),
              location: location,
              logo: logo,
              city: city,
              street: street,
              address2GIS: address2GIS,
              adminCreatedBy: adminCreatedBy,
              conveniences: conveniences,
              countBox: countBox,
              status: status,
              tooName: tooName,
              binIin: binIin,
              iban: iban,
              fioAdmin: fioAdmin,
              dateDogovor: dateDogovor,
              dogovorPdf: dogovorPdf,
              linkCity: linkCity,
              phoneNum: phoneNum,
              openTime: openTime,
              closeTime: closeTime,
              openTimeOrder: openTimeOrder,
              closedTimeOrder: closedTimeOrder,
              companyDocument: companyDocument,
              forCarPercent: forCarPercent,
              countBoxString: _countBoxString?.build(),
              companyUsers: _companyUsers?.build(),
              numDogovor: numDogovor,
              addressGoogleMap: addressGoogleMap,
              addressYandexMap: addressYandexMap,
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'rating';
        _rating?.build();

        _$failedField = 'countBoxString';
        _countBoxString?.build();
        _$failedField = 'companyUsers';
        _companyUsers?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'CompaniesRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}