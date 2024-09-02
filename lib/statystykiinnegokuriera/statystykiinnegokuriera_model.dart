import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'statystykiinnegokuriera_widget.dart' show StatystykiinnegokurieraWidget;
import 'package:flutter/material.dart';

class StatystykiinnegokurieraModel
    extends FlutterFlowModel<StatystykiinnegokurieraWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  DateTime? datePicked;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<ZamowienieRecord>? danedozamowien;
  // Stores action output result for [Bottom Sheet - Datypodgladadminkuriera] action in Button widget.
  List<DocumentReference>? returzamowienia;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
