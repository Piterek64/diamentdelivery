import '/flutter_flow/flutter_flow_util.dart';
import 'dodajstrefe_widget.dart' show DodajstrefeWidget;
import 'package:flutter/material.dart';

class DodajstrefeModel extends FlutterFlowModel<DodajstrefeWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for numer widget.
  FocusNode? numerFocusNode;
  TextEditingController? numerTextController;
  String? Function(BuildContext, String?)? numerTextControllerValidator;
  // State field(s) for cena widget.
  FocusNode? cenaFocusNode;
  TextEditingController? cenaTextController;
  String? Function(BuildContext, String?)? cenaTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    numerFocusNode?.dispose();
    numerTextController?.dispose();

    cenaFocusNode?.dispose();
    cenaTextController?.dispose();
  }
}
