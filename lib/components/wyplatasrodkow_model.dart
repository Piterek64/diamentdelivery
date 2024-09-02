import '/flutter_flow/flutter_flow_util.dart';
import 'wyplatasrodkow_widget.dart' show WyplatasrodkowWidget;
import 'package:flutter/material.dart';

class WyplatasrodkowModel extends FlutterFlowModel<WyplatasrodkowWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for kwotawp widget.
  FocusNode? kwotawpFocusNode;
  TextEditingController? kwotawpTextController;
  String? Function(BuildContext, String?)? kwotawpTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    kwotawpFocusNode?.dispose();
    kwotawpTextController?.dispose();
  }
}
