import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'powiadomienie_model.dart';
export 'powiadomienie_model.dart';

class PowiadomienieWidget extends StatefulWidget {
  const PowiadomienieWidget({super.key});

  @override
  State<PowiadomienieWidget> createState() => _PowiadomienieWidgetState();
}

class _PowiadomienieWidgetState extends State<PowiadomienieWidget> {
  late PowiadomienieModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PowiadomienieModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
