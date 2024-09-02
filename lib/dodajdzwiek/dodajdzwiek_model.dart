import '/flutter_flow/flutter_flow_util.dart';
import 'dodajdzwiek_widget.dart' show DodajdzwiekWidget;
import 'package:flutter/material.dart';

class DodajdzwiekModel extends FlutterFlowModel<DodajdzwiekWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for TextFielddzwiek widget.
  FocusNode? textFielddzwiekFocusNode;
  TextEditingController? textFielddzwiekTextController;
  String? Function(BuildContext, String?)?
      textFielddzwiekTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFielddzwiekFocusNode?.dispose();
    textFielddzwiekTextController?.dispose();
  }
}
