import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/brak_copy_widget.dart';
import '/components/zobaczzdjecie_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'dzisiejszezlecenia_z_b_i_o_r_c_z_e_model.dart';
export 'dzisiejszezlecenia_z_b_i_o_r_c_z_e_model.dart';

class DzisiejszezleceniaZBIORCZEWidget extends StatefulWidget {
  const DzisiejszezleceniaZBIORCZEWidget({super.key});

  @override
  State<DzisiejszezleceniaZBIORCZEWidget> createState() =>
      _DzisiejszezleceniaZBIORCZEWidgetState();
}

class _DzisiejszezleceniaZBIORCZEWidgetState
    extends State<DzisiejszezleceniaZBIORCZEWidget> {
  late DzisiejszezleceniaZBIORCZEModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DzisiejszezleceniaZBIORCZEModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
            'Dzisiejsze zlecenia',
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
                            .whereIn(
                                'Restauracja',
                                (currentUserDocument?.zbiorczerestauracja
                                        .toList() ??
                                    []))
                            .where(
                              'datadzien',
                              isEqualTo: dateTimeFormat(
                                "d/M/y",
                                getCurrentTimestamp,
                                locale:
                                    FFLocalizations.of(context).languageCode,
                              ),
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
                                  color: () {
                                    if (!listViewZamowienieRecord.przyjete &&
                                        !listViewZamowienieRecord.dostarczone &&
                                        !listViewZamowienieRecord.odrzucone) {
                                      return FlutterFlowTheme.of(context)
                                          .primary;
                                    } else if (listViewZamowienieRecord
                                            .przyjete &&
                                        !listViewZamowienieRecord.dostarczone &&
                                        !listViewZamowienieRecord.odrzucone) {
                                      return const Color(0xFFECA827);
                                    } else if (listViewZamowienieRecord
                                            .przyjete &&
                                        listViewZamowienieRecord.dostarczone &&
                                        !listViewZamowienieRecord.odrzucone) {
                                      return const Color(0xFF22BF36);
                                    } else if (listViewZamowienieRecord
                                        .odrzucone) {
                                      return const Color(0xFFFF4040);
                                    } else {
                                      return FlutterFlowTheme.of(context)
                                          .primary;
                                    }
                                  }(),
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
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ),
                                      if (listViewZamowienieRecord.przyjete ==
                                          true)
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 5.0, 0.0, 0.0),
                                          child: StreamBuilder<UserRecord>(
                                            stream: UserRecord.getDocument(
                                                listViewZamowienieRecord
                                                    .przydzielonykurier!),
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
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }

                                              final textUserRecord =
                                                  snapshot.data!;

                                              return Text(
                                                'Kurier ${textUserRecord.imie} ${textUserRecord.nazwisko}',
                                                textAlign: TextAlign.center,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineMedium
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color: Colors.white,
                                                          fontSize: 22.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w300,
                                                        ),
                                              );
                                            },
                                          ),
                                        ),
                                      if (listViewZamowienieRecord.przyjete ==
                                          true)
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 5.0, 0.0, 0.0),
                                          child: StreamBuilder<UserRecord>(
                                            stream: UserRecord.getDocument(
                                                listViewZamowienieRecord
                                                    .przydzielonykurier!),
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
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }

                                              final textUserRecord =
                                                  snapshot.data!;

                                              return Text(
                                                valueOrDefault<String>(
                                                  'Kontakt ${textUserRecord.phoneNumber}',
                                                  'Brak numeru',
                                                ),
                                                textAlign: TextAlign.center,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineMedium
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color: Colors.white,
                                                          fontSize: 22.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w300,
                                                        ),
                                              );
                                            },
                                          ),
                                        ),
                                      if (listViewZamowienieRecord.spozniesie)
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 5.0, 0.0, 0.0),
                                          child: Text(
                                            'Kurier spóźni się o: ${listViewZamowienieRecord.spozniesieilosc.toString()} minut',
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
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 5.0, 0.0, 0.0),
                                        child: Text(
                                          valueOrDefault<String>(
                                            () {
                                              if (listViewZamowienieRecord
                                                  .odrzucone) {
                                                return 'Status: Odrzucone';
                                              } else if (listViewZamowienieRecord
                                                  .dostarczone) {
                                                return 'Status: Dostarczone';
                                              } else if (listViewZamowienieRecord
                                                  .przyjete) {
                                                return 'Status: Przyjęte';
                                              } else {
                                                return 'Status: Oczekuje';
                                              }
                                            }(),
                                            'Brak statusu',
                                          ),
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
                                              color: () {
                                                if (!listViewZamowienieRecord
                                                        .przyjete &&
                                                    !listViewZamowienieRecord
                                                        .dostarczone &&
                                                    !listViewZamowienieRecord
                                                        .odrzucone) {
                                                  return FlutterFlowTheme.of(
                                                          context)
                                                      .primary;
                                                } else if (listViewZamowienieRecord.przyjete &&
                                                    !listViewZamowienieRecord
                                                        .dostarczone &&
                                                    !listViewZamowienieRecord
                                                        .odrzucone) {
                                                  return const Color(0xFFECA827);
                                                } else if (listViewZamowienieRecord
                                                        .przyjete &&
                                                    listViewZamowienieRecord
                                                        .dostarczone &&
                                                    !listViewZamowienieRecord
                                                        .odrzucone) {
                                                  return const Color(0xFF22BF36);
                                                } else if (listViewZamowienieRecord
                                                    .odrzucone) {
                                                  return const Color(0xFFFF4040);
                                                } else {
                                                  return FlutterFlowTheme.of(
                                                          context)
                                                      .primary;
                                                }
                                              }(),
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
