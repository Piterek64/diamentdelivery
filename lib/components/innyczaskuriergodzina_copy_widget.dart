import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/dodajzamowienierecznie_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'innyczaskuriergodzina_copy_model.dart';
export 'innyczaskuriergodzina_copy_model.dart';

class InnyczaskuriergodzinaCopyWidget extends StatefulWidget {
  const InnyczaskuriergodzinaCopyWidget({super.key});

  @override
  State<InnyczaskuriergodzinaCopyWidget> createState() =>
      _InnyczaskuriergodzinaCopyWidgetState();
}

class _InnyczaskuriergodzinaCopyWidgetState
    extends State<InnyczaskuriergodzinaCopyWidget> {
  late InnyczaskuriergodzinaCopyModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InnyczaskuriergodzinaCopyModel());

    _model.innyczasgodzinakurierTextController ??= TextEditingController();
    _model.innyczasgodzinakurierFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<ZamowienieRecord>(
      stream: ZamowienieRecord.getDocument(FFAppState().tymczasowezlecenie!)
        ..listen((bottomSheetEditZamowienieRecord) async {
          if (_model.bottomSheetEditPreviousSnapshot != null &&
              !const ZamowienieRecordDocumentEquality().equals(
                  bottomSheetEditZamowienieRecord,
                  _model.bottomSheetEditPreviousSnapshot)) {
            Navigator.pop(context);

            setState(() {});
          }
          _model.bottomSheetEditPreviousSnapshot =
              bottomSheetEditZamowienieRecord;
        }),
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

        final bottomSheetEditZamowienieRecord = snapshot.data!;

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
                      Navigator.pop(context);
                    },
                    text: 'Anuluj',
                    options: FFButtonOptions(
                      width: double.infinity,
                      height: 60.0,
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      iconPadding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle:
                          FlutterFlowTheme.of(context).bodyLarge.override(
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
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                    child: StreamBuilder<ZamowienieRecord>(
                      stream: ZamowienieRecord.getDocument(
                          FFAppState().tymczasowezlecenie!),
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

                        final buttonZamowienieRecord = snapshot.data!;

                        return FFButtonWidget(
                          onPressed: () async {
                            await FFAppState()
                                .tymczasowezlecenie!
                                .update(createZamowienieRecordData(
                                  przydzielonykurier: currentUserReference,
                                  jaknajszybciejkurier: false,
                                  nagodzinekurier: true,
                                  godzinanagodzinekurier: _model
                                      .innyczasgodzinakurierTextController.text,
                                  przyjete: true,
                                  dostarczone: false,
                                ));

                            await FFAppState()
                                .doppolaczenia!
                                .update(createZamowienieRecordData(
                                  przydzielonykurier: currentUserReference,
                                  jaknajszybciejkurier: false,
                                  nagodzinekurier: true,
                                  godzinanagodzinekurier: _model
                                      .innyczasgodzinakurierTextController.text,
                                  przyjete: true,
                                  dostarczone: false,
                                ));

                            await PowiadomienieprzyjalemRecord.collection
                                .doc()
                                .set(createPowiadomienieprzyjalemRecordData(
                                  restauracja:
                                      buttonZamowienieRecord.restauracja,
                                  zamowienie: FFAppState().tymczasowezlecenie,
                                  godzina: getCurrentTimestamp,
                                  typ: 'Zamówienie przyjęte',
                                  nazwa: 'Kurier przyjął twoje zamówienie',
                                ));
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Zamówienie przyjęte',
                                  style: TextStyle(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                ),
                                duration: const Duration(milliseconds: 4000),
                                backgroundColor:
                                    FlutterFlowTheme.of(context).secondary,
                              ),
                            );
                            Navigator.pop(context);
                            Navigator.pop(context);
                            Navigator.pop(context);
                          },
                          text: 'Akceptuj',
                          options: FFButtonOptions(
                            width: double.infinity,
                            height: 60.0,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle:
                                FlutterFlowTheme.of(context).bodyLarge.override(
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
                        );
                      },
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                      child: SizedBox(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        child: TextFormField(
                          controller:
                              _model.innyczasgodzinakurierTextController,
                          focusNode: _model.innyczasgodzinakurierFocusNode,
                          onFieldSubmitted: (_) async {
                            FFAppState().tymczasowyczas = int.parse(_model
                                .innyczasgodzinakurierTextController.text);
                            setState(() {});
                            await showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              enableDrag: false,
                              context: context,
                              builder: (context) {
                                return Padding(
                                  padding: MediaQuery.viewInsetsOf(context),
                                  child: const DodajzamowienierecznieWidget(),
                                );
                              },
                            ).then((value) => safeSetState(() {}));
                          },
                          autofocus: true,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'Podaj godzinę...',
                            labelStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: const Color(0xFFBCBCBC),
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w200,
                                ),
                            hintStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  letterSpacing: 0.0,
                                ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color(0xFFD6D6D6),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).primary,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Readex Pro',
                                    letterSpacing: 0.0,
                                  ),
                          textAlign: TextAlign.center,
                          validator: _model
                              .innyczasgodzinakurierTextControllerValidator
                              .asValidator(context),
                          inputFormatters: [_model.innyczasgodzinakurierMask],
                        ),
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
  }
}
