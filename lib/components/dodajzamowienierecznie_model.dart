import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dodajzamowienierecznie_widget.dart' show DodajzamowienierecznieWidget;
import 'package:flutter/material.dart';

class DodajzamowienierecznieModel
    extends FlutterFlowModel<DodajzamowienierecznieWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<UserRecord>? kurierzydobior;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  PowiadomieniaRecord? koko;
  // State field(s) for Adresdostawy3 widget.
  FocusNode? adresdostawy3FocusNode;
  TextEditingController? adresdostawy3TextController;
  String? Function(BuildContext, String?)? adresdostawy3TextControllerValidator;
  // State field(s) for dodatkoweinfozamoreczne widget.
  FocusNode? dodatkoweinfozamoreczneFocusNode;
  TextEditingController? dodatkoweinfozamoreczneTextController;
  String? Function(BuildContext, String?)?
      dodatkoweinfozamoreczneTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    adresdostawy3FocusNode?.dispose();
    adresdostawy3TextController?.dispose();

    dodatkoweinfozamoreczneFocusNode?.dispose();
    dodatkoweinfozamoreczneTextController?.dispose();
  }
}
