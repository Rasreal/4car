import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _selectPush = prefs.getInt('ff_selectPush') ?? _selectPush;
    });
    _safeInit(() {
      _signINcode = prefs.getBool('ff_signINcode') ?? _signINcode;
    });
    _safeInit(() {
      _singUPcode = prefs.getBool('ff_singUPcode') ?? _singUPcode;
    });
    _safeInit(() {
      _adminForCarServices =
          prefs.getStringList('ff_adminForCarServices') ?? _adminForCarServices;
    });
    _safeInit(() {
      _adminForCarServicesDuration =
          prefs.getStringList('ff_adminForCarServicesDuration') ??
              _adminForCarServicesDuration;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _addCarBody = '';
  String get addCarBody => _addCarBody;
  set addCarBody(String _value) {
    _addCarBody = _value;
  }

  String _addCompanyImg = '';
  String get addCompanyImg => _addCompanyImg;
  set addCompanyImg(String _value) {
    _addCompanyImg = _value;
  }

  DocumentReference? _selectedCar;
  DocumentReference? get selectedCar => _selectedCar;
  set selectedCar(DocumentReference? _value) {
    _selectedCar = _value;
  }

  List<DocumentReference> _selectedServices = [];
  List<DocumentReference> get selectedServices => _selectedServices;
  set selectedServices(List<DocumentReference> _value) {
    _selectedServices = _value;
  }

  void addToSelectedServices(DocumentReference _value) {
    _selectedServices.add(_value);
  }

  void removeFromSelectedServices(DocumentReference _value) {
    _selectedServices.remove(_value);
  }

  void removeAtIndexFromSelectedServices(int _index) {
    _selectedServices.removeAt(_index);
  }

  void updateSelectedServicesAtIndex(
    int _index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    _selectedServices[_index] = updateFn(_selectedServices[_index]);
  }

  void insertAtIndexInSelectedServices(int _index, DocumentReference _value) {
    _selectedServices.insert(_index, _value);
  }

  String _cancelBooking = '';
  String get cancelBooking => _cancelBooking;
  set cancelBooking(String _value) {
    _cancelBooking = _value;
  }

  List<String> _countryCodes = ['+7'];
  List<String> get countryCodes => _countryCodes;
  set countryCodes(List<String> _value) {
    _countryCodes = _value;
  }

  void addToCountryCodes(String _value) {
    _countryCodes.add(_value);
  }

  void removeFromCountryCodes(String _value) {
    _countryCodes.remove(_value);
  }

  void removeAtIndexFromCountryCodes(int _index) {
    _countryCodes.removeAt(_index);
  }

  void updateCountryCodesAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _countryCodes[_index] = updateFn(_countryCodes[_index]);
  }

  void insertAtIndexInCountryCodes(int _index, String _value) {
    _countryCodes.insert(_index, _value);
  }

  String _adminSelectServicesBody = '';
  String get adminSelectServicesBody => _adminSelectServicesBody;
  set adminSelectServicesBody(String _value) {
    _adminSelectServicesBody = _value;
  }

  int _price = 0;
  int get price => _price;
  set price(int _value) {
    _price = _value;
  }

  int _selectPush = 1000;
  int get selectPush => _selectPush;
  set selectPush(int _value) {
    _selectPush = _value;
    prefs.setInt('ff_selectPush', _value);
  }

  bool _signINcode = false;
  bool get signINcode => _signINcode;
  set signINcode(bool _value) {
    _signINcode = _value;
    prefs.setBool('ff_signINcode', _value);
  }

  bool _singUPcode = false;
  bool get singUPcode => _singUPcode;
  set singUPcode(bool _value) {
    _singUPcode = _value;
    prefs.setBool('ff_singUPcode', _value);
  }

  String _adminClentsType = '';
  String get adminClentsType => _adminClentsType;
  set adminClentsType(String _value) {
    _adminClentsType = _value;
  }

  String _adminAnalyticsType = '';
  String get adminAnalyticsType => _adminAnalyticsType;
  set adminAnalyticsType(String _value) {
    _adminAnalyticsType = _value;
  }

  String _adminOfficeType = '';
  String get adminOfficeType => _adminOfficeType;
  set adminOfficeType(String _value) {
    _adminOfficeType = _value;
  }

  String _adminAppBar = '';
  String get adminAppBar => _adminAppBar;
  set adminAppBar(String _value) {
    _adminAppBar = _value;
  }

  DocumentReference? _selectedTimeSlot;
  DocumentReference? get selectedTimeSlot => _selectedTimeSlot;
  set selectedTimeSlot(DocumentReference? _value) {
    _selectedTimeSlot = _value;
  }

  List<int> _bookedTimes = [];
  List<int> get bookedTimes => _bookedTimes;
  set bookedTimes(List<int> _value) {
    _bookedTimes = _value;
  }

  void addToBookedTimes(int _value) {
    _bookedTimes.add(_value);
  }

  void removeFromBookedTimes(int _value) {
    _bookedTimes.remove(_value);
  }

  void removeAtIndexFromBookedTimes(int _index) {
    _bookedTimes.removeAt(_index);
  }

  void updateBookedTimesAtIndex(
    int _index,
    int Function(int) updateFn,
  ) {
    _bookedTimes[_index] = updateFn(_bookedTimes[_index]);
  }

  void insertAtIndexInBookedTimes(int _index, int _value) {
    _bookedTimes.insert(_index, _value);
  }

  List<String> _adminForCarServices = [
    'Комплексная мойка',
    'Мойка кузова',
    'Мойка салона',
    'Обстрел кузова с пеной',
    'Мойка днища',
    'Нано мойка',
    'Полировка салона',
    'Полировка панели',
    'Мойка поликов',
    'Очернение шин',
    'Мойка колес (за ед.)',
    'Мойка дисков (за ед.)',
    'Гидро-полиер кузова',
    'Бесконтактная мойка',
    'Мойка двигателя',
    'Мойка багажника',
    'Полировка кузова',
    'Полная химчистка салона',
    'Химчистка салона (пол)',
    'Химчистка салона (потолок)',
    'Химчистка салона (дверь)',
    'Химчистка салона (сиденье)',
    'Химчистка салона (задние сиденья)',
    'Химчистка салона (багажник)',
    'Химчистка салона (пластик)',
    'Химчистка салона (разбор сидений)',
    'Дезинфекция салона паром',
    'Чистка детского кресла',
    'Нанесение воска'
  ];
  List<String> get adminForCarServices => _adminForCarServices;
  set adminForCarServices(List<String> _value) {
    _adminForCarServices = _value;
    prefs.setStringList('ff_adminForCarServices', _value);
  }

  void addToAdminForCarServices(String _value) {
    _adminForCarServices.add(_value);
    prefs.setStringList('ff_adminForCarServices', _adminForCarServices);
  }

  void removeFromAdminForCarServices(String _value) {
    _adminForCarServices.remove(_value);
    prefs.setStringList('ff_adminForCarServices', _adminForCarServices);
  }

  void removeAtIndexFromAdminForCarServices(int _index) {
    _adminForCarServices.removeAt(_index);
    prefs.setStringList('ff_adminForCarServices', _adminForCarServices);
  }

  void updateAdminForCarServicesAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _adminForCarServices[_index] = updateFn(_adminForCarServices[_index]);
    prefs.setStringList('ff_adminForCarServices', _adminForCarServices);
  }

  void insertAtIndexInAdminForCarServices(int _index, String _value) {
    _adminForCarServices.insert(_index, _value);
    prefs.setStringList('ff_adminForCarServices', _adminForCarServices);
  }

  List<String> _adminForCarServicesDuration = [
    '0 мин',
    '15 мин',
    '20 мин',
    '25 мин',
    '30 мин',
    '35 мин',
    '40 мин',
    '45 мин',
    '50 мин',
    '55 мин',
    '1 час',
    '1ч 10 мин',
    '1ч 20 мин',
    '1ч 30 мин',
    '1ч 40 мин',
    '2 часа',
    '2ч 10 мин',
    '2ч 20 мин',
    '2ч 30 мин',
    '2ч 40 мин',
    '3 часа'
  ];
  List<String> get adminForCarServicesDuration => _adminForCarServicesDuration;
  set adminForCarServicesDuration(List<String> _value) {
    _adminForCarServicesDuration = _value;
    prefs.setStringList('ff_adminForCarServicesDuration', _value);
  }

  void addToAdminForCarServicesDuration(String _value) {
    _adminForCarServicesDuration.add(_value);
    prefs.setStringList(
        'ff_adminForCarServicesDuration', _adminForCarServicesDuration);
  }

  void removeFromAdminForCarServicesDuration(String _value) {
    _adminForCarServicesDuration.remove(_value);
    prefs.setStringList(
        'ff_adminForCarServicesDuration', _adminForCarServicesDuration);
  }

  void removeAtIndexFromAdminForCarServicesDuration(int _index) {
    _adminForCarServicesDuration.removeAt(_index);
    prefs.setStringList(
        'ff_adminForCarServicesDuration', _adminForCarServicesDuration);
  }

  void updateAdminForCarServicesDurationAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _adminForCarServicesDuration[_index] =
        updateFn(_adminForCarServicesDuration[_index]);
    prefs.setStringList(
        'ff_adminForCarServicesDuration', _adminForCarServicesDuration);
  }

  void insertAtIndexInAdminForCarServicesDuration(int _index, String _value) {
    _adminForCarServicesDuration.insert(_index, _value);
    prefs.setStringList(
        'ff_adminForCarServicesDuration', _adminForCarServicesDuration);
  }

  double _superAdminSelectPercent = 0.0;
  double get superAdminSelectPercent => _superAdminSelectPercent;
  set superAdminSelectPercent(double _value) {
    _superAdminSelectPercent = _value;
  }

  bool _superAdminCencelledModeration = false;
  bool get superAdminCencelledModeration => _superAdminCencelledModeration;
  set superAdminCencelledModeration(bool _value) {
    _superAdminCencelledModeration = _value;
  }

  bool _superAdminRejectModeration = false;
  bool get superAdminRejectModeration => _superAdminRejectModeration;
  set superAdminRejectModeration(bool _value) {
    _superAdminRejectModeration = _value;
  }

  bool _superAdminSuccessModeration = false;
  bool get superAdminSuccessModeration => _superAdminSuccessModeration;
  set superAdminSuccessModeration(bool _value) {
    _superAdminSuccessModeration = _value;
  }

  List<String> _bookingSelectedServicesName = [];
  List<String> get bookingSelectedServicesName => _bookingSelectedServicesName;
  set bookingSelectedServicesName(List<String> _value) {
    _bookingSelectedServicesName = _value;
  }

  void addToBookingSelectedServicesName(String _value) {
    _bookingSelectedServicesName.add(_value);
  }

  void removeFromBookingSelectedServicesName(String _value) {
    _bookingSelectedServicesName.remove(_value);
  }

  void removeAtIndexFromBookingSelectedServicesName(int _index) {
    _bookingSelectedServicesName.removeAt(_index);
  }

  void updateBookingSelectedServicesNameAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _bookingSelectedServicesName[_index] =
        updateFn(_bookingSelectedServicesName[_index]);
  }

  void insertAtIndexInBookingSelectedServicesName(int _index, String _value) {
    _bookingSelectedServicesName.insert(_index, _value);
  }

  DocumentReference? _adminOfficeCurrentCompany;
  DocumentReference? get adminOfficeCurrentCompany =>
      _adminOfficeCurrentCompany;
  set adminOfficeCurrentCompany(DocumentReference? _value) {
    _adminOfficeCurrentCompany = _value;
  }

  int _selectedServicesDuration = 0;
  int get selectedServicesDuration => _selectedServicesDuration;
  set selectedServicesDuration(int _value) {
    _selectedServicesDuration = _value;
  }

  String _adminClientsTypeReview = '';
  String get adminClientsTypeReview => _adminClientsTypeReview;
  set adminClientsTypeReview(String _value) {
    _adminClientsTypeReview = _value;
  }

  String _adminAddStaff = '';
  String get adminAddStaff => _adminAddStaff;
  set adminAddStaff(String _value) {
    _adminAddStaff = _value;
  }

  String _adminAddStaffFIO = '';
  String get adminAddStaffFIO => _adminAddStaffFIO;
  set adminAddStaffFIO(String _value) {
    _adminAddStaffFIO = _value;
  }

  String _adminAddStaffPhone = '';
  String get adminAddStaffPhone => _adminAddStaffPhone;
  set adminAddStaffPhone(String _value) {
    _adminAddStaffPhone = _value;
  }

  DateTime? _adminSelectBookingDate;
  DateTime? get adminSelectBookingDate => _adminSelectBookingDate;
  set adminSelectBookingDate(DateTime? _value) {
    _adminSelectBookingDate = _value;
  }

  String _superAdminSelectedCityName = '';
  String get superAdminSelectedCityName => _superAdminSelectedCityName;
  set superAdminSelectedCityName(String _value) {
    _superAdminSelectedCityName = _value;
  }

  DocumentReference? _superAdminSelectedCity;
  DocumentReference? get superAdminSelectedCity => _superAdminSelectedCity;
  set superAdminSelectedCity(DocumentReference? _value) {
    _superAdminSelectedCity = _value;
  }

  String _superAdminCurrentCompany = '';
  String get superAdminCurrentCompany => _superAdminCurrentCompany;
  set superAdminCurrentCompany(String _value) {
    _superAdminCurrentCompany = _value;
  }

  DocumentReference? _adminNotificationLink;
  DocumentReference? get adminNotificationLink => _adminNotificationLink;
  set adminNotificationLink(DocumentReference? _value) {
    _adminNotificationLink = _value;
  }

  String _webFilterDayName = '';
  String get webFilterDayName => _webFilterDayName;
  set webFilterDayName(String _value) {
    _webFilterDayName = _value;
  }

  DateTime? _WEBFilterStartDate;
  DateTime? get WEBFilterStartDate => _WEBFilterStartDate;
  set WEBFilterStartDate(DateTime? _value) {
    _WEBFilterStartDate = _value;
  }

  DateTime? _WEBFilterEndDate;
  DateTime? get WEBFilterEndDate => _WEBFilterEndDate;
  set WEBFilterEndDate(DateTime? _value) {
    _WEBFilterEndDate = _value;
  }

  String _WEBFilterSelectedDayName = '';
  String get WEBFilterSelectedDayName => _WEBFilterSelectedDayName;
  set WEBFilterSelectedDayName(String _value) {
    _WEBFilterSelectedDayName = _value;
  }

  String _WEBFilterCarBody = '';
  String get WEBFilterCarBody => _WEBFilterCarBody;
  set WEBFilterCarBody(String _value) {
    _WEBFilterCarBody = _value;
  }

  String _WEBFilterReviewStatus = '';
  String get WEBFilterReviewStatus => _WEBFilterReviewStatus;
  set WEBFilterReviewStatus(String _value) {
    _WEBFilterReviewStatus = _value;
  }

  DocumentReference? _WEBfilterSelectCity;
  DocumentReference? get WEBfilterSelectCity => _WEBfilterSelectCity;
  set WEBfilterSelectCity(DocumentReference? _value) {
    _WEBfilterSelectCity = _value;
  }

  String _WEBFilterCompanyStatus = '';
  String get WEBFilterCompanyStatus => _WEBFilterCompanyStatus;
  set WEBFilterCompanyStatus(String _value) {
    _WEBFilterCompanyStatus = _value;
  }

  String _PrevWEBFilterDateName = '';
  String get PrevWEBFilterDateName => _PrevWEBFilterDateName;
  set PrevWEBFilterDateName(String _value) {
    _PrevWEBFilterDateName = _value;
  }

  List<String> _webListNames = [];
  List<String> get webListNames => _webListNames;
  set webListNames(List<String> _value) {
    _webListNames = _value;
  }

  void addToWebListNames(String _value) {
    _webListNames.add(_value);
  }

  void removeFromWebListNames(String _value) {
    _webListNames.remove(_value);
  }

  void removeAtIndexFromWebListNames(int _index) {
    _webListNames.removeAt(_index);
  }

  void updateWebListNamesAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _webListNames[_index] = updateFn(_webListNames[_index]);
  }

  void insertAtIndexInWebListNames(int _index, String _value) {
    _webListNames.insert(_index, _value);
  }

  bool _adminCreateStaff = false;
  bool get adminCreateStaff => _adminCreateStaff;
  set adminCreateStaff(bool _value) {
    _adminCreateStaff = _value;
  }

  DocumentReference? _addStuffuserRef;
  DocumentReference? get addStuffuserRef => _addStuffuserRef;
  set addStuffuserRef(DocumentReference? _value) {
    _addStuffuserRef = _value;
  }

  int _excOborot = 0;
  int get excOborot => _excOborot;
  set excOborot(int _value) {
    _excOborot = _value;
  }

  String _excOborotName = '';
  String get excOborotName => _excOborotName;
  set excOborotName(String _value) {
    _excOborotName = _value;
  }

  int _excCarWashed = 0;
  int get excCarWashed => _excCarWashed;
  set excCarWashed(int _value) {
    _excCarWashed = _value;
  }

  double _excAvgCheque = 0.0;
  double get excAvgCheque => _excAvgCheque;
  set excAvgCheque(double _value) {
    _excAvgCheque = _value;
  }

  String _excAvgChequeName = '';
  String get excAvgChequeName => _excAvgChequeName;
  set excAvgChequeName(String _value) {
    _excAvgChequeName = _value;
  }

  double _excOborotForCarPercent = 0.0;
  double get excOborotForCarPercent => _excOborotForCarPercent;
  set excOborotForCarPercent(double _value) {
    _excOborotForCarPercent = _value;
  }

  String _excOborotForCarPercentName = '';
  String get excOborotForCarPercentName => _excOborotForCarPercentName;
  set excOborotForCarPercentName(String _value) {
    _excOborotForCarPercentName = _value;
  }

  String _webFilterCompany = '';
  String get webFilterCompany => _webFilterCompany;
  set webFilterCompany(String _value) {
    _webFilterCompany = _value;
  }

  String _webFilterSecetedCompanyName = '';
  String get webFilterSecetedCompanyName => _webFilterSecetedCompanyName;
  set webFilterSecetedCompanyName(String _value) {
    _webFilterSecetedCompanyName = _value;
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
