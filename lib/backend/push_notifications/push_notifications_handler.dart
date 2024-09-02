import 'dart:async';

import 'serialization_util.dart';
import '../backend.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';


final _handledMessageIds = <String?>{};

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({super.key, required this.child});

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
          pathParameters: parameterData.pathParameters,
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
    SchedulerBinding.instance.addPostFrameCallback((_) {
      handleOpenedPushNotification();
    });
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Container(
          color: const Color(0xFF7842FF),
          child: Image.asset(
            'assets/images/fasfasfasfasfasfasfasf.png',
            fit: BoxFit.contain,
          ),
        )
      : widget.child;
}

class ParameterData {
  const ParameterData(
      {this.requiredParams = const {}, this.allParams = const {}});
  final Map<String, String?> requiredParams;
  final Map<String, dynamic> allParams;

  Map<String, String> get pathParameters => Map.fromEntries(
        requiredParams.entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
  Map<String, dynamic> get extra => Map.fromEntries(
        allParams.entries.where((e) => e.value != null),
      );

  static Future<ParameterData> Function(Map<String, dynamic>) none() =>
      (data) async => const ParameterData();
}

final parametersBuilderMap =
    <String, Future<ParameterData> Function(Map<String, dynamic>)>{
  'Login6': ParameterData.none(),
  'Kurier': ParameterData.none(),
  'Witam': ParameterData.none(),
  'AktywniKurierzy': ParameterData.none(),
  'Restaura': ParameterData.none(),
  'Admin': ParameterData.none(),
  'GieldaZlecen': ParameterData.none(),
  'ZamowPierwsze': (data) async => const ParameterData(
        allParams: {},
      ),
  'Dzisiejszezlecenia': ParameterData.none(),
  'Zleceniakuriera': ParameterData.none(),
  'dodajdzwiek': ParameterData.none(),
  'UstawieniaKurier': ParameterData.none(),
  'Mojestatystyki': (data) async => const ParameterData(
        allParams: {},
      ),
  'Historiazlecen': ParameterData.none(),
  'Zmienhaslo': ParameterData.none(),
  'Zleceniakurieraobcy': ParameterData.none(),
  'numerytel': ParameterData.none(),
  'CreateAccount1': ParameterData.none(),
  'Historiazlecenrestauracja': ParameterData.none(),
  'Mojestatystykirestauracja': (data) async => const ParameterData(
        allParams: {},
      ),
  'Mojestatystykiadmiin': (data) async => const ParameterData(
        allParams: {},
      ),
  'Historiazlecenadmin': ParameterData.none(),
  'Zleceniakurieraadmin': ParameterData.none(),
  'Odrzuconeadmin': ParameterData.none(),
  'zmianahasla': ParameterData.none(),
  'klasyfikacja': ParameterData.none(),
  'dodajstrefe': ParameterData.none(),
  'rozliczeniakurierzy': ParameterData.none(),
  'mojehajsy': ParameterData.none(),
  'kreatorkonta': ParameterData.none(),
  'Kurierzyadmin': ParameterData.none(),
  'Statystykiinnegokuriera': (data) async => const ParameterData(
        allParams: {},
      ),
  'Historiazleceninnegokuriera': ParameterData.none(),
  'Restauracjeadmin': ParameterData.none(),
  'Historiazlecenrestauracjaadmin': ParameterData.none(),
  'Wybierzkontokurier': ParameterData.none(),
  'inforkurier': ParameterData.none(),
  'Przyjmijipolacz': ParameterData.none(),
  'pracownicy': ParameterData.none(),
  'Dodajpracownika': ParameterData.none(),
  'banned': ParameterData.none(),
  'specjal': ParameterData.none(),
  'grafikk': ParameterData.none(),
  'Zapisanikurierzy': (data) async => ParameterData(
        allParams: {
          'bajka': getParameter<DocumentReference>(data, 'bajka'),
        },
      ),
  'grafikkadmin': ParameterData.none(),
  'Zapisanikurierzyadmin': (data) async => ParameterData(
        allParams: {
          'bajka': getParameter<DocumentReference>(data, 'bajka'),
        },
      ),
  'ZapisanikurierzyadminCopy': (data) async => ParameterData(
        allParams: {
          'bajka': getParameter<DocumentReference>(data, 'bajka'),
        },
      ),
  'Mojestatystykiadmin2': (data) async => const ParameterData(
        allParams: {},
      ),
  'MojestatystykiINNY': (data) async => const ParameterData(
        allParams: {},
      ),
  'Mojestatystykiadmin2Copy': (data) async => const ParameterData(
        allParams: {},
      ),
  'Mojestatystykiadmin2CopyCopy': (data) async => const ParameterData(
        allParams: {},
      ),
  'filtracja': ParameterData.none(),
  'zbiorczewlasicicle': ParameterData.none(),
  'DzisiejszezleceniaZBIORCZE': ParameterData.none(),
  'HistoriazlecenrestauracjaZBIORCZE': ParameterData.none(),
  'MojestatystykiZBIORCZE': (data) async => const ParameterData(
        allParams: {},
      ),
  'klasyfikacjahistoria': ParameterData.none(),
  'Historiazlecenadminklas': ParameterData.none(),
  'menedzerwyzwan': ParameterData.none(),
  'mojewyzwaniaCopy': ParameterData.none(),
  'historiamojewyzwaniaCopyCopy': ParameterData.none(),
  'historiamojewyzwaniaCopyCopyCopy': ParameterData.none(),
  'mojehajsyCopy': ParameterData.none(),
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
