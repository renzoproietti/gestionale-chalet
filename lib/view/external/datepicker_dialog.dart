import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class CustomDatePicker extends StatefulWidget {
  @override
  CustomDatePickerState createState() => CustomDatePickerState();

  of(BuildContext context) =>
      context.findAncestorStateOfType<CustomDatePickerState>();
}

class CustomDatePickerState extends State<CustomDatePicker> {
  final DateRangePickerController _controller = DateRangePickerController();

  @override
  Widget build(BuildContext context) {
    return Dialog(
        child: SizedBox(
      width: MediaQuery.of(context).size.width / 1.25,
      height: MediaQuery.of(context).size.height / 2.5,
      child: SfDateRangePicker(
        monthViewSettings: const DateRangePickerMonthViewSettings(firstDayOfWeek: 1),
        controller: _controller,
        selectionMode: DateRangePickerSelectionMode.range,
        enablePastDates: false,
        showActionButtons: true,
        cancelText: 'INDIETRO',
        onSubmit: (currContext) {
          Navigator.pop(context);
        },
        onCancel: () {
          Navigator.pop(context);
        },
      ),
    ));
  }
}
