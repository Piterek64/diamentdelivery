import '/flutter_flow/flutter_flow_util.dart';
import 'edytujdane_widget.dart' show EdytujdaneWidget;
import 'package:flutter/material.dart';

class EdytujdaneModel extends FlutterFlowModel<EdytujdaneWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for nazwazmiana widget.
  FocusNode? nazwazmianaFocusNode;
  TextEditingController? nazwazmianaTextController;
  String? Function(BuildContext, String?)? nazwazmianaTextControllerValidator;
  // State field(s) for adreszmiana widget.
  FocusNode? adreszmianaFocusNode;
  TextEditingController? adreszmianaTextController;
  String? Function(BuildContext, String?)? adreszmianaTextControllerValidator;
  // State field(s) for numertelzmiana widget.
  FocusNode? numertelzmianaFocusNode;
  TextEditingController? numertelzmianaTextController;
  String? Function(BuildContext, String?)?
      numertelzmianaTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    nazwazmianaFocusNode?.dispose();
    nazwazmianaTextController?.dispose();

    adreszmianaFocusNode?.dispose();
    adreszmianaTextController?.dispose();

    numertelzmianaFocusNode?.dispose();
    numertelzmianaTextController?.dispose();
  }
}
