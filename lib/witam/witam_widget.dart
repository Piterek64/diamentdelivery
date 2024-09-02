import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'witam_model.dart';
export 'witam_model.dart';

class WitamWidget extends StatefulWidget {
  const WitamWidget({super.key});

  @override
  State<WitamWidget> createState() => _WitamWidgetState();
}

class _WitamWidgetState extends State<WitamWidget> {
  late WitamModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WitamModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (valueOrDefault<bool>(currentUserDocument?.ban, false)) {
        context.goNamed('banned');
      } else {
        if (valueOrDefault<bool>(currentUserDocument?.kurier, false)) {
          await Future.delayed(const Duration(milliseconds: 3000));

          context.goNamed('Kurier');
        } else {
          if (valueOrDefault<bool>(
              currentUserDocument?.zbiorczywlasciciel, false)) {
            await Future.delayed(const Duration(milliseconds: 3000));

            context.pushNamed('zbiorczewlasicicle');
          } else {
            await Future.delayed(const Duration(milliseconds: 3000));

            context.goNamed('Restaura');
          }
        }

        FFAppState().startDate = getCurrentTimestamp;
        FFAppState().endDate = getCurrentTimestamp;
        FFAppState().tymDate = getCurrentTimestamp;
        FFAppState().update(() {});
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
        backgroundColor: const Color(0xFF7940FF),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                  child: Text(
                    'Witamy',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Readex Pro',
                          color: Colors.white,
                          fontSize: 35.0,
                          letterSpacing: 0.0,
                        ),
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: AuthUserStreamWidget(
                  builder: (context) => Text(
                    valueOrDefault(currentUserDocument?.imie, ''),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Readex Pro',
                          color: Colors.white,
                          fontSize: 35.0,
                          letterSpacing: 0.0,
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
