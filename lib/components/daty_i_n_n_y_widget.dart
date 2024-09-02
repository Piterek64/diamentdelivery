import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'daty_i_n_n_y_model.dart';
export 'daty_i_n_n_y_model.dart';

class DatyINNYWidget extends StatefulWidget {
  const DatyINNYWidget({super.key});

  @override
  State<DatyINNYWidget> createState() => _DatyINNYWidgetState();
}

class _DatyINNYWidgetState extends State<DatyINNYWidget> {
  late DatyINNYModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DatyINNYModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: double.infinity,
      height: MediaQuery.sizeOf(context).height * 0.9,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 5.0,
            color: Color(0x3B1D2429),
            offset: Offset(
              0.0,
              -3.0,
            ),
          )
        ],
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              FFButtonWidget(
                onPressed: () async {
                  final datePicked1Date = await showDatePicker(
                    context: context,
                    initialDate: getCurrentTimestamp,
                    firstDate: DateTime(1900),
                    lastDate: DateTime(2050),
                    builder: (context, child) {
                      return wrapInMaterialDatePickerTheme(
                        context,
                        child!,
                        headerBackgroundColor:
                            FlutterFlowTheme.of(context).primary,
                        headerForegroundColor:
                            FlutterFlowTheme.of(context).info,
                        headerTextStyle:
                            FlutterFlowTheme.of(context).headlineLarge.override(
                                  fontFamily: 'Outfit',
                                  fontSize: 32.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                ),
                        pickerBackgroundColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                        pickerForegroundColor:
                            FlutterFlowTheme.of(context).primaryText,
                        selectedDateTimeBackgroundColor:
                            FlutterFlowTheme.of(context).primary,
                        selectedDateTimeForegroundColor:
                            FlutterFlowTheme.of(context).info,
                        actionButtonForegroundColor:
                            FlutterFlowTheme.of(context).primaryText,
                        iconSize: 24.0,
                      );
                    },
                  );

                  if (datePicked1Date != null) {
                    safeSetState(() {
                      _model.datePicked1 = DateTime(
                        datePicked1Date.year,
                        datePicked1Date.month,
                        datePicked1Date.day,
                      );
                    });
                  }
                  FFAppState().startDate = _model.datePicked1;
                  setState(() {});
                },
                text: 'Data początkowa ${dateTimeFormat(
                  "d/M/y",
                  FFAppState().startDate,
                  locale: FFLocalizations.of(context).languageCode,
                )}',
                options: FFButtonOptions(
                  width: double.infinity,
                  height: 60.0,
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  iconPadding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).primary,
                  textStyle: FlutterFlowTheme.of(context).bodyLarge.override(
                        fontFamily: 'Plus Jakarta Sans',
                        color: Colors.white,
                        fontSize: 16.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.normal,
                      ),
                  elevation: 2.0,
                  borderSide: const BorderSide(
                    color: Colors.transparent,
                    width: 1.0,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    final datePicked2Date = await showDatePicker(
                      context: context,
                      initialDate: getCurrentTimestamp,
                      firstDate: DateTime(1900),
                      lastDate: DateTime(2050),
                      builder: (context, child) {
                        return wrapInMaterialDatePickerTheme(
                          context,
                          child!,
                          headerBackgroundColor:
                              FlutterFlowTheme.of(context).primary,
                          headerForegroundColor:
                              FlutterFlowTheme.of(context).info,
                          headerTextStyle: FlutterFlowTheme.of(context)
                              .headlineLarge
                              .override(
                                fontFamily: 'Outfit',
                                fontSize: 32.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w600,
                              ),
                          pickerBackgroundColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          pickerForegroundColor:
                              FlutterFlowTheme.of(context).primaryText,
                          selectedDateTimeBackgroundColor:
                              FlutterFlowTheme.of(context).primary,
                          selectedDateTimeForegroundColor:
                              FlutterFlowTheme.of(context).info,
                          actionButtonForegroundColor:
                              FlutterFlowTheme.of(context).primaryText,
                          iconSize: 24.0,
                        );
                      },
                    );

                    if (datePicked2Date != null) {
                      safeSetState(() {
                        _model.datePicked2 = DateTime(
                          datePicked2Date.year,
                          datePicked2Date.month,
                          datePicked2Date.day,
                        );
                      });
                    }
                    FFAppState().endDate = _model.datePicked2;
                    setState(() {});
                  },
                  text: 'Data końcowa ${dateTimeFormat(
                    "d/M/y",
                    FFAppState().endDate,
                    locale: FFLocalizations.of(context).languageCode,
                  )}',
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 60.0,
                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    iconPadding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).bodyLarge.override(
                          fontFamily: 'Plus Jakarta Sans',
                          color: Colors.white,
                          fontSize: 16.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.normal,
                        ),
                    elevation: 2.0,
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0.0, -1.0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                  child: Text(
                    'Wybór restauracji',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).headlineMedium.override(
                          fontFamily: 'Outfit',
                          color: FlutterFlowTheme.of(context).primary,
                          fontSize: 22.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.normal,
                        ),
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                  child: AuthUserStreamWidget(
                    builder: (context) =>
                        StreamBuilder<List<RestauracjaRecord>>(
                      stream: queryRestauracjaRecord(
                        queryBuilder: (restauracjaRecord) =>
                            restauracjaRecord.where(
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
                        List<RestauracjaRecord>
                            wybierzrestauracjaeee1RestauracjaRecordList =
                            snapshot.data!;

                        return FlutterFlowDropDown<String>(
                          controller:
                              _model.wybierzrestauracjaeee1ValueController ??=
                                  FormFieldController<String>(
                            _model.wybierzrestauracjaeee1Value ??= 'Wszystkie',
                          ),
                          options: wybierzrestauracjaeee1RestauracjaRecordList
                              .map((e) => e.nazwa)
                              .toList(),
                          onChanged: (val) async {
                            setState(
                                () => _model.wybierzrestauracjaeee1Value = val);
                            setState(() {});
                          },
                          width: MediaQuery.sizeOf(context).width * 1.0,
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
                    if (_model.wybierzrestauracjaeee1Value == 'Wszystkie') {
                      _model.danedozamowieniazakres =
                          await queryZamowienieRecordOnce(
                        queryBuilder: (zamowienieRecord) => zamowienieRecord
                            .where(
                              'Dostarczone',
                              isEqualTo: true,
                            )
                            .where(
                              'Godzinadodania',
                              isGreaterThanOrEqualTo: FFAppState().startDate,
                            )
                            .where(
                              'Godzinadodania',
                              isLessThanOrEqualTo:
                                  functions.addoneday(FFAppState().endDate),
                            )
                            .where(
                              'Przydzielonykurier',
                              isEqualTo: FFAppState().tymkurier,
                            ),
                      );
                      Navigator.pop(
                          context,
                          _model.danedozamowieniazakres
                              ?.map((e) => e.reference)
                              .toList());
                    } else {
                      _model.otput2 = await queryRestauracjaRecordOnce(
                        queryBuilder: (restauracjaRecord) =>
                            restauracjaRecord.where(
                          'Nazwa',
                          isEqualTo: _model.wybierzrestauracjaeee1Value,
                        ),
                        singleRecord: true,
                      ).then((s) => s.firstOrNull);
                      _model.danedozamowieniazakresRES =
                          await queryZamowienieRecordOnce(
                        queryBuilder: (zamowienieRecord) => zamowienieRecord
                            .where(
                              'Dostarczone',
                              isEqualTo: true,
                            )
                            .where(
                              'Godzinadodania',
                              isGreaterThanOrEqualTo: FFAppState().startDate,
                            )
                            .where(
                              'Godzinadodania',
                              isLessThanOrEqualTo:
                                  functions.addoneday(FFAppState().endDate),
                            )
                            .where(
                              'Restauracja',
                              isEqualTo: _model.otput2?.reference,
                            )
                            .where(
                              'Przydzielonykurier',
                              isEqualTo: FFAppState().tymkurier,
                            ),
                      );
                      Navigator.pop(
                          context,
                          _model.danedozamowieniazakresRES
                              ?.map((e) => e.reference)
                              .toList());
                    }

                    setState(() {});
                  },
                  text: 'Potwierdzam wybór',
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 60.0,
                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    iconPadding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).bodyLarge.override(
                          fontFamily: 'Plus Jakarta Sans',
                          color: Colors.white,
                          fontSize: 16.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.normal,
                        ),
                    elevation: 2.0,
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
