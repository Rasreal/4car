import 'dart:async';
import 'dart:convert';

import 'serialization_util.dart';
import '../backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import '../../index.dart';
import '../../main.dart';

final _handledMessageIds = <String?>{};

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({Key? key, required this.child})
      : super(key: key);

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    if (_handledMessageIds.contains(message.messageId)) {
      return;
    }
    _handledMessageIds.add(message.messageId);

    if (mounted) {
      setState(() => _loading = true);
    }
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final parametersBuilder = parametersBuilderMap[initialPageName];
      if (parametersBuilder != null) {
        final parameterData = await parametersBuilder(initialParameterData);
        context.pushNamed(
          initialPageName,
          params: parameterData.params,
          extra: parameterData.extra,
        );
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      if (mounted) {
        setState(() => _loading = false);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    handleOpenedPushNotification();
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Container(
          color: Colors.white,
          child: Image.asset(
            'assets/images/Group_668.png',
            fit: BoxFit.none,
          ),
        )
      : widget.child;
}

class ParameterData {
  const ParameterData(
      {this.requiredParams = const {}, this.allParams = const {}});
  final Map<String, String?> requiredParams;
  final Map<String, dynamic> allParams;

  Map<String, String> get params => Map.fromEntries(
        requiredParams.entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
  Map<String, dynamic> get extra => Map.fromEntries(
        allParams.entries.where((e) => e.value != null),
      );

  static Future<ParameterData> Function(Map<String, dynamic>) none() =>
      (data) async => ParameterData();
}

final parametersBuilderMap =
    <String, Future<ParameterData> Function(Map<String, dynamic>)>{
  'Onboarding': ParameterData.none(),
  'Sign_in': ParameterData.none(),
  'HomePage': ParameterData.none(),
  'Sign_Up': ParameterData.none(),
  'code': (data) async => ParameterData(
        allParams: {
          'phone': getParameter<String>(data, 'phone'),
        },
      ),
  'sign_up_code': ParameterData.none(),
  'Sign_Up_2': ParameterData.none(),
  'booking_page': (data) async => ParameterData(
        allParams: {
          'company': await getDocumentParameter<CompaniesRecord>(
              data, 'company', CompaniesRecord.serializer),
        },
      ),
  'Terms_of_Use': ParameterData.none(),
  'My_notes': ParameterData.none(),
  'current_booking_record': (data) async => ParameterData(
        allParams: {
          'booking': getParameter<DocumentReference>(data, 'booking'),
        },
      ),
  'About_company': ParameterData.none(),
  'profile': ParameterData.none(),
  'select_city': ParameterData.none(),
  'edit_profile': (data) async => ParameterData(
        allParams: {
          'page': getParameter<String>(data, 'page'),
        },
      ),
  'Favorites_Car_Washes': ParameterData.none(),
  'admin_sign_in_email': ParameterData.none(),
  'admin_sign_up_email': ParameterData.none(),
  'admin_forget_password': ParameterData.none(),
  'admin_forget_password_2': (data) async => ParameterData(
        allParams: {
          'email': getParameter<String>(data, 'email'),
        },
      ),
  'admin_main': ParameterData.none(),
  'admin_reports': ParameterData.none(),
  'admin_office': (data) async => ParameterData(
        allParams: {
          'success': getParameter<bool>(data, 'success'),
        },
      ),
  'admin_clients': ParameterData.none(),
  'admin_analytics': ParameterData.none(),
  'admin_add_company_1': (data) async => ParameterData(
        allParams: {
          'company': getParameter<DocumentReference>(data, 'company'),
        },
      ),
  'admin_add_company_3': (data) async => ParameterData(
        allParams: {
          'docCompany': await getDocumentParameter<CompaniesRecord>(
              data, 'docCompany', CompaniesRecord.serializer),
          'company': getParameter<DocumentReference>(data, 'company'),
        },
      ),
  'admin_add_company_2': (data) async => ParameterData(
        allParams: {
          'company': await getDocumentParameter<CompaniesRecord>(
              data, 'company', CompaniesRecord.serializer),
        },
      ),
  'admin_add_company_4': (data) async => ParameterData(
        allParams: {
          'company': getParameter<DocumentReference>(data, 'company'),
          'docCompany': await getDocumentParameter<CompaniesRecord>(
              data, 'docCompany', CompaniesRecord.serializer),
        },
      ),
  'admin_add_company_5': (data) async => ParameterData(
        allParams: {
          'company': getParameter<DocumentReference>(data, 'company'),
          'companyDoc': await getDocumentParameter<CompaniesRecord>(
              data, 'companyDoc', CompaniesRecord.serializer),
        },
      ),
  'admin_add_staff_2': (data) async => ParameterData(
        allParams: {
          'email': getParameter<String>(data, 'email'),
          'password': getParameter<String>(data, 'password'),
          'password2': getParameter<String>(data, 'password2'),
          'companyDocument': await getDocumentParameter<CompanyDocumentRecord>(
              data, 'companyDocument', CompanyDocumentRecord.serializer),
        },
      ),
  'admin_add_staff_3': (data) async => ParameterData(
        allParams: {
          'email': getParameter<String>(data, 'email'),
          'password': getParameter<String>(data, 'password'),
          'password1': getParameter<String>(data, 'password1'),
          'companyDocument': await getDocumentParameter<CompanyDocumentRecord>(
              data, 'companyDocument', CompanyDocumentRecord.serializer),
        },
      ),
  'admin_add_staff_1': (data) async => ParameterData(
        allParams: {
          'companyDocument': await getDocumentParameter<CompanyDocumentRecord>(
              data, 'companyDocument', CompanyDocumentRecord.serializer),
        },
      ),
  'super_admin_main': ParameterData.none(),
  'super_admin_moderation': ParameterData.none(),
  'super_admin_moderation_1': (data) async => ParameterData(
        allParams: {
          'company': getParameter<DocumentReference>(data, 'company'),
        },
      ),
  'super_admin_moderation_2': (data) async => ParameterData(
        allParams: {
          'company': getParameter<DocumentReference>(data, 'company'),
        },
      ),
  'super_admin_moderation_3': (data) async => ParameterData(
        allParams: {
          'company': getParameter<DocumentReference>(data, 'company'),
        },
      ),
  'super_admin_current_company': (data) async => ParameterData(
        allParams: {
          'currentCompany':
              getParameter<DocumentReference>(data, 'currentCompany'),
        },
      ),
  'super_admin_analytics': ParameterData.none(),
  'super_admin_current_user': (data) async => ParameterData(
        allParams: {
          'currentUser': await getDocumentParameter<UserRecord>(
              data, 'currentUser', UserRecord.serializer),
        },
      ),
  'super_admin_sales_moderation': ParameterData.none(),
  'booking_pageCopy': (data) async => ParameterData(
        allParams: {
          'company': await getDocumentParameter<CompaniesRecord>(
              data, 'company', CompaniesRecord.serializer),
        },
      ),
  'admin_notifications': ParameterData.none(),
  'super_admin_cancelled_bookings': ParameterData.none(),
  'super_admin_profile': ParameterData.none(),
  'manager_profile': ParameterData.none(),
  'super_admin_users': ParameterData.none(),
};

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}
