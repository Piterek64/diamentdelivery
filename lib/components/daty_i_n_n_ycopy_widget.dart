import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'daty_i_n_n_ycopy_model.dart';
export 'daty_i_n_n_ycopy_model.dart';

class DatyINNYcopyWidget extends StatefulWidget {
  const DatyINNYcopyWidget({super.key});

  @override
  State<DatyINNYcopyWidget> createState() => _DatyINNYcopyWidgetState();
}

class _DatyINNYcopyWidgetState extends State<DatyINNYcopyWidget> {
  late DatyINNYcopyModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DatyINNYcopyModel());
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
                  final datePickedDate = await showDatePicker(
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

                  if (datePickedDate != null) {
                    safeSetState(() {
                      _model.datePicked = DateTime(
                        datePickedDate.year,
                        datePickedDate.month,
                        datePickedDate.day,
                      );
                    });
                  }
                  FFAppState().startDate = _model.datePicked;
                  setState(() {});
                },
                text: 'Data ${dateTimeFormat(
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
                    FFAppState().tymDate = FFAppState().startDate;
                    setState(() {});
                    if (_model.wybierzrestauracjaeee1Value == 'Wszystkie') {
                      _model.danedozamowienZWYKLA =
                          await queryZamowienieRecordOnce(
                        queryBuilder: (zamowienieRecord) => zamowienieRecord
                            .where(
                              'datadzien',
                              isEqualTo: dateTimeFormat(
                                "d/M/y",
                                FFAppState().startDate,
                                locale:
                                    FFLocalizations.of(context).languageCode,
                              ),
                            )
                            .where(
                              'Dostarczone',
                              isEqualTo: true,
                            )
                            .where(
                              'Przydzielonykurier',
                              isEqualTo: FFAppState().tymkurier,
                            ),
                      );
                      Navigator.pop(
                          context,
                          _model.danedozamowienZWYKLA
                              ?.map((e) => e.reference)
                              .toList());
                    } else {
                      _model.otput = await queryRestauracjaRecordOnce(
                        queryBuilder: (restauracjaRecord) =>
                            restauracjaRecord.where(
                          'Nazwa',
                          isEqualTo: _model.wybierzrestauracjaeee1Value,
                        ),
                        singleRecord: true,
                      ).then((s) => s.firstOrNull);
                      _model.danedozamowienZWYKLARES =
                          await queryZamowienieRecordOnce(
                        queryBuilder: (zamowienieRecord) => zamowienieRecord
                            .where(
                              'datadzien',
                              isEqualTo: dateTimeFormat(
                                "d/M/y",
                                FFAppState().startDate,
                                locale:
                                    FFLocalizations.of(context).languageCode,
                              ),
                            )
                            .where(
                              'Dostarczone',
                              isEqualTo: true,
                            )
                            .where(
                              'Restauracja',
                              isEqualTo: _model.otput?.reference,
                            )
                            .where(
                              'Przydzielonykurier',
                              isEqualTo: FFAppState().tymkurier,
                            ),
                      );
                      Navigator.pop(
                          context,
                          _model.danedozamowienZWYKLARES
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
