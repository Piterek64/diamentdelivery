import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'kreatorkonta_widget.dart' show KreatorkontaWidget;
import 'package:flutter/material.dart';

class KreatorkontaModel extends FlutterFlowModel<KreatorkontaWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode;
  TextEditingController? emailAddressTextController;
  String? Function(BuildContext, String?)? emailAddressTextControllerValidator;
  // State field(s) for password widget.
  FocusNode? passwordFocusNode;
  TextEditingController? passwordTextController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordTextControllerValidator;
  // State field(s) for passwordConfirm widget.
  FocusNode? passwordConfirmFocusNode;
  TextEditingController? passwordConfirmTextController;
  late bool passwordConfirmVisibility;
  String? Function(BuildContext, String?)?
      passwordConfirmTextControllerValidator;
  // State field(s) for imie widget.
  FocusNode? imieFocusNode;
  TextEditingController? imieTextController;
  String? Function(BuildContext, String?)? imieTextControllerValidator;
  // State field(s) for nazwisko widget.
  FocusNode? nazwiskoFocusNode;
  TextEditingController? nazwiskoTextController;
  String? Function(BuildContext, String?)? nazwiskoTextControllerValidator;
  // State field(s) for numertelefonu widget.
  FocusNode? numertelefonuFocusNode;
  TextEditingController? numertelefonuTextController;
  String? Function(BuildContext, String?)? numertelefonuTextControllerValidator;
  // State field(s) for miasto widget.
  FocusNode? miastoFocusNode;
  TextEditingController? miastoTextController;
  String? Function(BuildContext, String?)? miastoTextControllerValidator;
  // State field(s) for jesliadmin widget.
  bool? jesliadminValue;
  // State field(s) for jeslikurier widget.
  bool? jeslikurierValue;
  // State field(s) for jesliresuataotr widget.
  bool? jesliresuataotrValue;
  // State field(s) for jeslirpacownik widget.
  bool? jeslirpacownikValue;
  // State field(s) for wybierzrestauracja widget.
  String? wybierzrestauracjaValue;
  FormFieldController<String>? wybierzrestauracjaValueController;

  @override
  void initState(BuildContext context) {
    passwordVisibility = false;
    passwordConfirmVisibility = false;
  }

  @override
  void dispose() {
    emailAddressFocusNode?.dispose();
    emailAddressTextController?.dispose();

    passwordFocusNode?.dispose();
    passwordTextController?.dispose();

    passwordConfirmFocusNode?.dispose();
    passwordConfirmTextController?.dispose();

    imieFocusNode?.dispose();
    imieTextController?.dispose();

    nazwiskoFocusNode?.dispose();
    nazwiskoTextController?.dispose();

    numertelefonuFocusNode?.dispose();
    numertelefonuTextController?.dispose();

    miastoFocusNode?.dispose();
    miastoTextController?.dispose();
  }
}
