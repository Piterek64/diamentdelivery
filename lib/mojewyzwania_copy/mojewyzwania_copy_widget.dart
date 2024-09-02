import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/brak_copy_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'mojewyzwania_copy_model.dart';
export 'mojewyzwania_copy_model.dart';

class MojewyzwaniaCopyWidget extends StatefulWidget {
  const MojewyzwaniaCopyWidget({super.key});

  @override
  State<MojewyzwaniaCopyWidget> createState() => _MojewyzwaniaCopyWidgetState();
}

class _MojewyzwaniaCopyWidgetState extends State<MojewyzwaniaCopyWidget> {
  late MojewyzwaniaCopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MojewyzwaniaCopyModel());
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
            'Wyzwania',
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
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 10.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        context.pushNamed('historiamojewyzwaniaCopyCopy');
                      },
                      text: 'Historia nagród',
                      options: FFButtonOptions(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: 50.0,
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Readex Pro',
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                ),
                        elevation: 1.0,
                        borderSide: const BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                    child: AuthUserStreamWidget(
                      builder: (context) => StreamBuilder<List<WyzwaniaRecord>>(
                        stream: queryWyzwaniaRecord(
                          queryBuilder: (wyzwaniaRecord) => wyzwaniaRecord
                              .where(
                                'aktywne',
                                isEqualTo: true,
                              )
                              .where(
                                'miasto',
                                isEqualTo: valueOrDefault(
                                    currentUserDocument?.miasto, 0),
                              )
                              .orderBy('koncowa', descending: true),
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
                          List<WyzwaniaRecord> listViewWyzwaniaRecordList =
                              snapshot.data!;
                          if (listViewWyzwaniaRecordList.isEmpty) {
                            return const BrakCopyWidget();
                          }

                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            primary: false,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: listViewWyzwaniaRecordList.length,
                            itemBuilder: (context, listViewIndex) {
                              final listViewWyzwaniaRecord =
                                  listViewWyzwaniaRecordList[listViewIndex];
                              return Visibility(
                                visible: !(listViewWyzwaniaRecord
                                        .listakurierowprzyjeci
                                        .contains(currentUserReference)
                                    ? true
                                    : false),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 10.0),
                                  child: StreamBuilder<WyzwaniaRecord>(
                                    stream: WyzwaniaRecord.getDocument(
                                        listViewWyzwaniaRecord.reference),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 50.0,
                                            height: 50.0,
                                            child: CircularProgressIndicator(
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                              ),
                                            ),
                                          ),
                                        );
                                      }

                                      final containerWyzwaniaRecord =
                                          snapshot.data!;

                                      return Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                1.0,
                                        constraints: const BoxConstraints(
                                          minHeight: 100.0,
                                        ),
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 10.0, 0.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10.0,
                                                                  0.0,
                                                                  10.0,
                                                                  0.0),
                                                      child: Text(
                                                        containerWyzwaniaRecord.nazwa,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .headlineMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Outfit',
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 25.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Align(
                                              alignment: const AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        10.0, 10.0, 10.0, 0.0),
                                                child: Text(
                                                  'Nagroda: ${containerWyzwaniaRecord.nagroda.toString()}zł',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .headlineMedium
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        color: Colors.white,
                                                        fontSize: 22.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w300,
                                                      ),
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: const AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        10.0, 10.0, 10.0, 10.0),
                                                child: Text(
                                                  'Zakres od ${dateTimeFormat(
                                                    "d/M/y",
                                                    containerWyzwaniaRecord
                                                        .poczatkowa,
                                                    locale: FFLocalizations.of(
                                                            context)
                                                        .languageCode,
                                                  )} do ${dateTimeFormat(
                                                    "d/M/y",
                                                    containerWyzwaniaRecord
                                                        .koncowa,
                                                    locale: FFLocalizations.of(
                                                            context)
                                                        .languageCode,
                                                  )}',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .headlineMedium
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        color: Colors.white,
                                                        fontSize: 22.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w300,
                                                      ),
                                                ),
                                              ),
                                            ),
                                            if (containerWyzwaniaRecord.typ ==
                                                1)
                                              Align(
                                                alignment: const AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          10.0, 0.0, 10.0, 0.0),
                                                  child: FutureBuilder<int>(
                                                    future:
                                                        queryZamowienieRecordCount(
                                                      queryBuilder:
                                                          (zamowienieRecord) =>
                                                              zamowienieRecord
                                                                  .where(
                                                                    'Godzinadodania',
                                                                    isGreaterThanOrEqualTo:
                                                                        containerWyzwaniaRecord
                                                                            .poczatkowa,
                                                                  )
                                                                  .where(
                                                                    'Godzinadodania',
                                                                    isLessThanOrEqualTo:
                                                                        containerWyzwaniaRecord
                                                                            .koncowa,
                                                                  )
                                                                  .where(
                                                                    'Przydzielonykurier',
                                                                    isEqualTo:
                                                                        currentUserReference,
                                                                  )
                                                                  .where(
                                                                    'Dostarczone',
                                                                    isEqualTo:
                                                                        true,
                                                                  )
                                                                  .where(
                                                                    'odrzucone',
                                                                    isEqualTo:
                                                                        false,
                                                                  ),
                                                    ),
                                                    builder:
                                                        (context, snapshot) {
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
                                                      int textCount =
                                                          snapshot.data!;

                                                      return Text(
                                                        'Postęp: ${textCount.toString()}/${containerWyzwaniaRecord.iloscwymagana.toString()}',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .headlineMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Outfit',
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 22.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ),
                                            if (containerWyzwaniaRecord.typ ==
                                                2)
                                              Align(
                                                alignment: const AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          10.0, 0.0, 10.0, 0.0),
                                                  child: FutureBuilder<int>(
                                                    future:
                                                        queryUkonczonewyzwaniaRecordCount(
                                                      queryBuilder:
                                                          (ukonczonewyzwaniaRecord) =>
                                                              ukonczonewyzwaniaRecord
                                                                  .where(
                                                                    'data',
                                                                    isGreaterThanOrEqualTo:
                                                                        containerWyzwaniaRecord
                                                                            .poczatkowa,
                                                                  )
                                                                  .where(
                                                                    'data',
                                                                    isLessThanOrEqualTo:
                                                                        containerWyzwaniaRecord
                                                                            .koncowa,
                                                                  )
                                                                  .where(
                                                                    'kurier',
                                                                    isEqualTo:
                                                                        currentUserReference,
                                                                  ),
                                                    ),
                                                    builder:
                                                        (context, snapshot) {
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
                                                      int textCount =
                                                          snapshot.data!;

                                                      return Text(
                                                        'Postęp: ${textCount.toString()}/${containerWyzwaniaRecord.iloscwymagana.toString()}',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .headlineMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Outfit',
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 22.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ),
                                            if (containerWyzwaniaRecord.typ ==
                                                1)
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 10.0, 0.0, 20.0),
                                                child: FutureBuilder<int>(
                                                  future:
                                                      queryZamowienieRecordCount(
                                                    queryBuilder:
                                                        (zamowienieRecord) =>
                                                            zamowienieRecord
                                                                .where(
                                                                  'Godzinadodania',
                                                                  isGreaterThanOrEqualTo:
                                                                      containerWyzwaniaRecord
                                                                          .poczatkowa,
                                                                )
                                                                .where(
                                                                  'Godzinadodania',
                                                                  isLessThanOrEqualTo:
                                                                      containerWyzwaniaRecord
                                                                          .koncowa,
                                                                )
                                                                .where(
                                                                  'Przydzielonykurier',
                                                                  isEqualTo:
                                                                      currentUserReference,
                                                                )
                                                                .where(
                                                                  'Dostarczone',
                                                                  isEqualTo:
                                                                      true,
                                                                )
                                                                .where(
                                                                  'odrzucone',
                                                                  isEqualTo:
                                                                      false,
                                                                ),
                                                  ),
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
                                                    int progressBarCount =
                                                        snapshot.data!;

                                                    return CircularPercentIndicator(
                                                      percent: valueOrDefault<
                                                          double>(
                                                        functions.divide(
                                                            progressBarCount,
                                                            containerWyzwaniaRecord
                                                                .iloscwymagana),
                                                        0.0,
                                                      ),
                                                      radius: 60.0,
                                                      lineWidth: 12.0,
                                                      animation: true,
                                                      animateFromLastPercent:
                                                          true,
                                                      progressColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .accent4,
                                                      backgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondary,
                                                      center: Text(
                                                        '${valueOrDefault<String>(
                                                          functions
                                                              .byonehundred(
                                                                  valueOrDefault<
                                                                      double>(
                                                                functions.divide(
                                                                    progressBarCount,
                                                                    containerWyzwaniaRecord
                                                                        .iloscwymagana),
                                                                0.0,
                                                              ))
                                                              .toString(),
                                                          '0',
                                                        )}%',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineSmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Outfit',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),
                                            if (containerWyzwaniaRecord.typ ==
                                                2)
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 10.0, 0.0, 20.0),
                                                child: FutureBuilder<int>(
                                                  future:
                                                      queryUkonczonewyzwaniaRecordCount(
                                                    queryBuilder:
                                                        (ukonczonewyzwaniaRecord) =>
                                                            ukonczonewyzwaniaRecord
                                                                .where(
                                                                  'data',
                                                                  isGreaterThanOrEqualTo:
                                                                      containerWyzwaniaRecord
                                                                          .poczatkowa,
                                                                )
                                                                .where(
                                                                  'data',
                                                                  isLessThanOrEqualTo:
                                                                      containerWyzwaniaRecord
                                                                          .koncowa,
                                                                )
                                                                .where(
                                                                  'kurier',
                                                                  isEqualTo:
                                                                      currentUserReference,
                                                                ),
                                                  ),
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
                                                    int progressBarCount =
                                                        snapshot.data!;

                                                    return CircularPercentIndicator(
                                                      percent: functions.divide(
                                                          progressBarCount,
                                                          containerWyzwaniaRecord
                                                              .iloscwymagana)!,
                                                      radius: 60.0,
                                                      lineWidth: 12.0,
                                                      animation: true,
                                                      animateFromLastPercent:
                                                          true,
                                                      progressColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .accent4,
                                                      backgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondary,
                                                      center: Text(
                                                        '${valueOrDefault<String>(
                                                          functions
                                                              .byonehundred(
                                                                  valueOrDefault<
                                                                      double>(
                                                                functions.divide(
                                                                    progressBarCount,
                                                                    containerWyzwaniaRecord
                                                                        .iloscwymagana),
                                                                0.0,
                                                              ))
                                                              .toString(),
                                                          '0',
                                                        )}%',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineSmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Outfit',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),
                                            if (containerWyzwaniaRecord.typ ==
                                                1)
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        10.0, 0.0, 10.0, 10.0),
                                                child: FutureBuilder<int>(
                                                  future:
                                                      queryZamowienieRecordCount(
                                                    queryBuilder:
                                                        (zamowienieRecord) =>
                                                            zamowienieRecord
                                                                .where(
                                                                  'Godzinadodania',
                                                                  isGreaterThanOrEqualTo:
                                                                      containerWyzwaniaRecord
                                                                          .poczatkowa,
                                                                )
                                                                .where(
                                                                  'Godzinadodania',
                                                                  isLessThanOrEqualTo:
                                                                      containerWyzwaniaRecord
                                                                          .koncowa,
                                                                )
                                                                .where(
                                                                  'Przydzielonykurier',
                                                                  isEqualTo:
                                                                      currentUserReference,
                                                                )
                                                                .where(
                                                                  'Dostarczone',
                                                                  isEqualTo:
                                                                      true,
                                                                )
                                                                .where(
                                                                  'odrzucone',
                                                                  isEqualTo:
                                                                      false,
                                                                ),
                                                  ),
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
                                                    int buttonCount =
                                                        snapshot.data!;

                                                    return FFButtonWidget(
                                                      onPressed: () async {
                                                        if (buttonCount >=
                                                            containerWyzwaniaRecord
                                                                .iloscwymagana) {
                                                          await containerWyzwaniaRecord
                                                              .reference
                                                              .update({
                                                            ...mapToFirestore(
                                                              {
                                                                'listakurierowprzyjeci':
                                                                    FieldValue
                                                                        .arrayUnion([
                                                                  currentUserReference
                                                                ]),
                                                              },
                                                            ),
                                                          });

                                                          await UkonczonewyzwaniaRecord
                                                              .collection
                                                              .doc()
                                                              .set(
                                                                  createUkonczonewyzwaniaRecordData(
                                                                wyzwanie:
                                                                    containerWyzwaniaRecord
                                                                        .reference,
                                                                kurier:
                                                                    currentUserReference,
                                                                nagroda:
                                                                    containerWyzwaniaRecord
                                                                        .nagroda,
                                                                data:
                                                                    getCurrentTimestamp,
                                                                miasto: valueOrDefault(
                                                                    currentUserDocument
                                                                        ?.miasto,
                                                                    0),
                                                                zrealizowane:
                                                                    buttonCount,
                                                              ));

                                                          await currentUserReference!
                                                              .update({
                                                            ...mapToFirestore(
                                                              {
                                                                'portfel': FieldValue.increment(
                                                                    containerWyzwaniaRecord
                                                                        .nagroda
                                                                        .toDouble()),
                                                              },
                                                            ),
                                                          });
                                                        } else {
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(
                                                            SnackBar(
                                                              content: Text(
                                                                'Ukończ wyzwanie aby odebrać nagrodę',
                                                                style:
                                                                    TextStyle(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                ),
                                                              ),
                                                              duration: const Duration(
                                                                  milliseconds:
                                                                      4000),
                                                              backgroundColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondary,
                                                            ),
                                                          );
                                                        }
                                                      },
                                                      text: 'Odbierz nagrodę',
                                                      options: FFButtonOptions(
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                1.0,
                                                        height: 50.0,
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    24.0,
                                                                    0.0,
                                                                    24.0,
                                                                    0.0),
                                                        iconPadding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Readex Pro',
                                                                  color: Colors
                                                                      .white,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                        elevation: 1.0,
                                                        borderSide: const BorderSide(
                                                          color: Colors
                                                              .transparent,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(24.0),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),
                                            if (containerWyzwaniaRecord.typ ==
                                                2)
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        10.0, 0.0, 10.0, 10.0),
                                                child: FutureBuilder<int>(
                                                  future:
                                                      queryUkonczonewyzwaniaRecordCount(
                                                    queryBuilder:
                                                        (ukonczonewyzwaniaRecord) =>
                                                            ukonczonewyzwaniaRecord
                                                                .where(
                                                                  'data',
                                                                  isGreaterThanOrEqualTo:
                                                                      containerWyzwaniaRecord
                                                                          .poczatkowa,
                                                                )
                                                                .where(
                                                                  'data',
                                                                  isLessThanOrEqualTo:
                                                                      containerWyzwaniaRecord
                                                                          .koncowa,
                                                                )
                                                                .where(
                                                                  'kurier',
                                                                  isEqualTo:
                                                                      currentUserReference,
                                                                ),
                                                  ),
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
                                                    int buttonCount =
                                                        snapshot.data!;

                                                    return FFButtonWidget(
                                                      onPressed: () async {
                                                        if (buttonCount >=
                                                            containerWyzwaniaRecord
                                                                .iloscwymagana) {
                                                          await containerWyzwaniaRecord
                                                              .reference
                                                              .update({
                                                            ...mapToFirestore(
                                                              {
                                                                'listakurierowprzyjeci':
                                                                    FieldValue
                                                                        .arrayUnion([
                                                                  currentUserReference
                                                                ]),
                                                              },
                                                            ),
                                                          });

                                                          await UkonczonewyzwaniaRecord
                                                              .collection
                                                              .doc()
                                                              .set(
                                                                  createUkonczonewyzwaniaRecordData(
                                                                wyzwanie:
                                                                    containerWyzwaniaRecord
                                                                        .reference,
                                                                kurier:
                                                                    currentUserReference,
                                                                nagroda:
                                                                    containerWyzwaniaRecord
                                                                        .nagroda,
                                                                data:
                                                                    getCurrentTimestamp,
                                                                miasto: valueOrDefault(
                                                                    currentUserDocument
                                                                        ?.miasto,
                                                                    0),
                                                                zrealizowane:
                                                                    buttonCount,
                                                              ));

                                                          await currentUserReference!
                                                              .update({
                                                            ...mapToFirestore(
                                                              {
                                                                'portfel': FieldValue.increment(
                                                                    containerWyzwaniaRecord
                                                                        .nagroda
                                                                        .toDouble()),
                                                              },
                                                            ),
                                                          });
                                                        } else {
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(
                                                            SnackBar(
                                                              content: Text(
                                                                'Ukończ wyzwanie aby odebrać nagrodę',
                                                                style:
                                                                    TextStyle(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                ),
                                                              ),
                                                              duration: const Duration(
                                                                  milliseconds:
                                                                      4000),
                                                              backgroundColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondary,
                                                            ),
                                                          );
                                                        }
                                                      },
                                                      text: 'Odbierz nagrodę',
                                                      options: FFButtonOptions(
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                1.0,
                                                        height: 50.0,
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    24.0,
                                                                    0.0,
                                                                    24.0,
                                                                    0.0),
                                                        iconPadding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Readex Pro',
                                                                  color: Colors
                                                                      .white,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                        elevation: 1.0,
                                                        borderSide: const BorderSide(
                                                          color: Colors
                                                              .transparent,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(24.0),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),
                                          ],
                                        ),
                                      );
                                    },
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
      ),
    );
  }
}
