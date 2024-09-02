import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/components/brak_copy_widget.dart';
import '/components/spozniesie_widget.dart';
import '/components/zobaczzdjecie_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'zleceniakuriera_model.dart';
export 'zleceniakuriera_model.dart';

class ZleceniakurieraWidget extends StatefulWidget {
  const ZleceniakurieraWidget({super.key});

  @override
  State<ZleceniakurieraWidget> createState() => _ZleceniakurieraWidgetState();
}

class _ZleceniakurieraWidgetState extends State<ZleceniakurieraWidget> {
  late ZleceniakurieraModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ZleceniakurieraModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          leading: InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back_rounded,
              color: Colors.white,
              size: 24.0,
            ),
          ),
          title: Text(
            'Moje zlecenia',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Outfit',
                  color: Colors.white,
                  fontSize: 22.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w300,
                ),
          ),
          actions: const [],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(10.0),
            child: Container(),
          ),
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primary,
                    borderRadius: BorderRadius.circular(0.0),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 0.0),
                  child: AuthUserStreamWidget(
                    builder: (context) => StreamBuilder<List<ZamowienieRecord>>(
                      stream: queryZamowienieRecord(
                        queryBuilder: (zamowienieRecord) => zamowienieRecord
                            .where(
                              'Miasto',
                              isEqualTo:
                                  valueOrDefault(currentUserDocument?.miasto, 0)
                                      .toString(),
                            )
                            .where(
                              'Dostarczone',
                              isEqualTo: false,
                            )
                            .where(
                              'Przyjete',
                              isEqualTo: true,
                            )
                            .where(
                              'Przydzielonykurier',
                              isEqualTo: currentUserReference,
                            )
                            .where(
                              'odrzucone',
                              isEqualTo: false,
                            )
                            .orderBy('Godzinadodania', descending: true),
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50.0,
                              height: 50.0,
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  FlutterFlowTheme.of(context).primary,
                                ),
                              ),
                            ),
                          );
                        }
                        List<ZamowienieRecord> listViewZamowienieRecordList =
                            snapshot.data!;
                        if (listViewZamowienieRecordList.isEmpty) {
                          return const BrakCopyWidget();
                        }

                        return ListView.separated(
                          padding: EdgeInsets.zero,
                          primary: false,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: listViewZamowienieRecordList.length,
                          separatorBuilder: (_, __) => const SizedBox(height: 10.0),
                          itemBuilder: (context, listViewIndex) {
                            final listViewZamowienieRecord =
                                listViewZamowienieRecordList[listViewIndex];
                            return Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 1.0),
                              child: Container(
                                width: 100.0,
                                constraints: const BoxConstraints(
                                  minHeight: 200.0,
                                ),
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).primary,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 0.0,
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      offset: const Offset(
                                        0.0,
                                        1.0,
                                      ),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(16.0),
                                  shape: BoxShape.rectangle,
                                ),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      15.0, 15.0, 15.0, 15.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      StreamBuilder<RestauracjaRecord>(
                                        stream: RestauracjaRecord.getDocument(
                                            listViewZamowienieRecord
                                                .restauracja!),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 50.0,
                                                height: 50.0,
                                                child:
                                                    CircularProgressIndicator(
                                                  valueColor:
                                                      AlwaysStoppedAnimation<
                                                          Color>(
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                  ),
                                                ),
                                              ),
                                            );
                                          }

                                          final textRestauracjaRecord =
                                              snapshot.data!;

                                          return Text(
                                            'Restauracja ${textRestauracjaRecord.nazwa}',
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .headlineMedium
                                                .override(
                                                  fontFamily: 'Outfit',
                                                  color: Colors.white,
                                                  fontSize: 22.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          );
                                        },
                                      ),
                                      if (listViewZamowienieRecord
                                          .powiadomienie)
                                        Text(
                                          'Restauracja przypomniała\nci o tym zleceniu!',
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .headlineMedium
                                              .override(
                                                fontFamily: 'Outfit',
                                                color: const Color(0xFFFF4E4E),
                                                fontSize: 18.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 5.0, 0.0, 0.0),
                                        child: Text(
                                          'Zlecenie  ${listViewZamowienieRecord.nrzamowienia.toString()}',
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .headlineMedium
                                              .override(
                                                fontFamily: 'Outfit',
                                                color: Colors.white,
                                                fontSize: 22.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w300,
                                              ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 5.0, 0.0, 0.0),
                                        child: Text(
                                          'Dodano ${dateTimeFormat(
                                            "d/M H:mm",
                                            listViewZamowienieRecord
                                                .godzinadodania,
                                            locale: FFLocalizations.of(context)
                                                .languageCode,
                                          )}',
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .headlineMedium
                                              .override(
                                                fontFamily: 'Outfit',
                                                color: Colors.white,
                                                fontSize: 22.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w300,
                                              ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 5.0, 0.0, 0.0),
                                        child: Text(
                                          'Restauracja wybrała: ${() {
                                            if (listViewZamowienieRecord
                                                .jaknaszybciej) {
                                              return 'Jak najszybciej';
                                            } else if (listViewZamowienieRecord
                                                .nagodzine) {
                                              return listViewZamowienieRecord
                                                  .godzinanagodzine;
                                            } else {
                                              return dateTimeFormat(
                                                "Hm",
                                                functions.dodajMinutyDoDaty(
                                                    listViewZamowienieRecord
                                                        .godzinadodania,
                                                    listViewZamowienieRecord
                                                        .restauraucjaminuty),
                                                locale:
                                                    FFLocalizations.of(context)
                                                        .languageCode,
                                              );
                                            }
                                          }()}',
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .headlineMedium
                                              .override(
                                                fontFamily: 'Outfit',
                                                color: Colors.white,
                                                fontSize: 22.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w300,
                                              ),
                                        ),
                                      ),
                                      if (listViewZamowienieRecord.przyjete)
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 5.0, 0.0, 0.0),
                                          child: Text(
                                            'Kurier wybrał: ${valueOrDefault<String>(
                                              () {
                                                if (listViewZamowienieRecord
                                                    .jaknajszybciejkurier) {
                                                  return 'Jak najszybciej';
                                                } else if (listViewZamowienieRecord
                                                    .nagodzinekurier) {
                                                  return listViewZamowienieRecord
                                                      .godzinanagodzinekurier;
                                                } else {
                                                  return dateTimeFormat(
                                                    "Hm",
                                                    functions.dodajMinutyDoDaty(
                                                        listViewZamowienieRecord
                                                            .godzinaprzyjecia,
                                                        listViewZamowienieRecord
                                                            .kurierminuty),
                                                    locale: FFLocalizations.of(
                                                            context)
                                                        .languageCode,
                                                  );
                                                }
                                              }(),
                                              'Brak danych',
                                            )}',
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .headlineMedium
                                                .override(
                                                  fontFamily: 'Outfit',
                                                  color: Colors.white,
                                                  fontSize: 22.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w300,
                                                ),
                                          ),
                                        ),
                                      if (listViewZamowienieRecord
                                                  .dodatkoweinformacje !=
                                              '')
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 5.0, 0.0, 0.0),
                                          child: Text(
                                            'Informacje: ${listViewZamowienieRecord.dodatkoweinformacje}',
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .headlineMedium
                                                .override(
                                                  fontFamily: 'Outfit',
                                                  color: Colors.white,
                                                  fontSize: 22.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w300,
                                                ),
                                          ),
                                        ),
                                      if (!listViewZamowienieRecord.zdjecie)
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 5.0, 0.0, 0.0),
                                          child: Text(
                                            'Adres: ${listViewZamowienieRecord.adres}',
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .headlineMedium
                                                .override(
                                                  fontFamily: 'Outfit',
                                                  color: Colors.white,
                                                  fontSize: 22.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w300,
                                                ),
                                          ),
                                        ),
                                      if (listViewZamowienieRecord.zdjecie)
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 10.0, 0.0, 0.0),
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              FFAppState().tymczasowezdj =
                                                  listViewZamowienieRecord
                                                      .zdjecieplik;
                                              setState(() {});
                                              await showModalBottomSheet(
                                                isScrollControlled: true,
                                                backgroundColor:
                                                    Colors.transparent,
                                                enableDrag: false,
                                                useSafeArea: true,
                                                context: context,
                                                builder: (context) {
                                                  return GestureDetector(
                                                    onTap: () =>
                                                        FocusScope.of(context)
                                                            .unfocus(),
                                                    child: Padding(
                                                      padding: MediaQuery
                                                          .viewInsetsOf(
                                                              context),
                                                      child:
                                                          const ZobaczzdjecieWidget(),
                                                    ),
                                                  );
                                                },
                                              ).then((value) =>
                                                  safeSetState(() {}));
                                            },
                                            text: 'Zobacz zdjęcie',
                                            options: FFButtonOptions(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  1.0,
                                              height: 50.0,
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      24.0, 0.0, 24.0, 0.0),
                                              iconPadding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        color: Colors.white,
                                                        letterSpacing: 0.0,
                                                      ),
                                              elevation: 1.0,
                                              borderSide: const BorderSide(
                                                color: Colors.transparent,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(24.0),
                                            ),
                                          ),
                                        ),
                                      if (listViewZamowienieRecord.zdjecie)
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 10.0, 0.0, 0.0),
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              await launchURL(functions
                                                  .covertimagepathintostring(
                                                      listViewZamowienieRecord
                                                          .zdjecieplik)!);
                                            },
                                            text: 'Zobacz zdjęcie z linkiem',
                                            options: FFButtonOptions(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  1.0,
                                              height: 50.0,
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      24.0, 0.0, 24.0, 0.0),
                                              iconPadding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color: valueOrDefault<Color>(
                                                functions.comparedates(
                                                        getCurrentTimestamp,
                                                        listViewZamowienieRecord
                                                            .dostepne)!
                                                    ? FlutterFlowTheme.of(
                                                            context)
                                                        .secondary
                                                    : const Color(0xFF989BA0),
                                                FlutterFlowTheme.of(context)
                                                    .secondary,
                                              ),
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        color: Colors.white,
                                                        letterSpacing: 0.0,
                                                      ),
                                              elevation: 1.0,
                                              borderSide: const BorderSide(
                                                color: Colors.transparent,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(24.0),
                                            ),
                                          ),
                                        ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 10.0, 0.0, 0.0),
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            FFAppState().tymczasowezlecenie =
                                                listViewZamowienieRecord
                                                    .reference;
                                            FFAppState().tymrestauracja =
                                                listViewZamowienieRecord
                                                    .restauracja;
                                            setState(() {});
                                            await showModalBottomSheet(
                                              isScrollControlled: true,
                                              backgroundColor:
                                                  Colors.transparent,
                                              enableDrag: false,
                                              context: context,
                                              builder: (context) {
                                                return GestureDetector(
                                                  onTap: () =>
                                                      FocusScope.of(context)
                                                          .unfocus(),
                                                  child: Padding(
                                                    padding:
                                                        MediaQuery.viewInsetsOf(
                                                            context),
                                                    child: const SpozniesieWidget(),
                                                  ),
                                                );
                                              },
                                            ).then(
                                                (value) => safeSetState(() {}));
                                          },
                                          text: 'Spóźnie się',
                                          options: FFButtonOptions(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                1.0,
                                            height: 50.0,
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    24.0, 0.0, 24.0, 0.0),
                                            iconPadding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: FlutterFlowTheme.of(context)
                                                .secondary,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily: 'Readex Pro',
                                                      color: Colors.white,
                                                      letterSpacing: 0.0,
                                                    ),
                                            elevation: 1.0,
                                            borderSide: const BorderSide(
                                              color: Colors.transparent,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(24.0),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 10.0, 0.0, 0.0),
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            if (listViewZamowienieRecord
                                                .moznarobic) {
                                              await listViewZamowienieRecord
                                                  .reference
                                                  .update(
                                                      createZamowienieRecordData(
                                                moznarobic: false,
                                              ));
                                            } else {
                                              await listViewZamowienieRecord
                                                  .reference
                                                  .update(
                                                      createZamowienieRecordData(
                                                moznarobic: true,
                                                moznarobicgodz:
                                                    getCurrentTimestamp,
                                              ));

                                              await PowiadomienieprzyjalemRecord
                                                  .collection
                                                  .doc()
                                                  .set(
                                                      createPowiadomienieprzyjalemRecordData(
                                                    restauracja:
                                                        listViewZamowienieRecord
                                                            .restauracja,
                                                    zamowienie: FFAppState()
                                                        .tymczasowezlecenie,
                                                    godzina:
                                                        getCurrentTimestamp,
                                                    typ: '\"Można robić\"!',
                                                    nazwa:
                                                        'Kurier powiadamia. Można robić zamówienie nr.${listViewZamowienieRecord.nrzamowienia.toString()}',
                                                  ));
                                              FFAppState().tymrestauracja =
                                                  listViewZamowienieRecord
                                                      .restauracja;
                                              setState(() {});
                                              _model.dokogorestauraca2Copyg =
                                                  await queryUserRecordOnce(
                                                queryBuilder: (userRecord) =>
                                                    userRecord.where(
                                                  'Restauracja',
                                                  isEqualTo: FFAppState()
                                                      .tymrestauracja,
                                                ),
                                              );
                                              triggerPushNotification(
                                                notificationTitle:
                                                    '\"Można robić\"!',
                                                notificationText:
                                                    'Kurier powiadamia. Można robić zamówienie nr.${listViewZamowienieRecord.nrzamowienia.toString()}',
                                                notificationSound: 'default',
                                                userRefs: _model
                                                    .dokogorestauraca2Copyg!
                                                    .map((e) => e.reference)
                                                    .toList(),
                                                initialPageName:
                                                    'Dzisiejszezlecenia',
                                                parameterData: {},
                                              );
                                            }

                                            setState(() {});
                                          },
                                          text: !listViewZamowienieRecord
                                                  .moznarobic
                                              ? '\"Można robić\"'
                                              : 'Cofnij \"Można robić\"',
                                          options: FFButtonOptions(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                1.0,
                                            height: 50.0,
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    24.0, 0.0, 24.0, 0.0),
                                            iconPadding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: FlutterFlowTheme.of(context)
                                                .secondary,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily: 'Readex Pro',
                                                      color: Colors.white,
                                                      letterSpacing: 0.0,
                                                    ),
                                            elevation: 1.0,
                                            borderSide: const BorderSide(
                                              color: Colors.transparent,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(24.0),
                                          ),
                                        ),
                                      ),
                                      if (valueOrDefault<bool>(
                                          currentUserDocument?.administrator,
                                          false))
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 10.0, 0.0, 0.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onDoubleTap: () async {
                                              await listViewZamowienieRecord
                                                  .reference
                                                  .update(
                                                      createZamowienieRecordData(
                                                odrzucone: true,
                                              ));
                                              FFAppState().tymrestauracja =
                                                  listViewZamowienieRecord
                                                      .restauracja;
                                              setState(() {});
                                              _model.dokogorestauraca2Copys =
                                                  await queryUserRecordOnce(
                                                queryBuilder: (userRecord) =>
                                                    userRecord.where(
                                                  'Restauracja',
                                                  isEqualTo: FFAppState()
                                                      .tymrestauracja,
                                                ),
                                              );

                                              await PowiadomienieprzyjalemRecord
                                                  .collection
                                                  .doc()
                                                  .set(
                                                      createPowiadomienieprzyjalemRecordData(
                                                    restauracja:
                                                        listViewZamowienieRecord
                                                            .restauracja,
                                                    zamowienie: FFAppState()
                                                        .tymczasowezlecenie,
                                                    godzina:
                                                        getCurrentTimestamp,
                                                    typ: 'Zamówienie odrzucone',
                                                    nazwa:
                                                        'Zamówienie nr.${listViewZamowienieRecord.nrzamowienia.toString()} zostało odrzucone!',
                                                  ));
                                              triggerPushNotification(
                                                notificationTitle:
                                                    'Zamówienie odrzucone',
                                                notificationText:
                                                    ' Zamówienie nr.${listViewZamowienieRecord.nrzamowienia.toString()} zostało odrzucone',
                                                notificationSound: 'default',
                                                userRefs: _model
                                                    .dokogorestauraca2Copys!
                                                    .map((e) => e.reference)
                                                    .toList(),
                                                initialPageName:
                                                    'Dzisiejszezlecenia',
                                                parameterData: {},
                                              );

                                              setState(() {});
                                            },
                                            child: FFButtonWidget(
                                              onPressed: () {
                                                print('Button pressed ...');
                                              },
                                              text:
                                                  'Odrzuć zamówienie (kliknij 2 razy)',
                                              options: FFButtonOptions(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        1.0,
                                                height: 50.0,
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        24.0, 0.0, 24.0, 0.0),
                                                iconPadding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          color: Colors.white,
                                                          letterSpacing: 0.0,
                                                        ),
                                                elevation: 1.0,
                                                borderSide: const BorderSide(
                                                  color: Colors.transparent,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(24.0),
                                              ),
                                            ),
                                          ),
                                        ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 10.0, 0.0, 0.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onDoubleTap: () async {
                                            await listViewZamowienieRecord
                                                .reference
                                                .update(
                                                    createZamowienieRecordData(
                                              przyjete: false,
                                            ));

                                            await PowiadomieniaRecord.collection
                                                .doc()
                                                .set(
                                                    createPowiadomieniaRecordData(
                                                  powiadoim: false,
                                                  miasto: valueOrDefault(
                                                      currentUserDocument
                                                          ?.miasto,
                                                      0),
                                                ));
                                            _model.kurierzydobior =
                                                await queryUserRecordOnce(
                                              queryBuilder: (userRecord) =>
                                                  userRecord
                                                      .where(
                                                        'Kurier',
                                                        isEqualTo: true,
                                                      )
                                                      .where(
                                                        'wpracy',
                                                        isEqualTo: true,
                                                      )
                                                      .where(
                                                        'Miasto',
                                                        isEqualTo: valueOrDefault(
                                                            currentUserDocument
                                                                ?.miasto,
                                                            0),
                                                      ),
                                            );
                                            triggerPushNotification(
                                              notificationTitle:
                                                  'Zamówienie przekazane na giełde',
                                              notificationText:
                                                  'Zamówienie na giełdzie',
                                              notificationSound: 'default',
                                              userRefs: _model.kurierzydobior!
                                                  .map((e) => e.reference)
                                                  .toList(),
                                              initialPageName: 'GieldaZlecen',
                                              parameterData: {},
                                            );

                                            setState(() {});
                                          },
                                          child: FFButtonWidget(
                                            onPressed: () {
                                              print('Button pressed ...');
                                            },
                                            text:
                                                'Przekaż na giełde (kliknij 2 razy)',
                                            options: FFButtonOptions(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  1.0,
                                              height: 50.0,
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      24.0, 0.0, 24.0, 0.0),
                                              iconPadding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .warning,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        color: Colors.white,
                                                        letterSpacing: 0.0,
                                                      ),
                                              elevation: 1.0,
                                              borderSide: const BorderSide(
                                                color: Colors.transparent,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(24.0),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 10.0, 0.0, 0.0),
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            await listViewZamowienieRecord
                                                .reference
                                                .update(
                                                    createZamowienieRecordData(
                                              dostarczone: true,
                                              datadostarczenia:
                                                  getCurrentTimestamp,
                                            ));

                                            await listViewZamowienieRecord
                                                .reference
                                                .update(
                                                    createZamowienieRecordData(
                                              iloscminut:
                                                  functions.roznicaminuty(
                                                      listViewZamowienieRecord
                                                          .godzinadodania,
                                                      getCurrentTimestamp),
                                            ));

                                            await PowiadomienieprzyjalemRecord
                                                .collection
                                                .doc()
                                                .set(
                                                    createPowiadomienieprzyjalemRecordData(
                                                  zamowienie: FFAppState()
                                                      .tymczasowezlecenie,
                                                  restauracja:
                                                      listViewZamowienieRecord
                                                          .restauracja,
                                                  godzina: getCurrentTimestamp,
                                                  typ: 'Zlecenie dostarczone',
                                                  nazwa:
                                                      'Zlecenie nr.${listViewZamowienieRecord.nrzamowienia.toString()} zostało dostarczone',
                                                ));
                                            FFAppState().tymrestauracja =
                                                listViewZamowienieRecord
                                                    .restauracja;
                                            setState(() {});
                                            _model.dokogorestauraca3 =
                                                await queryUserRecordOnce(
                                              queryBuilder: (userRecord) =>
                                                  userRecord.where(
                                                'Restauracja',
                                                isEqualTo:
                                                    FFAppState().tymrestauracja,
                                              ),
                                            );
                                            triggerPushNotification(
                                              notificationTitle:
                                                  'Zamówienie dostarczone',
                                              notificationText:
                                                  ' Zamówienie nr.${listViewZamowienieRecord.nrzamowienia.toString()} zostało dostarczone',
                                              notificationSound: 'default',
                                              userRefs: _model
                                                  .dokogorestauraca3!
                                                  .map((e) => e.reference)
                                                  .toList(),
                                              initialPageName:
                                                  'Dzisiejszezlecenia',
                                              parameterData: {},
                                            );

                                            setState(() {});
                                          },
                                          text: 'Dostarczyłem zamówienie',
                                          options: FFButtonOptions(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                1.0,
                                            height: 50.0,
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    24.0, 0.0, 24.0, 0.0),
                                            iconPadding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: FlutterFlowTheme.of(context)
                                                .success,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily: 'Readex Pro',
                                                      color: Colors.white,
                                                      letterSpacing: 0.0,
                                                    ),
                                            elevation: 1.0,
                                            borderSide: const BorderSide(
                                              color: Colors.transparent,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(24.0),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
