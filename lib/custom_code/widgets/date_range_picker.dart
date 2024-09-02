// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter_date_range_picker/flutter_date_range_picker.dart';

class DateRangePicker extends StatefulWidget {
  const DateRangePicker({
    Key? key,
    this.width,
    this.height,
    this.initialStartDate,
    this.initialEndDate,
    required this.updatePageUI,
    this.fontColor,
    this.backgroundColor,
    this.outlineColor,
    this.outlineWidth,
    this.pickerWidth,
    this.pickerHeight,
  }) : super(key: key);

  final double? width;
  final double? height;
  final DateTime? initialStartDate;
  final DateTime? initialEndDate;
  final Future Function() updatePageUI;
  final Color? fontColor;
  final Color? backgroundColor;
  final Color? outlineColor;
  final int? outlineWidth;
  final int? pickerWidth;
  final int? pickerHeight;

  @override
  _DateRangePickerState createState() => _DateRangePickerState();
}

class _DateRangePickerState extends State<DateRangePicker> {
  DateTimeRange? selectedDateRange; // Corrected type reference here

  @override
  void initState() {
    super.initState();
    if (widget.initialStartDate != null && widget.initialEndDate != null) {
      selectedDateRange = DateTimeRange(
          start: widget.initialStartDate!, end: widget.initialEndDate!);
    }
  }

  void showCustomDateRangePicker() async {
    final DateTimeRange? picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2020),
      lastDate: DateTime(2025),
      initialDateRange: selectedDateRange,
      builder: (context, child) {
        // Apply constraints to the date picker dialog
        return Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: widget.pickerWidth?.toDouble() ??
                  400.0, // Adjust the width as needed
              maxHeight: widget.pickerHeight?.toDouble() ??
                  MediaQuery.of(context).size.height *
                      0.8, // Optionally limit the height
            ),
            child: child!,
          ),
        );
      },
    );
    if (picked != null) {
      setState(() {
        selectedDateRange = picked;
        FFAppState().startDate = picked.start;
        FFAppState().endDate = picked.end;
        widget.updatePageUI();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width ?? double.infinity,
      height: widget.height ?? 50.0,
      child: ElevatedButton(
        onPressed: showCustomDateRangePicker,
        child: Padding(
          padding:
              const EdgeInsets.all(8.0), // Adjust the padding value as needed
          child: selectedDateRange != null
              ? Text(
                  '${DateFormat('yyyy-MM-dd').format(selectedDateRange!.start)} to ${DateFormat('yyyy-MM-dd').format(selectedDateRange!.end)}',
                  style: TextStyle(
                    color: widget.fontColor ??
                        FlutterFlowTheme.of(context).primaryText,
                  ),
                )
              : Text(
                  'Select Date Range',
                  style: TextStyle(
                    color: widget.fontColor ??
                        FlutterFlowTheme.of(context).primaryText,
                  ),
                ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: widget.backgroundColor ??
              FlutterFlowTheme.of(context).secondaryBackground,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
            side: BorderSide(
              color: widget.outlineColor ?? Colors.transparent,
              width: widget.outlineWidth?.toDouble() ?? 0,
            ),
          ),
        ),
      ),
    );
  }
}
