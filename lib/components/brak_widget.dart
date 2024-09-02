import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'brak_model.dart';
export 'brak_model.dart';

class BrakWidget extends StatefulWidget {
  const BrakWidget({super.key});

  @override
  State<BrakWidget> createState() => _BrakWidgetState();
}

class _BrakWidgetState extends State<BrakWidget> {
  late BrakModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BrakModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(0.0, 0.0),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 50.0),
        child: Text(
          'Brak zdjęcia',
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: 'Readex Pro',
                color: const Color(0x98CACBD2),
                fontSize: 40.0,
                letterSpacing: 0.0,
                fontWeight: FontWeight.w200,
              ),
        ),
      ),
    );
  }
}
