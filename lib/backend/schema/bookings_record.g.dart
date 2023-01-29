// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bookings_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<BookingsRecord> _$bookingsRecordSerializer =
    new _$BookingsRecordSerializer();

class _$BookingsRecordSerializer
    implements StructuredSerializer<BookingsRecord> {
  @override
  final Iterable<Type> types = const [BookingsRecord, _$BookingsRecord];
  @override
  final String wireName = 'BookingsRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, BookingsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.bookedUser;
    if (value != null) {
      result
        ..add('booked_user')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.bookedCompany;
    if (value != null) {
      result
        ..add('booked_company')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
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
    value = object.status;
    if (value != null) {
      result
        ..add('status')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.bookedDate;
    if (value != null) {
      result
        ..add('booked_date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.selectedCompanyServices;
    if (value != null) {
      result
        ..add('selected_company_services')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
    }
    value = object.carBody;
    if (value != null) {
      result
        ..add('car_body')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.carName;
    if (value != null) {
      result
        ..add('car_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.carOrder;
    if (value != null) {
      result
        ..add('car_order')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.cancelWhy;
    if (value != null) {
      result
        ..add('cancel_why')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.cancelComment;
    if (value != null) {
      result
        ..add('cancel_comment')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.cancelTimeDate;
    if (value != null) {
      result
        ..add('cancel_time_date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.id;
    if (value != null) {
      result
        ..add('ID')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.duration;
    if (value != null) {
      result
        ..add('duration')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.totalPrice;
    if (value != null) {
      result
        ..add('total_price')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.notifyTimeName;
    if (value != null) {
      result
        ..add('notify_time_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.selectedTimesOrder;
    if (value != null) {
      result
        ..add('selected_times_order')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(int)])));
    }
    value = object.cancelled;
    if (value != null) {
      result
        ..add('cancelled')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.bookedCompanyDocument;
    if (value != null) {
      result
        ..add('booked_company_document')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.selectedCompanyServicesName;
    if (value != null) {
      result
        ..add('selected_company_services_name')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.bookedDateString;
    if (value != null) {
      result
        ..add('booked_date_string')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.boxName;
    if (value != null) {
      result
        ..add('boxName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.forCarPay;
    if (value != null) {
      result
        ..add('forCarPay')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.createdByUser;
    if (value != null) {
      result
        ..add('createdByUser')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.createdByAdmin;
    if (value != null) {
      result
        ..add('createdByAdmin')
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
  BookingsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new BookingsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'booked_user':
          result.bookedUser = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'booked_company':
          result.bookedCompany = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'time_name':
          result.timeName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'time_order':
          result.timeOrder = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'status':
          result.status = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'booked_date':
          result.bookedDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'selected_company_services':
          result.selectedCompanyServices.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
          break;
        case 'car_body':
          result.carBody = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'car_name':
          result.carName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'car_order':
          result.carOrder = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'cancel_why':
          result.cancelWhy = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'cancel_comment':
          result.cancelComment = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'cancel_time_date':
          result.cancelTimeDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'ID':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'duration':
          result.duration = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'total_price':
          result.totalPrice = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'notify_time_name':
          result.notifyTimeName = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'selected_times_order':
          result.selectedTimesOrder.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(int)]))!
              as BuiltList<Object?>);
          break;
        case 'cancelled':
          result.cancelled = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'booked_company_document':
          result.bookedCompanyDocument = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'selected_company_services_name':
          result.selectedCompanyServicesName.replace(serializers.deserialize(
                  value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'booked_date_string':
          result.bookedDateString = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'boxName':
          result.boxName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'forCarPay':
          result.forCarPay = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'createdByUser':
          result.createdByUser = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'createdByAdmin':
          result.createdByAdmin = serializers.deserialize(value,
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

class _$BookingsRecord extends BookingsRecord {
  @override
  final DocumentReference<Object?>? bookedUser;
  @override
  final DocumentReference<Object?>? bookedCompany;
  @override
  final String? timeName;
  @override
  final int? timeOrder;
  @override
  final String? status;
  @override
  final DateTime? bookedDate;
  @override
  final BuiltList<DocumentReference<Object?>>? selectedCompanyServices;
  @override
  final String? carBody;
  @override
  final String? carName;
  @override
  final int? carOrder;
  @override
  final String? cancelWhy;
  @override
  final String? cancelComment;
  @override
  final DateTime? cancelTimeDate;
  @override
  final String? id;
  @override
  final double? duration;
  @override
  final int? totalPrice;
  @override
  final DateTime? notifyTimeName;
  @override
  final BuiltList<int>? selectedTimesOrder;
  @override
  final bool? cancelled;
  @override
  final DocumentReference<Object?>? bookedCompanyDocument;
  @override
  final BuiltList<String>? selectedCompanyServicesName;
  @override
  final String? bookedDateString;
  @override
  final String? boxName;
  @override
  final double? forCarPay;
  @override
  final bool? createdByUser;
  @override
  final bool? createdByAdmin;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$BookingsRecord([void Function(BookingsRecordBuilder)? updates]) =>
      (new BookingsRecordBuilder()..update(updates))._build();

  _$BookingsRecord._(
      {this.bookedUser,
      this.bookedCompany,
      this.timeName,
      this.timeOrder,
      this.status,
      this.bookedDate,
      this.selectedCompanyServices,
      this.carBody,
      this.carName,
      this.carOrder,
      this.cancelWhy,
      this.cancelComment,
      this.cancelTimeDate,
      this.id,
      this.duration,
      this.totalPrice,
      this.notifyTimeName,
      this.selectedTimesOrder,
      this.cancelled,
      this.bookedCompanyDocument,
      this.selectedCompanyServicesName,
      this.bookedDateString,
      this.boxName,
      this.forCarPay,
      this.createdByUser,
      this.createdByAdmin,
      this.ffRef})
      : super._();

  @override
  BookingsRecord rebuild(void Function(BookingsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BookingsRecordBuilder toBuilder() =>
      new BookingsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BookingsRecord &&
        bookedUser == other.bookedUser &&
        bookedCompany == other.bookedCompany &&
        timeName == other.timeName &&
        timeOrder == other.timeOrder &&
        status == other.status &&
        bookedDate == other.bookedDate &&
        selectedCompanyServices == other.selectedCompanyServices &&
        carBody == other.carBody &&
        carName == other.carName &&
        carOrder == other.carOrder &&
        cancelWhy == other.cancelWhy &&
        cancelComment == other.cancelComment &&
        cancelTimeDate == other.cancelTimeDate &&
        id == other.id &&
        duration == other.duration &&
        totalPrice == other.totalPrice &&
        notifyTimeName == other.notifyTimeName &&
        selectedTimesOrder == other.selectedTimesOrder &&
        cancelled == other.cancelled &&
        bookedCompanyDocument == other.bookedCompanyDocument &&
        selectedCompanyServicesName == other.selectedCompanyServicesName &&
        bookedDateString == other.bookedDateString &&
        boxName == other.boxName &&
        forCarPay == other.forCarPay &&
        createdByUser == other.createdByUser &&
        createdByAdmin == other.createdByAdmin &&
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
                                                                    $jc(
                                                                        $jc(
                                                                            $jc($jc($jc($jc($jc($jc($jc($jc($jc(0, bookedUser.hashCode), bookedCompany.hashCode), timeName.hashCode), timeOrder.hashCode), status.hashCode), bookedDate.hashCode), selectedCompanyServices.hashCode), carBody.hashCode),
                                                                                carName.hashCode),
                                                                            carOrder.hashCode),
                                                                        cancelWhy.hashCode),
                                                                    cancelComment.hashCode),
                                                                cancelTimeDate.hashCode),
                                                            id.hashCode),
                                                        duration.hashCode),
                                                    totalPrice.hashCode),
                                                notifyTimeName.hashCode),
                                            selectedTimesOrder.hashCode),
                                        cancelled.hashCode),
                                    bookedCompanyDocument.hashCode),
                                selectedCompanyServicesName.hashCode),
                            bookedDateString.hashCode),
                        boxName.hashCode),
                    forCarPay.hashCode),
                createdByUser.hashCode),
            createdByAdmin.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'BookingsRecord')
          ..add('bookedUser', bookedUser)
          ..add('bookedCompany', bookedCompany)
          ..add('timeName', timeName)
          ..add('timeOrder', timeOrder)
          ..add('status', status)
          ..add('bookedDate', bookedDate)
          ..add('selectedCompanyServices', selectedCompanyServices)
          ..add('carBody', carBody)
          ..add('carName', carName)
          ..add('carOrder', carOrder)
          ..add('cancelWhy', cancelWhy)
          ..add('cancelComment', cancelComment)
          ..add('cancelTimeDate', cancelTimeDate)
          ..add('id', id)
          ..add('duration', duration)
          ..add('totalPrice', totalPrice)
          ..add('notifyTimeName', notifyTimeName)
          ..add('selectedTimesOrder', selectedTimesOrder)
          ..add('cancelled', cancelled)
          ..add('bookedCompanyDocument', bookedCompanyDocument)
          ..add('selectedCompanyServicesName', selectedCompanyServicesName)
          ..add('bookedDateString', bookedDateString)
          ..add('boxName', boxName)
          ..add('forCarPay', forCarPay)
          ..add('createdByUser', createdByUser)
          ..add('createdByAdmin', createdByAdmin)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class BookingsRecordBuilder
    implements Builder<BookingsRecord, BookingsRecordBuilder> {
  _$BookingsRecord? _$v;

  DocumentReference<Object?>? _bookedUser;
  DocumentReference<Object?>? get bookedUser => _$this._bookedUser;
  set bookedUser(DocumentReference<Object?>? bookedUser) =>
      _$this._bookedUser = bookedUser;

  DocumentReference<Object?>? _bookedCompany;
  DocumentReference<Object?>? get bookedCompany => _$this._bookedCompany;
  set bookedCompany(DocumentReference<Object?>? bookedCompany) =>
      _$this._bookedCompany = bookedCompany;

  String? _timeName;
  String? get timeName => _$this._timeName;
  set timeName(String? timeName) => _$this._timeName = timeName;

  int? _timeOrder;
  int? get timeOrder => _$this._timeOrder;
  set timeOrder(int? timeOrder) => _$this._timeOrder = timeOrder;

  String? _status;
  String? get status => _$this._status;
  set status(String? status) => _$this._status = status;

  DateTime? _bookedDate;
  DateTime? get bookedDate => _$this._bookedDate;
  set bookedDate(DateTime? bookedDate) => _$this._bookedDate = bookedDate;

  ListBuilder<DocumentReference<Object?>>? _selectedCompanyServices;
  ListBuilder<DocumentReference<Object?>> get selectedCompanyServices =>
      _$this._selectedCompanyServices ??=
          new ListBuilder<DocumentReference<Object?>>();
  set selectedCompanyServices(
          ListBuilder<DocumentReference<Object?>>? selectedCompanyServices) =>
      _$this._selectedCompanyServices = selectedCompanyServices;

  String? _carBody;
  String? get carBody => _$this._carBody;
  set carBody(String? carBody) => _$this._carBody = carBody;

  String? _carName;
  String? get carName => _$this._carName;
  set carName(String? carName) => _$this._carName = carName;

  int? _carOrder;
  int? get carOrder => _$this._carOrder;
  set carOrder(int? carOrder) => _$this._carOrder = carOrder;

  String? _cancelWhy;
  String? get cancelWhy => _$this._cancelWhy;
  set cancelWhy(String? cancelWhy) => _$this._cancelWhy = cancelWhy;

  String? _cancelComment;
  String? get cancelComment => _$this._cancelComment;
  set cancelComment(String? cancelComment) =>
      _$this._cancelComment = cancelComment;

  DateTime? _cancelTimeDate;
  DateTime? get cancelTimeDate => _$this._cancelTimeDate;
  set cancelTimeDate(DateTime? cancelTimeDate) =>
      _$this._cancelTimeDate = cancelTimeDate;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  double? _duration;
  double? get duration => _$this._duration;
  set duration(double? duration) => _$this._duration = duration;

  int? _totalPrice;
  int? get totalPrice => _$this._totalPrice;
  set totalPrice(int? totalPrice) => _$this._totalPrice = totalPrice;

  DateTime? _notifyTimeName;
  DateTime? get notifyTimeName => _$this._notifyTimeName;
  set notifyTimeName(DateTime? notifyTimeName) =>
      _$this._notifyTimeName = notifyTimeName;

  ListBuilder<int>? _selectedTimesOrder;
  ListBuilder<int> get selectedTimesOrder =>
      _$this._selectedTimesOrder ??= new ListBuilder<int>();
  set selectedTimesOrder(ListBuilder<int>? selectedTimesOrder) =>
      _$this._selectedTimesOrder = selectedTimesOrder;

  bool? _cancelled;
  bool? get cancelled => _$this._cancelled;
  set cancelled(bool? cancelled) => _$this._cancelled = cancelled;

  DocumentReference<Object?>? _bookedCompanyDocument;
  DocumentReference<Object?>? get bookedCompanyDocument =>
      _$this._bookedCompanyDocument;
  set bookedCompanyDocument(
          DocumentReference<Object?>? bookedCompanyDocument) =>
      _$this._bookedCompanyDocument = bookedCompanyDocument;

  ListBuilder<String>? _selectedCompanyServicesName;
  ListBuilder<String> get selectedCompanyServicesName =>
      _$this._selectedCompanyServicesName ??= new ListBuilder<String>();
  set selectedCompanyServicesName(
          ListBuilder<String>? selectedCompanyServicesName) =>
      _$this._selectedCompanyServicesName = selectedCompanyServicesName;

  String? _bookedDateString;
  String? get bookedDateString => _$this._bookedDateString;
  set bookedDateString(String? bookedDateString) =>
      _$this._bookedDateString = bookedDateString;

  String? _boxName;
  String? get boxName => _$this._boxName;
  set boxName(String? boxName) => _$this._boxName = boxName;

  double? _forCarPay;
  double? get forCarPay => _$this._forCarPay;
  set forCarPay(double? forCarPay) => _$this._forCarPay = forCarPay;

  bool? _createdByUser;
  bool? get createdByUser => _$this._createdByUser;
  set createdByUser(bool? createdByUser) =>
      _$this._createdByUser = createdByUser;

  bool? _createdByAdmin;
  bool? get createdByAdmin => _$this._createdByAdmin;
  set createdByAdmin(bool? createdByAdmin) =>
      _$this._createdByAdmin = createdByAdmin;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  BookingsRecordBuilder() {
    BookingsRecord._initializeBuilder(this);
  }

  BookingsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _bookedUser = $v.bookedUser;
      _bookedCompany = $v.bookedCompany;
      _timeName = $v.timeName;
      _timeOrder = $v.timeOrder;
      _status = $v.status;
      _bookedDate = $v.bookedDate;
      _selectedCompanyServices = $v.selectedCompanyServices?.toBuilder();
      _carBody = $v.carBody;
      _carName = $v.carName;
      _carOrder = $v.carOrder;
      _cancelWhy = $v.cancelWhy;
      _cancelComment = $v.cancelComment;
      _cancelTimeDate = $v.cancelTimeDate;
      _id = $v.id;
      _duration = $v.duration;
      _totalPrice = $v.totalPrice;
      _notifyTimeName = $v.notifyTimeName;
      _selectedTimesOrder = $v.selectedTimesOrder?.toBuilder();
      _cancelled = $v.cancelled;
      _bookedCompanyDocument = $v.bookedCompanyDocument;
      _selectedCompanyServicesName =
          $v.selectedCompanyServicesName?.toBuilder();
      _bookedDateString = $v.bookedDateString;
      _boxName = $v.boxName;
      _forCarPay = $v.forCarPay;
      _createdByUser = $v.createdByUser;
      _createdByAdmin = $v.createdByAdmin;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BookingsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$BookingsRecord;
  }

  @override
  void update(void Function(BookingsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  BookingsRecord build() => _build();

  _$BookingsRecord _build() {
    _$BookingsRecord _$result;
    try {
      _$result = _$v ??
          new _$BookingsRecord._(
              bookedUser: bookedUser,
              bookedCompany: bookedCompany,
              timeName: timeName,
              timeOrder: timeOrder,
              status: status,
              bookedDate: bookedDate,
              selectedCompanyServices: _selectedCompanyServices?.build(),
              carBody: carBody,
              carName: carName,
              carOrder: carOrder,
              cancelWhy: cancelWhy,
              cancelComment: cancelComment,
              cancelTimeDate: cancelTimeDate,
              id: id,
              duration: duration,
              totalPrice: totalPrice,
              notifyTimeName: notifyTimeName,
              selectedTimesOrder: _selectedTimesOrder?.build(),
              cancelled: cancelled,
              bookedCompanyDocument: bookedCompanyDocument,
              selectedCompanyServicesName:
                  _selectedCompanyServicesName?.build(),
              bookedDateString: bookedDateString,
              boxName: boxName,
              forCarPay: forCarPay,
              createdByUser: createdByUser,
              createdByAdmin: createdByAdmin,
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'selectedCompanyServices';
        _selectedCompanyServices?.build();

        _$failedField = 'selectedTimesOrder';
        _selectedTimesOrder?.build();

        _$failedField = 'selectedCompanyServicesName';
        _selectedCompanyServicesName?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'BookingsRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
