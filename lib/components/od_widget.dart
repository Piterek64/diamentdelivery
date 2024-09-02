import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'od_model.dart';
export 'od_model.dart';

class OdWidget extends StatefulWidget {
  const OdWidget({
    super.key,
    required this.grafikpozycja,
  });

  final DocumentReference? grafikpozycja;

  @override
  State<OdWidget> createState() => _OdWidgetState();
}

class _OdWidgetState extends State<OdWidget> {
  late OdModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OdModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        StreamBuilder<GrafikRecord>(
          stream: GrafikRecord.getDocument(widget.grafikpozycja!),
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

            final checkboxGrafikRecord = snapshot.data!;

            return Theme(
              data: ThemeData(
                checkboxTheme: CheckboxThemeData(
                  visualDensity: VisualDensity.compact,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                ),
                unselectedWidgetColor:
                    FlutterFlowTheme.of(context).secondaryBackground,
              ),
              child: Checkbox(
                value: _model.checkboxValue ??= !(checkboxGrafikRecord
                        .oddwunastejusers
                        .contains(currentUserReference)
                    ? false
                    : true),
                onChanged: (newValue) async {
                  setState(() => _model.checkboxValue = newValue!);
                  if (newValue!) {
                    await widget.grafikpozycja!.update({
                      ...mapToFirestore(
                        {
                          'oddwunastejusers':
                              FieldValue.arrayUnion([currentUserReference]),
                        },
                      ),
                    });
                  } else {
                    await widget.grafikpozycja!.update({
                      ...mapToFirestore(
                        {
                          'oddwunastejusers':
                              FieldValue.arrayRemove([currentUserReference]),
                        },
                      ),
                    });
                  }
                },
                side: BorderSide(
                  width: 2,
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                activeColor: FlutterFlowTheme.of(context).secondary,
                checkColor: FlutterFlowTheme.of(context).info,
              ),
            );
          },
        ),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
          child: Text(
            'Od godziny 11:00',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Outfit',
                  color: Colors.white,
                  fontSize: 18.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w300,
                ),
          ),
        ),
      ],
    );
  }
}
