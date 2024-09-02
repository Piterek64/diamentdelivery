import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'daty_a_d_m_i_n_z_b_i_o_r_c_z_e_widget.dart'
    show DatyADMINZBIORCZEWidget;
import 'package:flutter/material.dart';

class DatyADMINZBIORCZEModel extends FlutterFlowModel<DatyADMINZBIORCZEWidget> {
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
