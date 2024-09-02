import '/flutter_flow/flutter_flow_util.dart';
import 'innyczasrestauracjagodzina_widget.dart'
    show InnyczasrestauracjagodzinaWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class InnyczasrestauracjagodzinaModel
    extends FlutterFlowModel<InnyczasrestauracjagodzinaWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for innyczasgodzina widget.
  FocusNode? innyczasgodzinaFocusNode;
  TextEditingController? innyczasgodzinaTextController;
  final innyczasgodzinaMask = MaskTextInputFormatter(mask: '##:##');
  String? Function(BuildContext, String?)?
      innyczasgodzinaTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    innyczasgodzinaFocusNode?.dispose();
    innyczasgodzinaTextController?.dispose();
  }
}
