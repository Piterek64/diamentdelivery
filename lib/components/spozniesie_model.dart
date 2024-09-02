import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'spozniesie_widget.dart' show SpozniesieWidget;
import 'package:flutter/material.dart';

class SpozniesieModel extends FlutterFlowModel<SpozniesieWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<UserRecord>? dokogorestauraca;
  // State field(s) for czasspoznienia widget.
  FocusNode? czasspoznieniaFocusNode;
  TextEditingController? czasspoznieniaTextController;
  String? Function(BuildContext, String?)?
      czasspoznieniaTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    czasspoznieniaFocusNode?.dispose();
    czasspoznieniaTextController?.dispose();
  }
}
