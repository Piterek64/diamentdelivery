import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'restaura_widget.dart' show RestauraWidget;
import 'package:flutter/material.dart';

class RestauraModel extends FlutterFlowModel<RestauraWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  List<ZamowienieRecord>? maczo;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
