import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'kurier_widget.dart' show KurierWidget;
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class KurierModel extends FlutterFlowModel<KurierWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in Kurier widget.
  int? gaga;
  AudioPlayer? soundPlayer;
  List<PowiadomieniaRecord>? iconPreviousSnapshot;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  List<ZamowienieRecord>? maczo;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
