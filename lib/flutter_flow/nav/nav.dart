import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';


import '/auth/base_auth_user_provider.dart';

import '/backend/push_notifications/push_notifications_handler.dart'
    show PushNotificationsHandler;
import '/index.dart';
import '/flutter_flow/flutter_flow_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
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

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
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
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? const WitamWidget() : const Login6Widget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? const WitamWidget() : const Login6Widget(),
        ),
        FFRoute(
          name: 'Login6',
          path: '/login6',
          builder: (context, params) => const Login6Widget(),
        ),
        FFRoute(
          name: 'Kurier',
          path: '/kurier',
          builder: (context, params) => const KurierWidget(),
        ),
        FFRoute(
          name: 'Witam',
          path: '/witam',
          builder: (context, params) => const WitamWidget(),
        ),
        FFRoute(
          name: 'AktywniKurierzy',
          path: '/aktywniKurierzy',
          builder: (context, params) => const AktywniKurierzyWidget(),
        ),
        FFRoute(
          name: 'Restaura',
          path: '/restaura',
          builder: (context, params) => const RestauraWidget(),
        ),
        FFRoute(
          name: 'Admin',
          path: '/admin',
          builder: (context, params) => const AdminWidget(),
        ),
        FFRoute(
          name: 'GieldaZlecen',
          path: '/gieldaZlecen',
          builder: (context, params) => const GieldaZlecenWidget(),
        ),
        FFRoute(
          name: 'ZamowPierwsze',
          path: '/zamowPierwsze',
          builder: (context, params) => ZamowPierwszeWidget(
            kurierzydopowiadomienia: params.getParam<DocumentReference>(
              'kurierzydopowiadomienia',
              ParamType.DocumentReference,
              isList: true,
              collectionNamePath: ['User'],
            ),
          ),
        ),
        FFRoute(
          name: 'Dzisiejszezlecenia',
          path: '/dzisiejszezlecenia',
          builder: (context, params) => const DzisiejszezleceniaWidget(),
        ),
        FFRoute(
          name: 'Zleceniakuriera',
          path: '/zleceniakuriera',
          builder: (context, params) => const ZleceniakurieraWidget(),
        ),
        FFRoute(
          name: 'dodajdzwiek',
          path: '/dodajdzwiek',
          builder: (context, params) => const DodajdzwiekWidget(),
        ),
        FFRoute(
          name: 'UstawieniaKurier',
          path: '/ustawieniaKurier',
          builder: (context, params) => const UstawieniaKurierWidget(),
        ),
        FFRoute(
          name: 'Mojestatystyki',
          path: '/mojestatystyki',
          builder: (context, params) => MojestatystykiWidget(
            maczo2: params.getParam<DocumentReference>(
              'maczo2',
              ParamType.DocumentReference,
              isList: true,
              collectionNamePath: ['Zamowienie'],
            ),
          ),
        ),
        FFRoute(
          name: 'Historiazlecen',
          path: '/historiazlecen',
          builder: (context, params) => const HistoriazlecenWidget(),
        ),
        FFRoute(
          name: 'Zmienhaslo',
          path: '/zmienhaslo',
          builder: (context, params) => const ZmienhasloWidget(),
        ),
        FFRoute(
          name: 'Zleceniakurieraobcy',
          path: '/zleceniakurieraobcy',
          builder: (context, params) => const ZleceniakurieraobcyWidget(),
        ),
        FFRoute(
          name: 'numerytel',
          path: '/numerytel',
          builder: (context, params) => const NumerytelWidget(),
        ),
        FFRoute(
          name: 'CreateAccount1',
          path: '/createAccount1',
          builder: (context, params) => const CreateAccount1Widget(),
        ),
        FFRoute(
          name: 'Historiazlecenrestauracja',
          path: '/historiazlecenrestauracja',
          builder: (context, params) => const HistoriazlecenrestauracjaWidget(),
        ),
        FFRoute(
          name: 'Mojestatystykirestauracja',
          path: '/mojestatystykirestauracja',
          builder: (context, params) => MojestatystykirestauracjaWidget(
            maczo: params.getParam<DocumentReference>(
              'maczo',
              ParamType.DocumentReference,
              isList: true,
              collectionNamePath: ['Zamowienie'],
            ),
          ),
        ),
        FFRoute(
          name: 'Mojestatystykiadmiin',
          path: '/mojestatystykiadmiin',
          builder: (context, params) => MojestatystykiadmiinWidget(
            maczo2: params.getParam<DocumentReference>(
              'maczo2',
              ParamType.DocumentReference,
              isList: true,
              collectionNamePath: ['Zamowienie'],
            ),
          ),
        ),
        FFRoute(
          name: 'Historiazlecenadmin',
          path: '/historiazlecenadmin',
          builder: (context, params) => const HistoriazlecenadminWidget(),
        ),
        FFRoute(
          name: 'Zleceniakurieraadmin',
          path: '/zleceniakurieraadmin',
          builder: (context, params) => const ZleceniakurieraadminWidget(),
        ),
        FFRoute(
          name: 'Odrzuconeadmin',
          path: '/odrzuconeadmin',
          builder: (context, params) => const OdrzuconeadminWidget(),
        ),
        FFRoute(
          name: 'zmianahasla',
          path: '/zmianahasla',
          builder: (context, params) => const ZmianahaslaWidget(),
        ),
        FFRoute(
          name: 'klasyfikacja',
          path: '/klasyfikacja',
          builder: (context, params) => const KlasyfikacjaWidget(),
        ),
        FFRoute(
          name: 'dodajstrefe',
          path: '/dodajstrefe',
          builder: (context, params) => const DodajstrefeWidget(),
        ),
        FFRoute(
          name: 'rozliczeniakurierzy',
          path: '/rozliczeniakurierzy',
          builder: (context, params) => const RozliczeniakurierzyWidget(),
        ),
        FFRoute(
          name: 'mojehajsy',
          path: '/mojehajsy',
          builder: (context, params) => const MojehajsyWidget(),
        ),
        FFRoute(
          name: 'kreatorkonta',
          path: '/kreatorkonta',
          builder: (context, params) => const KreatorkontaWidget(),
        ),
        FFRoute(
          name: 'Kurierzyadmin',
          path: '/kurierzyadmin',
          builder: (context, params) => const KurierzyadminWidget(),
        ),
        FFRoute(
          name: 'Statystykiinnegokuriera',
          path: '/statystykiinnegokuriera',
          builder: (context, params) => StatystykiinnegokurieraWidget(
            maczo2: params.getParam<DocumentReference>(
              'maczo2',
              ParamType.DocumentReference,
              isList: true,
              collectionNamePath: ['Zamowienie'],
            ),
          ),
        ),
        FFRoute(
          name: 'Historiazleceninnegokuriera',
          path: '/historiazleceninnegokuriera',
          builder: (context, params) => const HistoriazleceninnegokurieraWidget(),
        ),
        FFRoute(
          name: 'Restauracjeadmin',
          path: '/restauracjeadmin',
          builder: (context, params) => const RestauracjeadminWidget(),
        ),
        FFRoute(
          name: 'Historiazlecenrestauracjaadmin',
          path: '/historiazlecenrestauracjaadmin',
          builder: (context, params) => const HistoriazlecenrestauracjaadminWidget(),
        ),
        FFRoute(
          name: 'Wybierzkontokurier',
          path: '/wybierzkontokurier',
          builder: (context, params) => const WybierzkontokurierWidget(),
        ),
        FFRoute(
          name: 'inforkurier',
          path: '/inforkurier',
          builder: (context, params) => const InforkurierWidget(),
        ),
        FFRoute(
          name: 'Przyjmijipolacz',
          path: '/przyjmijipolacz',
          builder: (context, params) => const PrzyjmijipolaczWidget(),
        ),
        FFRoute(
          name: 'pracownicy',
          path: '/pracownicy',
          builder: (context, params) => const PracownicyWidget(),
        ),
        FFRoute(
          name: 'Dodajpracownika',
          path: '/dodajpracownika',
          builder: (context, params) => const DodajpracownikaWidget(),
        ),
        FFRoute(
          name: 'banned',
          path: '/banned',
          builder: (context, params) => const BannedWidget(),
        ),
        FFRoute(
          name: 'specjal',
          path: '/specjal',
          builder: (context, params) => const SpecjalWidget(),
        ),
        FFRoute(
          name: 'grafikk',
          path: '/grafikk',
          builder: (context, params) => const GrafikkWidget(),
        ),
        FFRoute(
          name: 'Zapisanikurierzy',
          path: '/zapisanikurierzy',
          builder: (context, params) => ZapisanikurierzyWidget(
            bajka: params.getParam(
              'bajka',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['grafik'],
            ),
          ),
        ),
        FFRoute(
          name: 'grafikkadmin',
          path: '/grafikkadmin',
          builder: (context, params) => const GrafikkadminWidget(),
        ),
        FFRoute(
          name: 'Zapisanikurierzyadmin',
          path: '/zapisanikurierzyadmin',
          builder: (context, params) => ZapisanikurierzyadminWidget(
            bajka: params.getParam(
              'bajka',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['grafik'],
            ),
          ),
        ),
        FFRoute(
          name: 'ZapisanikurierzyadminCopy',
          path: '/zapisanikurierzyadminCopy',
          builder: (context, params) => ZapisanikurierzyadminCopyWidget(
            bajka: params.getParam(
              'bajka',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['grafik'],
            ),
          ),
        ),
        FFRoute(
          name: 'Mojestatystykiadmin2',
          path: '/mojestatystykiadmin2',
          builder: (context, params) => Mojestatystykiadmin2Widget(
            maczo2: params.getParam<DocumentReference>(
              'maczo2',
              ParamType.DocumentReference,
              isList: true,
              collectionNamePath: ['Zamowienie'],
            ),
          ),
        ),
        FFRoute(
          name: 'MojestatystykiINNY',
          path: '/mojestatystykiINNY',
          builder: (context, params) => MojestatystykiINNYWidget(
            maczo2: params.getParam<DocumentReference>(
              'maczo2',
              ParamType.DocumentReference,
              isList: true,
              collectionNamePath: ['Zamowienie'],
            ),
          ),
        ),
        FFRoute(
          name: 'Mojestatystykiadmin2Copy',
          path: '/mojestatystykiadmin2Copy',
          builder: (context, params) => Mojestatystykiadmin2CopyWidget(
            maczo2: params.getParam<DocumentReference>(
              'maczo2',
              ParamType.DocumentReference,
              isList: true,
              collectionNamePath: ['Zamowienie'],
            ),
          ),
        ),
        FFRoute(
          name: 'Mojestatystykiadmin2CopyCopy',
          path: '/mojestatystykiadmin2CopyCopy',
          builder: (context, params) => Mojestatystykiadmin2CopyCopyWidget(
            maczo2: params.getParam<DocumentReference>(
              'maczo2',
              ParamType.DocumentReference,
              isList: true,
              collectionNamePath: ['Zamowienie'],
            ),
          ),
        ),
        FFRoute(
          name: 'filtracja',
          path: '/filtracja',
          builder: (context, params) => const FiltracjaWidget(),
        ),
        FFRoute(
          name: 'zbiorczewlasicicle',
          path: '/zbiorczewlasicicle',
          builder: (context, params) => const ZbiorczewlasicicleWidget(),
        ),
        FFRoute(
          name: 'DzisiejszezleceniaZBIORCZE',
          path: '/dzisiejszezleceniaZBIORCZE',
          builder: (context, params) => const DzisiejszezleceniaZBIORCZEWidget(),
        ),
        FFRoute(
          name: 'HistoriazlecenrestauracjaZBIORCZE',
          path: '/historiazlecenrestauracjaZBIORCZE',
          builder: (context, params) =>
              const HistoriazlecenrestauracjaZBIORCZEWidget(),
        ),
        FFRoute(
          name: 'MojestatystykiZBIORCZE',
          path: '/mojestatystykiZBIORCZE',
          builder: (context, params) => MojestatystykiZBIORCZEWidget(
            maczo2: params.getParam<DocumentReference>(
              'maczo2',
              ParamType.DocumentReference,
              isList: true,
              collectionNamePath: ['Zamowienie'],
            ),
          ),
        ),
        FFRoute(
          name: 'klasyfikacjahistoria',
          path: '/klasyfikacjahistoria',
          builder: (context, params) => const KlasyfikacjahistoriaWidget(),
        ),
        FFRoute(
          name: 'Historiazlecenadminklas',
          path: '/historiazlecenadminklas',
          builder: (context, params) => const HistoriazlecenadminklasWidget(),
        ),
        FFRoute(
          name: 'menedzerwyzwan',
          path: '/menedzerwyzwan',
          builder: (context, params) => const MenedzerwyzwanWidget(),
        ),
        FFRoute(
          name: 'mojewyzwaniaCopy',
          path: '/mojewyzwaniaCopy',
          builder: (context, params) => const MojewyzwaniaCopyWidget(),
        ),
        FFRoute(
          name: 'historiamojewyzwaniaCopyCopy',
          path: '/historiamojewyzwaniaCopyCopy',
          builder: (context, params) => const HistoriamojewyzwaniaCopyCopyWidget(),
        ),
        FFRoute(
          name: 'historiamojewyzwaniaCopyCopyCopy',
          path: '/historiamojewyzwaniaCopyCopyCopy',
          builder: (context, params) =>
              const HistoriamojewyzwaniaCopyCopyCopyWidget(),
        ),
        FFRoute(
          name: 'mojehajsyCopy',
          path: '/mojehajsyCopy',
          builder: (context, params) => const MojehajsyCopyWidget(),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
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
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
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
      (state.allParams.length == 1 &&
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
    ParamType type, {
    bool isList = false,
    List<String>? collectionNamePath,
  }) {
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
    return deserializeParam<T>(
      param,
      type,
      isList,
      collectionNamePath: collectionNamePath,
    );
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
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/login6';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Container(
                  color: const Color(0xFF7842FF),
                  child: Image.asset(
                    'assets/images/fasfasfasfasfasfasfasf.png',
                    fit: BoxFit.contain,
                  ),
                )
              : PushNotificationsHandler(child: page);

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
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

  static TransitionInfo appDefault() => const TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
