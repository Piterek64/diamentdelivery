import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dodajzamowieniezdjecie_model.dart';
export 'dodajzamowieniezdjecie_model.dart';

class DodajzamowieniezdjecieWidget extends StatefulWidget {
  const DodajzamowieniezdjecieWidget({super.key});

  @override
  State<DodajzamowieniezdjecieWidget> createState() =>
      _DodajzamowieniezdjecieWidgetState();
}

class _DodajzamowieniezdjecieWidgetState
    extends State<DodajzamowieniezdjecieWidget> {
  late DodajzamowieniezdjecieModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DodajzamowieniezdjecieModel());

    _model.dodatkoweinfozamoreczne2TextController ??= TextEditingController();
    _model.dodatkoweinfozamoreczne2FocusNode ??= FocusNode();
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
          primary: false,
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
                child: AuthUserStreamWidget(
                  builder: (context) => StreamBuilder<RestauracjaRecord>(
                    stream: RestauracjaRecord.getDocument(
                        currentUserDocument!.restauracja!),
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

                      final buttonRestauracjaRecord = snapshot.data!;

                      return FFButtonWidget(
                        onPressed: () async {
                          if (FFAppState().tymczasowozdjecieupload == '') {
                            await showDialog(
                              context: context,
                              builder: (alertDialogContext) {
                                return AlertDialog(
                                  title: const Text('Dodaj zdjęcie!'),
                                  content: const Text(
                                      'Dodaj zdjęcie, a jeśli to zrobiłeś poczekaj aż zdjęcie sie załaduje'),
                                  actions: [
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(alertDialogContext),
                                      child: const Text('Ok'),
                                    ),
                                  ],
                                );
                              },
                            );
                          } else {
                            if (FFAppState().tymczasowyczas == 200000) {
                              await ZamowienieRecord.collection
                                  .doc()
                                  .set(createZamowienieRecordData(
                                    nrzamowienia: functions.numerzamowienia(),
                                    restauracja:
                                        currentUserDocument?.restauracja,
                                    godzinadodania: getCurrentTimestamp,
                                    zdjecie: true,
                                    dostarczone: false,
                                    dodatkoweinformacje: _model
                                        .dodatkoweinfozamoreczne2TextController
                                        .text,
                                    przyjete: false,
                                    miasto: '1',
                                    jaknaszybciej: true,
                                    zdjecieplik: _model.uploadedFileUrl,
                                    przydzielonykurier: currentUserReference,
                                    restauraucjaminuty: 0,
                                    nagodzine: false,
                                    godzinanagodzine: '0',
                                    jaknajszybciejkurier: false,
                                    kurierminuty: 0,
                                    nagodzinekurier: false,
                                    godzinanagodzinekurier: '0',
                                    odrzucone: false,
                                    datadzien: dateTimeFormat(
                                      "d/M/y",
                                      getCurrentTimestamp,
                                      locale: FFLocalizations.of(context)
                                          .languageCode,
                                    ),
                                    sprawdzonastrefa: false,
                                    dostepne:
                                        functions.add15secondtocurrenttime(
                                            getCurrentTimestamp),
                                    moznarobic: false,
                                  ));
                            } else {
                              if (FFAppState().nagodzine == true) {
                                await ZamowienieRecord.collection
                                    .doc()
                                    .set(createZamowienieRecordData(
                                      nrzamowienia: functions.numerzamowienia(),
                                      restauracja:
                                          currentUserDocument?.restauracja,
                                      godzinadodania: getCurrentTimestamp,
                                      zdjecie: true,
                                      dostarczone: false,
                                      dodatkoweinformacje: _model
                                          .dodatkoweinfozamoreczne2TextController
                                          .text,
                                      przyjete: false,
                                      miasto: '1',
                                      jaknaszybciej: false,
                                      nagodzine: true,
                                      godzinanagodzine: FFAppState().godzina,
                                      zdjecieplik: _model.uploadedFileUrl,
                                      przydzielonykurier: currentUserReference,
                                      jaknajszybciejkurier: false,
                                      kurierminuty: 0,
                                      nagodzinekurier: false,
                                      godzinanagodzinekurier: '0',
                                      odrzucone: false,
                                      datadzien: dateTimeFormat(
                                        "d/M/y",
                                        getCurrentTimestamp,
                                        locale: FFLocalizations.of(context)
                                            .languageCode,
                                      ),
                                      sprawdzonastrefa: false,
                                      dostepne:
                                          functions.add15secondtocurrenttime(
                                              getCurrentTimestamp),
                                      moznarobic: false,
                                    ));
                              } else {
                                await ZamowienieRecord.collection
                                    .doc()
                                    .set(createZamowienieRecordData(
                                      nrzamowienia: functions.numerzamowienia(),
                                      restauracja:
                                          currentUserDocument?.restauracja,
                                      godzinadodania: getCurrentTimestamp,
                                      zdjecie: true,
                                      dostarczone: false,
                                      dodatkoweinformacje: _model
                                          .dodatkoweinfozamoreczne2TextController
                                          .text,
                                      przyjete: false,
                                      miasto: '1',
                                      jaknaszybciej: false,
                                      restauraucjaminuty:
                                          FFAppState().tymczasowyczas,
                                      zdjecieplik: _model.uploadedFileUrl,
                                      przydzielonykurier: currentUserReference,
                                      nagodzine: false,
                                      godzinanagodzine: '0',
                                      jaknajszybciejkurier: false,
                                      kurierminuty: 0,
                                      nagodzinekurier: false,
                                      godzinanagodzinekurier: '0',
                                      odrzucone: false,
                                      datadzien: dateTimeFormat(
                                        "d/M/y",
                                        getCurrentTimestamp,
                                        locale: FFLocalizations.of(context)
                                            .languageCode,
                                      ),
                                      sprawdzonastrefa: false,
                                      dostepne:
                                          functions.add15secondtocurrenttime(
                                              getCurrentTimestamp),
                                      moznarobic: false,
                                    ));
                              }
                            }

                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: const Text(
                                  'Zamówienie dodane',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                duration: const Duration(milliseconds: 4000),
                                backgroundColor:
                                    FlutterFlowTheme.of(context).secondary,
                              ),
                            );
                            FFAppState().nagodzine = false;
                            FFAppState().godzina = '';
                            setState(() {});
                            _model.kurierzydobior2 = await queryUserRecordOnce(
                              queryBuilder: (userRecord) => userRecord
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
                                        currentUserDocument?.miasto, 0),
                                  ),
                            );

                            var powiadomieniaRecordReference =
                                PowiadomieniaRecord.collection.doc();
                            await powiadomieniaRecordReference
                                .set(createPowiadomieniaRecordData(
                              miasto: valueOrDefault(
                                  currentUserDocument?.miasto, 0),
                            ));
                            _model.kokol =
                                PowiadomieniaRecord.getDocumentFromData(
                                    createPowiadomieniaRecordData(
                                      miasto: valueOrDefault(
                                          currentUserDocument?.miasto, 0),
                                    ),
                                    powiadomieniaRecordReference);
                            triggerPushNotification(
                              notificationTitle:
                                  '${buttonRestauracjaRecord.nazwa} - Nowe zamówienie na giełdzie',
                              notificationText:
                                  'Nowe zamówienie, wejdź na giełde',
                              notificationSound: 'default',
                              userRefs: _model.kurierzydobior2!
                                  .map((e) => e.reference)
                                  .toList(),
                              initialPageName: 'GieldaZlecen',
                              parameterData: {},
                            );
                            Navigator.pop(context);
                            Navigator.pop(context);
                            Navigator.pop(context);
                            await actions.sendTelegramMessage(
                              'Nowe zamówienie! ${buttonRestauracjaRecord.nazwa}',
                            );
                          }

                          setState(() {});
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
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    setState(() {
                      _model.isDataUploading = false;
                      _model.uploadedLocalFile =
                          FFUploadedFile(bytes: Uint8List.fromList([]));
                      _model.uploadedFileUrl = '';
                    });

                    final selectedMedia =
                        await selectMediaWithSourceBottomSheet(
                      context: context,
                      maxHeight: 1000.00,
                      imageQuality: 30,
                      allowPhoto: true,
                    );
                    if (selectedMedia != null &&
                        selectedMedia.every((m) =>
                            validateFileFormat(m.storagePath, context))) {
                      setState(() => _model.isDataUploading = true);
                      var selectedUploadedFiles = <FFUploadedFile>[];

                      var downloadUrls = <String>[];
                      try {
                        selectedUploadedFiles = selectedMedia
                            .map((m) => FFUploadedFile(
                                  name: m.storagePath.split('/').last,
                                  bytes: m.bytes,
                                  height: m.dimensions?.height,
                                  width: m.dimensions?.width,
                                  blurHash: m.blurHash,
                                ))
                            .toList();

                        downloadUrls = (await Future.wait(
                          selectedMedia.map(
                            (m) async =>
                                await uploadData(m.storagePath, m.bytes),
                          ),
                        ))
                            .where((u) => u != null)
                            .map((u) => u!)
                            .toList();
                      } finally {
                        _model.isDataUploading = false;
                      }
                      if (selectedUploadedFiles.length ==
                              selectedMedia.length &&
                          downloadUrls.length == selectedMedia.length) {
                        setState(() {
                          _model.uploadedLocalFile =
                              selectedUploadedFiles.first;
                          _model.uploadedFileUrl = downloadUrls.first;
                        });
                      } else {
                        setState(() {});
                        return;
                      }
                    }

                    FFAppState().tymczasowozdjecieupload =
                        _model.uploadedFileUrl;
                    setState(() {});
                  },
                  text: 'Dodaj zdjęcie',
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
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                  child: SizedBox(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    child: TextFormField(
                      controller: _model.dodatkoweinfozamoreczne2TextController,
                      focusNode: _model.dodatkoweinfozamoreczne2FocusNode,
                      autofocus: true,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: 'Dodatkowe informacje...',
                        labelStyle:
                            FlutterFlowTheme.of(context).bodyMedium.override(
                                  fontFamily: 'Readex Pro',
                                  color: const Color(0xFFBCBCBC),
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w200,
                                ),
                        hintStyle:
                            FlutterFlowTheme.of(context).labelMedium.override(
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
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Readex Pro',
                            letterSpacing: 0.0,
                          ),
                      textAlign: TextAlign.center,
                      validator: _model
                          .dodatkoweinfozamoreczne2TextControllerValidator
                          .asValidator(context),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(-1.0, 0.0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                  child: Text(
                    '*pole niewymagane',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Readex Pro',
                          color: const Color(0xFFBCBCBC),
                          fontSize: 14.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w200,
                        ),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.sizeOf(context).width * 1.0,
                constraints: BoxConstraints(
                  minHeight: MediaQuery.sizeOf(context).height * 0.6,
                ),
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: Image.asset(
                      'assets/images/szybkieksport.png',
                    ).image,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      _model.uploadedFileUrl,
                      fit: BoxFit.scaleDown,
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
