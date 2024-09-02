import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dodajrestauracje_widget.dart' show DodajrestauracjeWidget;
import 'package:flutter/material.dart';

class DodajrestauracjeModel extends FlutterFlowModel<DodajrestauracjeWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  RestauracjaRecord? maka;
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
