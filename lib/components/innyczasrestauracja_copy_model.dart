import '/flutter_flow/flutter_flow_util.dart';
import 'innyczasrestauracja_copy_widget.dart'
    show InnyczasrestauracjaCopyWidget;
import 'package:flutter/material.dart';

class InnyczasrestauracjaCopyModel
    extends FlutterFlowModel<InnyczasrestauracjaCopyWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for innyczaswminutachresaturacja widget.
  FocusNode? innyczaswminutachresaturacjaFocusNode;
  TextEditingController? innyczaswminutachresaturacjaTextController;
  String? Function(BuildContext, String?)?
      innyczaswminutachresaturacjaTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    innyczaswminutachresaturacjaFocusNode?.dispose();
    innyczaswminutachresaturacjaTextController?.dispose();
  }
}
