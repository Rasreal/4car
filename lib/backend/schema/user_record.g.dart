// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UserRecord> _$userRecordSerializer = new _$UserRecordSerializer();

class _$UserRecordSerializer implements StructuredSerializer<UserRecord> {
  @override
  final Iterable<Type> types = const [UserRecord, _$UserRecord];
  @override
  final String wireName = 'UserRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, UserRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'permissions',
      serializers.serialize(object.permissions,
          specifiedType: const FullType(UserPermissionsStruct)),
    ];
    Object? value;
    value = object.email;
    if (value != null) {
      result
        ..add('email')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.displayName;
    if (value != null) {
      result
        ..add('display_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.photoUrl;
    if (value != null) {
      result
        ..add('photo_url')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.uid;
    if (value != null) {
      result
        ..add('uid')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.createdTime;
    if (value != null) {
      result
        ..add('created_time')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.role;
    if (value != null) {
      result
        ..add('role')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.favCompany;
    if (value != null) {
      result
        ..add('favCompany')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
    }
    value = object.searchHistory;
    if (value != null) {
      result
        ..add('search_history')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
    }
    value = object.carscount;
    if (value != null) {
      result
        ..add('carscount')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.phoneNumber;
    if (value != null) {
      result
        ..add('phone_number')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.text;
    if (value != null) {
      result
        ..add('text')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.country;
    if (value != null) {
      result
        ..add('country')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.countryText;
    if (value != null) {
      result
        ..add('country_text')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.linkLastBooking;
    if (value != null) {
      result
        ..add('link_last_booking')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.lastBookingBoolean;
    if (value != null) {
      result
        ..add('last_booking_boolean')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.merchanDocument;
    if (value != null) {
      result
        ..add('merchan_document')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.firstCar;
    if (value != null) {
      result
        ..add('firstCar')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.signUpDate;
    if (value != null) {
      result
        ..add('sign_up_date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.bookingCompanies;
    if (value != null) {
      result
        ..add('bookingCompanies')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
    }
    value = object.firstCarBody;
    if (value != null) {
      result
        ..add('firstCarBody')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.firstCarName;
    if (value != null) {
      result
        ..add('firstCarName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.adminStatus;
    if (value != null) {
      result
        ..add('admin_status')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.createdByAdminCompanyRef;
    if (value != null) {
      result
        ..add('createdByAdminCompanyRef')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.stuffID;
    if (value != null) {
      result
        ..add('StuffID')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.addedCompany;
    if (value != null) {
      result
        ..add('Added_company')
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
  UserRecord deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UserRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'display_name':
          result.displayName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'photo_url':
          result.photoUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'uid':
          result.uid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'created_time':
          result.createdTime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'role':
          result.role = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'permissions':
          result.permissions.replace(serializers.deserialize(value,
                  specifiedType: const FullType(UserPermissionsStruct))!
              as UserPermissionsStruct);
          break;
        case 'favCompany':
          result.favCompany.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
          break;
        case 'search_history':
          result.searchHistory.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
          break;
        case 'carscount':
          result.carscount = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'phone_number':
          result.phoneNumber = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'text':
          result.text = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'country':
          result.country = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'country_text':
          result.countryText = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'link_last_booking':
          result.linkLastBooking = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'last_booking_boolean':
          result.lastBookingBoolean = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'merchan_document':
          result.merchanDocument = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'firstCar':
          result.firstCar = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'sign_up_date':
          result.signUpDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'bookingCompanies':
          result.bookingCompanies.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
          break;
        case 'firstCarBody':
          result.firstCarBody = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'firstCarName':
          result.firstCarName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'admin_status':
          result.adminStatus = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'createdByAdminCompanyRef':
          result.createdByAdminCompanyRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'StuffID':
          result.stuffID = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Added_company':
          result.addedCompany = serializers.deserialize(value,
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

class _$UserRecord extends UserRecord {
  @override
  final String? email;
  @override
  final String? displayName;
  @override
  final String? photoUrl;
  @override
  final String? uid;
  @override
  final DateTime? createdTime;
  @override
  final String? role;
  @override
  final UserPermissionsStruct permissions;
  @override
  final BuiltList<DocumentReference<Object?>>? favCompany;
  @override
  final BuiltList<DocumentReference<Object?>>? searchHistory;
  @override
  final int? carscount;
  @override
  final String? phoneNumber;
  @override
  final int? text;
  @override
  final DocumentReference<Object?>? country;
  @override
  final String? countryText;
  @override
  final DocumentReference<Object?>? linkLastBooking;
  @override
  final bool? lastBookingBoolean;
  @override
  final DocumentReference<Object?>? merchanDocument;
  @override
  final DocumentReference<Object?>? firstCar;
  @override
  final DateTime? signUpDate;
  @override
  final BuiltList<DocumentReference<Object?>>? bookingCompanies;
  @override
  final String? firstCarBody;
  @override
  final String? firstCarName;
  @override
  final String? adminStatus;
  @override
  final DocumentReference<Object?>? createdByAdminCompanyRef;
  @override
  final String? stuffID;
  @override
  final bool? addedCompany;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$UserRecord([void Function(UserRecordBuilder)? updates]) =>
      (new UserRecordBuilder()..update(updates))._build();

  _$UserRecord._(
      {this.email,
      this.displayName,
      this.photoUrl,
      this.uid,
      this.createdTime,
      this.role,
      required this.permissions,
      this.favCompany,
      this.searchHistory,
      this.carscount,
      this.phoneNumber,
      this.text,
      this.country,
      this.countryText,
      this.linkLastBooking,
      this.lastBookingBoolean,
      this.merchanDocument,
      this.firstCar,
      this.signUpDate,
      this.bookingCompanies,
      this.firstCarBody,
      this.firstCarName,
      this.adminStatus,
      this.createdByAdminCompanyRef,
      this.stuffID,
      this.addedCompany,
      this.ffRef})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        permissions, r'UserRecord', 'permissions');
  }

  @override
  UserRecord rebuild(void Function(UserRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserRecordBuilder toBuilder() => new UserRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserRecord &&
        email == other.email &&
        displayName == other.displayName &&
        photoUrl == other.photoUrl &&
        uid == other.uid &&
        createdTime == other.createdTime &&
        role == other.role &&
        permissions == other.permissions &&
        favCompany == other.favCompany &&
        searchHistory == other.searchHistory &&
        carscount == other.carscount &&
        phoneNumber == other.phoneNumber &&
        text == other.text &&
        country == other.country &&
        countryText == other.countryText &&
        linkLastBooking == other.linkLastBooking &&
        lastBookingBoolean == other.lastBookingBoolean &&
        merchanDocument == other.merchanDocument &&
        firstCar == other.firstCar &&
        signUpDate == other.signUpDate &&
        bookingCompanies == other.bookingCompanies &&
        firstCarBody == other.firstCarBody &&
        firstCarName == other.firstCarName &&
        adminStatus == other.adminStatus &&
        createdByAdminCompanyRef == other.createdByAdminCompanyRef &&
        stuffID == other.stuffID &&
        addedCompany == other.addedCompany &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, email.hashCode);
    _$hash = $jc(_$hash, displayName.hashCode);
    _$hash = $jc(_$hash, photoUrl.hashCode);
    _$hash = $jc(_$hash, uid.hashCode);
    _$hash = $jc(_$hash, createdTime.hashCode);
    _$hash = $jc(_$hash, role.hashCode);
    _$hash = $jc(_$hash, permissions.hashCode);
    _$hash = $jc(_$hash, favCompany.hashCode);
    _$hash = $jc(_$hash, searchHistory.hashCode);
    _$hash = $jc(_$hash, carscount.hashCode);
    _$hash = $jc(_$hash, phoneNumber.hashCode);
    _$hash = $jc(_$hash, text.hashCode);
    _$hash = $jc(_$hash, country.hashCode);
    _$hash = $jc(_$hash, countryText.hashCode);
    _$hash = $jc(_$hash, linkLastBooking.hashCode);
    _$hash = $jc(_$hash, lastBookingBoolean.hashCode);
    _$hash = $jc(_$hash, merchanDocument.hashCode);
    _$hash = $jc(_$hash, firstCar.hashCode);
    _$hash = $jc(_$hash, signUpDate.hashCode);
    _$hash = $jc(_$hash, bookingCompanies.hashCode);
    _$hash = $jc(_$hash, firstCarBody.hashCode);
    _$hash = $jc(_$hash, firstCarName.hashCode);
    _$hash = $jc(_$hash, adminStatus.hashCode);
    _$hash = $jc(_$hash, createdByAdminCompanyRef.hashCode);
    _$hash = $jc(_$hash, stuffID.hashCode);
    _$hash = $jc(_$hash, addedCompany.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UserRecord')
          ..add('email', email)
          ..add('displayName', displayName)
          ..add('photoUrl', photoUrl)
          ..add('uid', uid)
          ..add('createdTime', createdTime)
          ..add('role', role)
          ..add('permissions', permissions)
          ..add('favCompany', favCompany)
          ..add('searchHistory', searchHistory)
          ..add('carscount', carscount)
          ..add('phoneNumber', phoneNumber)
          ..add('text', text)
          ..add('country', country)
          ..add('countryText', countryText)
          ..add('linkLastBooking', linkLastBooking)
          ..add('lastBookingBoolean', lastBookingBoolean)
          ..add('merchanDocument', merchanDocument)
          ..add('firstCar', firstCar)
          ..add('signUpDate', signUpDate)
          ..add('bookingCompanies', bookingCompanies)
          ..add('firstCarBody', firstCarBody)
          ..add('firstCarName', firstCarName)
          ..add('adminStatus', adminStatus)
          ..add('createdByAdminCompanyRef', createdByAdminCompanyRef)
          ..add('stuffID', stuffID)
          ..add('addedCompany', addedCompany)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class UserRecordBuilder implements Builder<UserRecord, UserRecordBuilder> {
  _$UserRecord? _$v;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  String? _displayName;
  String? get displayName => _$this._displayName;
  set displayName(String? displayName) => _$this._displayName = displayName;

  String? _photoUrl;
  String? get photoUrl => _$this._photoUrl;
  set photoUrl(String? photoUrl) => _$this._photoUrl = photoUrl;

  String? _uid;
  String? get uid => _$this._uid;
  set uid(String? uid) => _$this._uid = uid;

  DateTime? _createdTime;
  DateTime? get createdTime => _$this._createdTime;
  set createdTime(DateTime? createdTime) => _$this._createdTime = createdTime;

  String? _role;
  String? get role => _$this._role;
  set role(String? role) => _$this._role = role;

  UserPermissionsStructBuilder? _permissions;
  UserPermissionsStructBuilder get permissions =>
      _$this._permissions ??= new UserPermissionsStructBuilder();
  set permissions(UserPermissionsStructBuilder? permissions) =>
      _$this._permissions = permissions;

  ListBuilder<DocumentReference<Object?>>? _favCompany;
  ListBuilder<DocumentReference<Object?>> get favCompany =>
      _$this._favCompany ??= new ListBuilder<DocumentReference<Object?>>();
  set favCompany(ListBuilder<DocumentReference<Object?>>? favCompany) =>
      _$this._favCompany = favCompany;

  ListBuilder<DocumentReference<Object?>>? _searchHistory;
  ListBuilder<DocumentReference<Object?>> get searchHistory =>
      _$this._searchHistory ??= new ListBuilder<DocumentReference<Object?>>();
  set searchHistory(ListBuilder<DocumentReference<Object?>>? searchHistory) =>
      _$this._searchHistory = searchHistory;

  int? _carscount;
  int? get carscount => _$this._carscount;
  set carscount(int? carscount) => _$this._carscount = carscount;

  String? _phoneNumber;
  String? get phoneNumber => _$this._phoneNumber;
  set phoneNumber(String? phoneNumber) => _$this._phoneNumber = phoneNumber;

  int? _text;
  int? get text => _$this._text;
  set text(int? text) => _$this._text = text;

  DocumentReference<Object?>? _country;
  DocumentReference<Object?>? get country => _$this._country;
  set country(DocumentReference<Object?>? country) => _$this._country = country;

  String? _countryText;
  String? get countryText => _$this._countryText;
  set countryText(String? countryText) => _$this._countryText = countryText;

  DocumentReference<Object?>? _linkLastBooking;
  DocumentReference<Object?>? get linkLastBooking => _$this._linkLastBooking;
  set linkLastBooking(DocumentReference<Object?>? linkLastBooking) =>
      _$this._linkLastBooking = linkLastBooking;

  bool? _lastBookingBoolean;
  bool? get lastBookingBoolean => _$this._lastBookingBoolean;
  set lastBookingBoolean(bool? lastBookingBoolean) =>
      _$this._lastBookingBoolean = lastBookingBoolean;

  DocumentReference<Object?>? _merchanDocument;
  DocumentReference<Object?>? get merchanDocument => _$this._merchanDocument;
  set merchanDocument(DocumentReference<Object?>? merchanDocument) =>
      _$this._merchanDocument = merchanDocument;

  DocumentReference<Object?>? _firstCar;
  DocumentReference<Object?>? get firstCar => _$this._firstCar;
  set firstCar(DocumentReference<Object?>? firstCar) =>
      _$this._firstCar = firstCar;

  DateTime? _signUpDate;
  DateTime? get signUpDate => _$this._signUpDate;
  set signUpDate(DateTime? signUpDate) => _$this._signUpDate = signUpDate;

  ListBuilder<DocumentReference<Object?>>? _bookingCompanies;
  ListBuilder<DocumentReference<Object?>> get bookingCompanies =>
      _$this._bookingCompanies ??=
          new ListBuilder<DocumentReference<Object?>>();
  set bookingCompanies(
          ListBuilder<DocumentReference<Object?>>? bookingCompanies) =>
      _$this._bookingCompanies = bookingCompanies;

  String? _firstCarBody;
  String? get firstCarBody => _$this._firstCarBody;
  set firstCarBody(String? firstCarBody) => _$this._firstCarBody = firstCarBody;

  String? _firstCarName;
  String? get firstCarName => _$this._firstCarName;
  set firstCarName(String? firstCarName) => _$this._firstCarName = firstCarName;

  String? _adminStatus;
  String? get adminStatus => _$this._adminStatus;
  set adminStatus(String? adminStatus) => _$this._adminStatus = adminStatus;

  DocumentReference<Object?>? _createdByAdminCompanyRef;
  DocumentReference<Object?>? get createdByAdminCompanyRef =>
      _$this._createdByAdminCompanyRef;
  set createdByAdminCompanyRef(
          DocumentReference<Object?>? createdByAdminCompanyRef) =>
      _$this._createdByAdminCompanyRef = createdByAdminCompanyRef;

  String? _stuffID;
  String? get stuffID => _$this._stuffID;
  set stuffID(String? stuffID) => _$this._stuffID = stuffID;

  bool? _addedCompany;
  bool? get addedCompany => _$this._addedCompany;
  set addedCompany(bool? addedCompany) => _$this._addedCompany = addedCompany;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  UserRecordBuilder() {
    UserRecord._initializeBuilder(this);
  }

  UserRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _email = $v.email;
      _displayName = $v.displayName;
      _photoUrl = $v.photoUrl;
      _uid = $v.uid;
      _createdTime = $v.createdTime;
      _role = $v.role;
      _permissions = $v.permissions.toBuilder();
      _favCompany = $v.favCompany?.toBuilder();
      _searchHistory = $v.searchHistory?.toBuilder();
      _carscount = $v.carscount;
      _phoneNumber = $v.phoneNumber;
      _text = $v.text;
      _country = $v.country;
      _countryText = $v.countryText;
      _linkLastBooking = $v.linkLastBooking;
      _lastBookingBoolean = $v.lastBookingBoolean;
      _merchanDocument = $v.merchanDocument;
      _firstCar = $v.firstCar;
      _signUpDate = $v.signUpDate;
      _bookingCompanies = $v.bookingCompanies?.toBuilder();
      _firstCarBody = $v.firstCarBody;
      _firstCarName = $v.firstCarName;
      _adminStatus = $v.adminStatus;
      _createdByAdminCompanyRef = $v.createdByAdminCompanyRef;
      _stuffID = $v.stuffID;
      _addedCompany = $v.addedCompany;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserRecord;
  }

  @override
  void update(void Function(UserRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserRecord build() => _build();

  _$UserRecord _build() {
    _$UserRecord _$result;
    try {
      _$result = _$v ??
          new _$UserRecord._(
              email: email,
              displayName: displayName,
              photoUrl: photoUrl,
              uid: uid,
              createdTime: createdTime,
              role: role,
              permissions: permissions.build(),
              favCompany: _favCompany?.build(),
              searchHistory: _searchHistory?.build(),
              carscount: carscount,
              phoneNumber: phoneNumber,
              text: text,
              country: country,
              countryText: countryText,
              linkLastBooking: linkLastBooking,
              lastBookingBoolean: lastBookingBoolean,
              merchanDocument: merchanDocument,
              firstCar: firstCar,
              signUpDate: signUpDate,
              bookingCompanies: _bookingCompanies?.build(),
              firstCarBody: firstCarBody,
              firstCarName: firstCarName,
              adminStatus: adminStatus,
              createdByAdminCompanyRef: createdByAdminCompanyRef,
              stuffID: stuffID,
              addedCompany: addedCompany,
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'permissions';
        permissions.build();
        _$failedField = 'favCompany';
        _favCompany?.build();
        _$failedField = 'searchHistory';
        _searchHistory?.build();

        _$failedField = 'bookingCompanies';
        _bookingCompanies?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'UserRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
