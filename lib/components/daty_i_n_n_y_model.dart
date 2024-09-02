import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'daty_i_n_n_y_widget.dart' show DatyINNYWidget;
import 'package:flutter/material.dart';

class DatyINNYModel extends FlutterFlowModel<DatyINNYWidget> {
  ///  State fields for stateful widgets in this component.

  DateTime? datePicked1;
  DateTime? datePicked2;
  // State field(s) for wybierzrestauracjaeee1 widget.
  String? wybierzrestauracjaeee1Value;
  FormFieldController<String>? wybierzrestauracjaeee1ValueController;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<ZamowienieRecord>? danedozamowieniazakres;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  RestauracjaRecord? otput2;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<ZamowienieRecord>? danedozamowieniazakresRES;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
