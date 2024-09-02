import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'brak_copy_model.dart';
export 'brak_copy_model.dart';

class BrakCopyWidget extends StatefulWidget {
  const BrakCopyWidget({super.key});

  @override
  State<BrakCopyWidget> createState() => _BrakCopyWidgetState();
}

class _BrakCopyWidgetState extends State<BrakCopyWidget> {
  late BrakCopyModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BrakCopyModel());
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
          'Brak',
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
