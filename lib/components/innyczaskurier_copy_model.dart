import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'innyczaskurier_copy_widget.dart' show InnyczaskurierCopyWidget;
import 'package:flutter/material.dart';

class InnyczaskurierCopyModel
    extends FlutterFlowModel<InnyczaskurierCopyWidget> {
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
