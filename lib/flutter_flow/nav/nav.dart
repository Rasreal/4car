import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import '../flutter_flow_theme.dart';
import '../../backend/backend.dart';

import '../../auth/firebase_user_provider.dart';
import '../../backend/push_notifications/push_notifications_handler.dart'
    show PushNotificationsHandler;

import '../../index.dart';
import '../../main.dart';
import '../lat_lng.dart';
import '../place.dart';
import 'serialization_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  ForCarMainFirebaseUser? initialUser;
  ForCarMainFirebaseUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(ForCarMainFirebaseUser newUser) {
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    if (notifyOnAuthChange) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, _) =>
          appStateNotifier.loggedIn ? NavBarPage() : OnboardingWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? NavBarPage() : OnboardingWidget(),
          routes: [
            FFRoute(
              name: 'Onboarding',
              path: 'onboarding',
              builder: (context, params) => OnboardingWidget(),
            ),
            FFRoute(
              name: 'Sign_in',
              path: 'signIn',
              builder: (context, params) => SignInWidget(),
            ),
            FFRoute(
              name: 'HomePage',
              path: 'homePage',
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'HomePage')
                  : HomePageWidget(),
            ),
            FFRoute(
              name: 'Sign_Up',
              path: 'signUp',
              builder: (context, params) => SignUpWidget(),
            ),
            FFRoute(
              name: 'code',
              path: 'code',
              builder: (context, params) => CodeWidget(),
            ),
            FFRoute(
              name: 'sign_up_code',
              path: 'signUpCode',
              builder: (context, params) => SignUpCodeWidget(),
            ),
            FFRoute(
              name: 'Sign_Up_2',
              path: 'signUp2',
              builder: (context, params) => SignUp2Widget(),
            ),
            FFRoute(
              name: 'booking_page',
              path: 'bookingPage',
              asyncParams: {
                'company': getDoc(['companies'], CompaniesRecord.serializer),
              },
              builder: (context, params) => BookingPageWidget(
                company: params.getParam('company', ParamType.Document),
              ),
            ),
            FFRoute(
              name: 'My_notes',
              path: 'myNotes',
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'My_notes')
                  : MyNotesWidget(),
            ),
            FFRoute(
              name: 'Terms_of_Use',
              path: 'termsOfUse',
              builder: (context, params) => TermsOfUseWidget(),
            ),
            FFRoute(
              name: 'current_booking_record',
              path: 'currentBookingRecord',
              builder: (context, params) => CurrentBookingRecordWidget(
                booking: params.getParam('booking', ParamType.DocumentReference,
                    false, ['bookings']),
              ),
            ),
            FFRoute(
              name: 'About_company',
              path: 'aboutCompany',
              builder: (context, params) => AboutCompanyWidget(),
            ),
            FFRoute(
              name: 'profile',
              path: 'profile',
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'profile')
                  : ProfileWidget(),
            ),
            FFRoute(
              name: 'select_city',
              path: 'selectCity',
              builder: (context, params) => SelectCityWidget(),
            ),
            FFRoute(
              name: 'edit_profile',
              path: 'editProfile',
              builder: (context, params) => EditProfileWidget(
                page: params.getParam('page', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'Favorites_Car_Washes',
              path: 'favoritesCarWashes',
              builder: (context, params) => FavoritesCarWashesWidget(),
            ),
            FFRoute(
              name: 'admin_sign_in_email',
              path: 'adminSignInEmail',
              builder: (context, params) => AdminSignInEmailWidget(),
            ),
            FFRoute(
              name: 'admin_sign_up_email',
              path: 'adminSignUpEmail',
              builder: (context, params) => AdminSignUpEmailWidget(),
            ),
            FFRoute(
              name: 'admin_forget_password',
              path: 'adminForgetPassword',
              builder: (context, params) => AdminForgetPasswordWidget(),
            ),
            FFRoute(
              name: 'admin_forget_password_2',
              path: 'adminForgetPassword2',
              builder: (context, params) => AdminForgetPassword2Widget(),
            ),
            FFRoute(
              name: 'admin_main',
              path: 'adminMain',
              builder: (context, params) => AdminMainWidget(),
            ),
            FFRoute(
              name: 'admin_reports',
              path: 'adminReports',
              builder: (context, params) => AdminReportsWidget(),
            ),
            FFRoute(
              name: 'admin_clients',
              path: 'adminClients',
              builder: (context, params) => AdminClientsWidget(),
            ),
            FFRoute(
              name: 'admin_analytics',
              path: 'adminAnalytics',
              builder: (context, params) => AdminAnalyticsWidget(),
            ),
            FFRoute(
              name: 'admin_office',
              path: 'adminOffice',
              builder: (context, params) => AdminOfficeWidget(),
            ),
            FFRoute(
              name: 'admin_add_company_1',
              path: 'adminAddCompany1',
              builder: (context, params) => AdminAddCompany1Widget(
                company: params.getParam('company', ParamType.DocumentReference,
                    false, ['companies']),
              ),
            ),
            FFRoute(
              name: 'admin_add_company_2',
              path: 'adminAddCompany2',
              asyncParams: {
                'company': getDoc(['companies'], CompaniesRecord.serializer),
              },
              builder: (context, params) => AdminAddCompany2Widget(
                company: params.getParam('company', ParamType.Document),
              ),
            ),
            FFRoute(
              name: 'admin_add_company_3',
              path: 'adminAddCompany3',
              asyncParams: {
                'docCompany': getDoc(['companies'], CompaniesRecord.serializer),
              },
              builder: (context, params) => AdminAddCompany3Widget(
                docCompany: params.getParam('docCompany', ParamType.Document),
                company: params.getParam('company', ParamType.DocumentReference,
                    false, ['companies']),
              ),
            ),
            FFRoute(
              name: 'admin_add_company_4',
              path: 'adminAddCompany4',
              asyncParams: {
                'docCompany': getDoc(['companies'], CompaniesRecord.serializer),
              },
              builder: (context, params) => AdminAddCompany4Widget(
                company: params.getParam('company', ParamType.DocumentReference,
                    false, ['companies']),
                docCompany: params.getParam('docCompany', ParamType.Document),
              ),
            ),
            FFRoute(
              name: 'admin_add_company_5',
              path: 'adminAddCompany5',
              asyncParams: {
                'companyDoc': getDoc(['companies'], CompaniesRecord.serializer),
              },
              builder: (context, params) => AdminAddCompany5Widget(
                company: params.getParam('company', ParamType.DocumentReference,
                    false, ['companies']),
                companyDoc: params.getParam('companyDoc', ParamType.Document),
              ),
            ),
            FFRoute(
              name: 'admin_add_staff_1',
              path: 'adminAddStaff1',
              builder: (context, params) => AdminAddStaff1Widget(),
            ),
            FFRoute(
              name: 'admin_add_staff_2',
              path: 'adminAddStaff2',
              builder: (context, params) => AdminAddStaff2Widget(
                email: params.getParam('email', ParamType.String),
                password: params.getParam('password', ParamType.String),
                password2: params.getParam('password2', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'admin_add_staff_3',
              path: 'adminAddStaff3',
              builder: (context, params) => AdminAddStaff3Widget(
                email: params.getParam('email', ParamType.String),
                password: params.getParam('password', ParamType.String),
                password1: params.getParam('password1', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'super_admin_main',
              path: 'superAdminMain',
              builder: (context, params) => SuperAdminMainWidget(),
            ),
            FFRoute(
              name: 'super_admin_moderation',
              path: 'superAdminModeration',
              builder: (context, params) => SuperAdminModerationWidget(),
            ),
            FFRoute(
              name: 'super_admin_moderation_1',
              path: 'superAdminModeration1',
              builder: (context, params) => SuperAdminModeration1Widget(
                company: params.getParam('company', ParamType.DocumentReference,
                    false, ['companies']),
              ),
            ),
            FFRoute(
              name: 'super_admin_moderation_3',
              path: 'superAdminModeration3',
              builder: (context, params) => SuperAdminModeration3Widget(
                company: params.getParam('company', ParamType.DocumentReference,
                    false, ['companies']),
              ),
            ),
            FFRoute(
              name: 'super_admin_moderation_2',
              path: 'superAdminModeration2',
              builder: (context, params) => SuperAdminModeration2Widget(
                company: params.getParam('company', ParamType.DocumentReference,
                    false, ['companies']),
              ),
            ),
            FFRoute(
              name: 'super_admin_current_company',
              path: 'superAdminCurrentCompany',
              builder: (context, params) => SuperAdminCurrentCompanyWidget(),
            ),
            FFRoute(
              name: 'super_admin_analytics',
              path: 'superAdminAnalytics',
              builder: (context, params) => SuperAdminAnalyticsWidget(),
            ),
            FFRoute(
              name: 'super_admin_users',
              path: 'superAdminUsers',
              builder: (context, params) => SuperAdminUsersWidget(),
            ),
            FFRoute(
              name: 'super_admin_current_user',
              path: 'superAdminCurrentUser',
              asyncParams: {
                'currentUser': getDoc(['user'], UserRecord.serializer),
              },
              builder: (context, params) => SuperAdminCurrentUserWidget(
                currentUser: params.getParam('currentUser', ParamType.Document),
              ),
            ),
            FFRoute(
              name: 'booking_pageCopy',
              path: 'bookingPageCopy',
              asyncParams: {
                'company': getDoc(['companies'], CompaniesRecord.serializer),
              },
              builder: (context, params) => BookingPageCopyWidget(
                company: params.getParam('company', ParamType.Document),
              ),
            ),
            FFRoute(
              name: 'HomePageCopy',
              path: 'homePageCopy',
              builder: (context, params) => HomePageCopyWidget(),
            )
          ].map((r) => r.toRoute(appStateNotifier)).toList(),
        ).toRoute(appStateNotifier),
      ],
      urlPathStrategy: UrlPathStrategy.path,
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> params = const <String, String>{},
    Map<String, String> queryParams = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              params: params,
              queryParams: queryParams,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> params = const <String, String>{},
    Map<String, String> queryParams = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              params: params,
              queryParams: queryParams,
              extra: extra,
            );
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState =>
      (routerDelegate.refreshListenable as AppStateNotifier);
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void setRedirectLocationIfUnset(String location) =>
      (routerDelegate.refreshListenable as AppStateNotifier)
          .updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(params)
    ..addAll(queryParams)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.extraMap.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, [
    bool isList = false,
    List<String>? collectionNamePath,
  ]) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(param, type, isList, collectionNamePath);
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.location);
            return '/onboarding';
          }
          return null;
        },
        pageBuilder: (context, state) {
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Container(
                  color: Colors.transparent,
                  child: Image.asset(
                    'assets/images/Splash.png',
                    fit: BoxFit.cover,
                  ),
                )
              : PushNotificationsHandler(child: page);

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder: PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).transitionsBuilder,
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}
