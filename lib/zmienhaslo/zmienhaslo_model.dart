import '/flutter_flow/flutter_flow_util.dart';
import 'zmienhaslo_widget.dart' show ZmienhasloWidget;
import 'package:flutter/material.dart';

class ZmienhasloModel extends FlutterFlowModel<ZmienhasloWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for stare widget.
  FocusNode? stareFocusNode;
  TextEditingController? stareTextController;
  String? Function(BuildContext, String?)? stareTextControllerValidator;
  // State field(s) for password widget.
  FocusNode? passwordFocusNode;
  TextEditingController? passwordTextController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordTextControllerValidator;

  @override
  void initState(BuildContext context) {
    passwordVisibility = false;
  }

  @override
  void dispose() {
    stareFocusNode?.dispose();
    stareTextController?.dispose();

    passwordFocusNode?.dispose();
    passwordTextController?.dispose();
  }
}
