import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'innyczaskurier_widget.dart' show InnyczaskurierWidget;
import 'package:flutter/material.dart';

class InnyczaskurierModel extends FlutterFlowModel<InnyczaskurierWidget> {
  ///  State fields for stateful widgets in this component.

  ZamowienieRecord? bottomSheetEditPreviousSnapshot;
  // State field(s) for innyczaswminutachkurier widget.
  FocusNode? innyczaswminutachkurierFocusNode;
  TextEditingController? innyczaswminutachkurierTextController;
  String? Function(BuildContext, String?)?
      innyczaswminutachkurierTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    innyczaswminutachkurierFocusNode?.dispose();
    innyczaswminutachkurierTextController?.dispose();
  }
}
