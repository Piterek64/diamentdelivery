import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/daty_a_d_m_i_n_k_l_a_s_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'mojestatystykiadmin2_copy_model.dart';
export 'mojestatystykiadmin2_copy_model.dart';

class Mojestatystykiadmin2CopyWidget extends StatefulWidget {
  const Mojestatystykiadmin2CopyWidget({
    super.key,
    this.maczo2,
  });

  final List<DocumentReference>? maczo2;

  @override
  State<Mojestatystykiadmin2CopyWidget> createState() =>
      _Mojestatystykiadmin2CopyWidgetState();
}

class _Mojestatystykiadmin2CopyWidgetState
    extends State<Mojestatystykiadmin2CopyWidget> {
  late Mojestatystykiadmin2CopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Mojestatystykiadmin2CopyModel());
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
            'Statystyki strefy lokale',
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
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          FFAppState().ZAKRESDAT = true;
                          FFAppState().POJDATA = false;
                          setState(() {});
                          await showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            enableDrag: false,
                            context: context,
                            builder: (context) {
                              return GestureDetector(
                                onTap: () => FocusScope.of(context).unfocus(),
                                child: Padding(
                                  padding: MediaQuery.viewInsetsOf(context),
                                  child: const DatyADMINKLASWidget(),
                                ),
                              );
                            },
                          ).then((value) => safeSetState(() {}));
                        },
                        text: 'Wybierz zakres dat',
                        options: FFButtonOptions(
                          width: MediaQuery.sizeOf(context).width * 0.95,
                          height: 56.0,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Readex Pro',
                                    color: Colors.white,
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                          elevation: 3.0,
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                    child: AuthUserStreamWidget(
                      builder: (context) =>
                          StreamBuilder<List<RestauracjaRecord>>(
                        stream: queryRestauracjaRecord(
                          queryBuilder: (restauracjaRecord) => restauracjaRecord
                              .where(
                                'miasto',
                                isEqualTo: valueOrDefault(
                                    currentUserDocument?.miasto, 0),
                              )
                              .where(
                                'Nazwa',
                                isNotEqualTo: 'Wszystkie',
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
                          List<RestauracjaRecord>
                              wybierzrestauracjaeee1RestauracjaRecordList =
                              snapshot.data!;

                          return FlutterFlowDropDown<String>(
                            controller:
                                _model.wybierzrestauracjaeee1ValueController ??=
                                    FormFieldController<String>(
                              _model.wybierzrestauracjaeee1Value ??=
                                  'Wybierz restauracje',
                            ),
                            options: wybierzrestauracjaeee1RestauracjaRecordList
                                .map((e) => e.nazwa)
                                .toList(),
                            onChanged: (val) async {
                              setState(() =>
                                  _model.wybierzrestauracjaeee1Value = val);
                              _model.hahaha = await queryRestauracjaRecordOnce(
                                queryBuilder: (restauracjaRecord) =>
                                    restauracjaRecord
                                        .where(
                                          'Nazwa',
                                          isEqualTo: _model
                                              .wybierzrestauracjaeee1Value,
                                        )
                                        .where(
                                          'miasto',
                                          isEqualTo: valueOrDefault(
                                              currentUserDocument?.miasto, 0),
                                        ),
                                singleRecord: true,
                              ).then((s) => s.firstOrNull);
                              FFAppState().tymrestauracja =
                                  _model.hahaha?.reference;
                              setState(() {});

                              setState(() {});
                            },
                            width: MediaQuery.sizeOf(context).width * 0.95,
                            height: 56.0,
                            textStyle: TextStyle(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              fontWeight: FontWeight.w500,
                              fontSize: 16.0,
                            ),
                            hintText: 'Wybierz restauracje',
                            icon: Icon(
                              Icons.keyboard_arrow_down_rounded,
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              size: 24.0,
                            ),
                            fillColor: FlutterFlowTheme.of(context).primary,
                            elevation: 2.0,
                            borderColor:
                                FlutterFlowTheme.of(context).primaryBackground,
                            borderWidth: 2.0,
                            borderRadius: 8.0,
                            margin: const EdgeInsetsDirectional.fromSTEB(
                                16.0, 4.0, 16.0, 4.0),
                            hidesUnderline: true,
                            isOverButton: true,
                            isSearchable: false,
                            isMultiSelect: false,
                          );
                        },
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      setState(() {});
                    },
                    text: 'Odśwież',
                    options: FFButtonOptions(
                      width: MediaQuery.sizeOf(context).width * 0.95,
                      height: 56.0,
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      iconPadding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Readex Pro',
                                color: Colors.white,
                                fontSize: 14.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.normal,
                              ),
                      elevation: 3.0,
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(10.0, 30.0, 10.0, 0.0),
                  child: AuthUserStreamWidget(
                    builder: (context) => StreamBuilder<List<StrefyRecord>>(
                      stream: queryStrefyRecord(
                        queryBuilder: (strefyRecord) => strefyRecord.where(
                          'miasto',
                          isEqualTo:
                              valueOrDefault(currentUserDocument?.miasto, 0),
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
                        List<StrefyRecord> listViewStrefyRecordList =
                            snapshot.data!;

                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: listViewStrefyRecordList.length,
                          itemBuilder: (context, listViewIndex) {
                            final listViewStrefyRecord =
                                listViewStrefyRecordList[listViewIndex];
                            return Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 10.0),
                              child: FutureBuilder<int>(
                                future: queryZamowienieRecordCount(
                                  queryBuilder: (zamowienieRecord) =>
                                      zamowienieRecord
                                          .where(
                                            'strefa',
                                            isEqualTo:
                                                listViewStrefyRecord.reference,
                                          )
                                          .where(
                                            'sprawdzonastrefa',
                                            isEqualTo: true,
                                          )
                                          .where(
                                            'Godzinadodania',
                                            isGreaterThanOrEqualTo:
                                                FFAppState().startDate,
                                          )
                                          .where(
                                            'Godzinadodania',
                                            isLessThanOrEqualTo:
                                                functions.addoneday(
                                                    FFAppState().endDate),
                                          )
                                          .where(
                                            'Miasto',
                                            isEqualTo: valueOrDefault(
                                                    currentUserDocument?.miasto,
                                                    0)
                                                .toString(),
                                          )
                                          .where(
                                            'Restauracja',
                                            isEqualTo:
                                                FFAppState().tymrestauracja,
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
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                  int containerCount = snapshot.data!;

                                  return Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.0,
                                    height: 70.0,
                                    decoration: BoxDecoration(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: Align(
                                      alignment: const AlignmentDirectional(0.0, 0.0),
                                      child: Text(
                                        'Strefa ${listViewStrefyRecord.numer.toString()} - ${listViewStrefyRecord.cena.toString()}zł Ilość: ${containerCount.toString()}',
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
                                  );
                                },
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
