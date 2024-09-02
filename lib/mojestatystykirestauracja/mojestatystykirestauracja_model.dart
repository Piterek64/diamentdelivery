import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'mojestatystykirestauracja_widget.dart'
    show MojestatystykirestauracjaWidget;
import 'package:flutter/material.dart';

class MojestatystykirestauracjaModel
    extends FlutterFlowModel<MojestatystykirestauracjaWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  DateTime? datePicked;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<ZamowienieRecord>? danedozamowien;
  // Stores action output result for [Bottom Sheet - Datyresta] action in Button widget.
  List<DocumentReference>? returzamowienia;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
