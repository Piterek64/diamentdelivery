import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/brak_copy_widget.dart';
import '/components/od_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'grafikk_model.dart';
export 'grafikk_model.dart';

class GrafikkWidget extends StatefulWidget {
  const GrafikkWidget({super.key});

  @override
  State<GrafikkWidget> createState() => _GrafikkWidgetState();
}

class _GrafikkWidgetState extends State<GrafikkWidget> {
  late GrafikkModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GrafikkModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      while (FFAppState().odswiezaniegieldy) {
        setState(() {});
        await Future.delayed(const Duration(milliseconds: 5000));
      }
    });
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
            'Grafik',
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
                  child: StreamBuilder<List<GrafikRecord>>(
                    stream: queryGrafikRecord(
                      queryBuilder: (grafikRecord) => grafikRecord
                          .where(
                            'data',
                            isGreaterThan: getCurrentTimestamp,
                          )
                          .orderBy('data'),
                      limit: 7,
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
                      List<GrafikRecord> listViewGrafikRecordList =
                          snapshot.data!;
                      if (listViewGrafikRecordList.isEmpty) {
                        return const BrakCopyWidget();
                      }

                      return ListView.separated(
                        padding: EdgeInsets.zero,
                        primary: false,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: listViewGrafikRecordList.length,
                        separatorBuilder: (_, __) => const SizedBox(height: 10.0),
                        itemBuilder: (context, listViewIndex) {
                          final listViewGrafikRecord =
                              listViewGrafikRecordList[listViewIndex];
                          return FutureBuilder<int>(
                            future: queryGrafikRecordCount(
                              queryBuilder: (grafikRecord) => grafikRecord
                                  .where(
                                    'users',
                                    arrayContains: currentUserReference,
                                  )
                                  .where(
                                    'data',
                                    isEqualTo: listViewGrafikRecord.data,
                                  ),
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
                              int containerCount = snapshot.data!;

                              return Container(
                                width: 100.0,
                                height: 215.0,
                                decoration: BoxDecoration(
                                  color: containerCount == 1
                                      ? const Color(0xFF64C55A)
                                      : FlutterFlowTheme.of(context).primary,
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      15.0, 15.0, 15.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        listViewGrafikRecord.oddwunastejusers
                                                .contains(currentUserReference)
                                            ? '${dateTimeFormat(
                                                "d/M/y",
                                                listViewGrafikRecord.data,
                                                locale:
                                                    FFLocalizations.of(context)
                                                        .languageCode,
                                              )} Od 11:00'
                                            : '${dateTimeFormat(
                                                "d/M/y",
                                                listViewGrafikRecord.data,
                                                locale:
                                                    FFLocalizations.of(context)
                                                        .languageCode,
                                              )} Od 12:00',
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
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 10.0, 0.0, 0.0),
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            if (containerCount == 1) {
                                              await listViewGrafikRecord
                                                  .reference
                                                  .update({
                                                ...mapToFirestore(
                                                  {
                                                    'users':
                                                        FieldValue.arrayRemove([
                                                      currentUserReference
                                                    ]),
                                                  },
                                                ),
                                              });

                                              await currentUserReference!
                                                  .update({
                                                ...mapToFirestore(
                                                  {
                                                    'grafiki':
                                                        FieldValue.arrayRemove([
                                                      listViewGrafikRecord
                                                          .reference
                                                    ]),
                                                  },
                                                ),
                                              });
                                            } else {
                                              await listViewGrafikRecord
                                                  .reference
                                                  .update({
                                                ...mapToFirestore(
                                                  {
                                                    'users':
                                                        FieldValue.arrayUnion([
                                                      currentUserReference
                                                    ]),
                                                  },
                                                ),
                                              });

                                              await currentUserReference!
                                                  .update({
                                                ...mapToFirestore(
                                                  {
                                                    'grafiki':
                                                        FieldValue.arrayUnion([
                                                      listViewGrafikRecord
                                                          .reference
                                                    ]),
                                                  },
                                                ),
                                              });
                                            }

                                            setState(() {});
                                          },
                                          text: containerCount == 1
                                              ? 'Zrezygnuj'
                                              : 'Zapisz się',
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
                                            color: containerCount == 1
                                                ? const Color(0xFFA02F2F)
                                                : FlutterFlowTheme.of(context)
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
                                            FFAppState().tymdata =
                                                listViewGrafikRecord.data;
                                            setState(() {});

                                            context.pushNamed(
                                              'Zapisanikurierzy',
                                              queryParameters: {
                                                'bajka': serializeParam(
                                                  listViewGrafikRecord
                                                      .reference,
                                                  ParamType.DocumentReference,
                                                ),
                                              }.withoutNulls,
                                            );
                                          },
                                          text: 'Lista kurierów',
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
                                            color: containerCount == 1
                                                ? const Color(0xFF58AD4F)
                                                : FlutterFlowTheme.of(context)
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
                                      Expanded(
                                        child: OdWidget(
                                          key: Key(
                                              'Keyop8_${listViewIndex}_of_${listViewGrafikRecordList.length}'),
                                          grafikpozycja:
                                              listViewGrafikRecord.reference,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      );
                    },
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
