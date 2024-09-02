import '/flutter_flow/flutter_flow_util.dart';
import 'menedzerwyzwan_widget.dart' show MenedzerwyzwanWidget;
import 'package:flutter/material.dart';

class MenedzerwyzwanModel extends FlutterFlowModel<MenedzerwyzwanWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  DateTime? datePicked1;
  DateTime? datePicked2;
  // State field(s) for numer888 widget.
  FocusNode? numer888FocusNode;
  TextEditingController? numer888TextController;
  String? Function(BuildContext, String?)? numer888TextControllerValidator;
  // State field(s) for cena2 widget.
  FocusNode? cena2FocusNode;
  TextEditingController? cena2TextController;
  String? Function(BuildContext, String?)? cena2TextControllerValidator;
  DateTime? datePicked3;
  DateTime? datePicked4;
  // State field(s) for numerpip widget.
  FocusNode? numerpipFocusNode;
  TextEditingController? numerpipTextController;
  String? Function(BuildContext, String?)? numerpipTextControllerValidator;
  // State field(s) for cenapip widget.
  FocusNode? cenapipFocusNode;
  TextEditingController? cenapipTextController;
  String? Function(BuildContext, String?)? cenapipTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    numer888FocusNode?.dispose();
    numer888TextController?.dispose();

    cena2FocusNode?.dispose();
    cena2TextController?.dispose();

    numerpipFocusNode?.dispose();
    numerpipTextController?.dispose();

    cenapipFocusNode?.dispose();
    cenapipTextController?.dispose();
  }
}
