import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class LocalizationDatePicker extends StatefulWidget {
  @override
  LocalizationDatePickerState createState() => LocalizationDatePickerState();
}

class LocalizationDatePickerState extends State<LocalizationDatePicker> {
  final DateRangePickerController _controller = DateRangePickerController();

  @override
  Widget build(BuildContext context) {
    return Dialog(
        child: SizedBox(
      width: MediaQuery.of(context).size.width / 2,
      height: MediaQuery.of(context).size.height / 2,
      child: SfDateRangePicker(
        monthViewSettings: DateRangePickerMonthViewSettings(firstDayOfWeek: 1),
        controller: _controller,
        selectionMode: DateRangePickerSelectionMode.range,
        enablePastDates: false,
        showActionButtons: true,
        cancelText: 'INDIETRO',
        onSubmit: (currContext) => Navigator.pop(context),
        onCancel: () {
          Navigator.pop(context);
        },
      ),
    ));
  }
}
