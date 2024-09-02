import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dodajzamowieniezdjecie_widget.dart' show DodajzamowieniezdjecieWidget;
import 'package:flutter/material.dart';

class DodajzamowieniezdjecieModel
    extends FlutterFlowModel<DodajzamowieniezdjecieWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<UserRecord>? kurierzydobior2;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  PowiadomieniaRecord? kokol;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for dodatkoweinfozamoreczne2 widget.
  FocusNode? dodatkoweinfozamoreczne2FocusNode;
  TextEditingController? dodatkoweinfozamoreczne2TextController;
  String? Function(BuildContext, String?)?
      dodatkoweinfozamoreczne2TextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    dodatkoweinfozamoreczne2FocusNode?.dispose();
    dodatkoweinfozamoreczne2TextController?.dispose();
  }
}
