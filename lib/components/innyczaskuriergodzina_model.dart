import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'innyczaskuriergodzina_widget.dart' show InnyczaskuriergodzinaWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class InnyczaskuriergodzinaModel
    extends FlutterFlowModel<InnyczaskuriergodzinaWidget> {
  ///  State fields for stateful widgets in this component.

  ZamowienieRecord? bottomSheetEditPreviousSnapshot;
  // State field(s) for innyczasgodzinakurier widget.
  FocusNode? innyczasgodzinakurierFocusNode;
  TextEditingController? innyczasgodzinakurierTextController;
  final innyczasgodzinakurierMask = MaskTextInputFormatter(mask: '##:##');
  String? Function(BuildContext, String?)?
      innyczasgodzinakurierTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    innyczasgodzinakurierFocusNode?.dispose();
    innyczasgodzinakurierTextController?.dispose();
  }
}
