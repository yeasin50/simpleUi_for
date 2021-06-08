import 'package:auttu_test/components/date_format.dart';
import 'package:auttu_test/components/date_picker_view.dart';
import 'package:auttu_test/providers/acitvity_info_provider.dart';
import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

class ThiredScreenWidgets extends StatefulWidget {
  const ThiredScreenWidgets({
    Key? key,
  }) : super(key: key);

  @override
  _ThiredScreenWidgetsState createState() => _ThiredScreenWidgetsState();
}

class _ThiredScreenWidgetsState extends State<ThiredScreenWidgets> {
  DateTime selectedDate = DateTime.now();

  DateTime startDay = DateTime.now();
  DateTime endDay = DateTime.now().add(Duration(days: 7));

  Future<void> _selectDate(BuildContext context, bool startDate) async {
    final picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));

    if (picked != null && picked != selectedDate) {
      setState(() {
        if (startDate) {
          startDay = picked;
          context.read(activityStartDate).state = picked;
        } else {
          endDay = picked;
          context.read(activityEndDate).state = picked;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () => _selectDate(context, true),
            child: DatePickerTextField(
              hintText: "${customDateFormat(startDay)}",
              label: 'Start date',
            ),
          ),
          SizedBox(
            height: constraints.maxHeight * .1,
          ),
          InkWell(
            onTap: () => _selectDate(context, false),
            child: DatePickerTextField(
              hintText: customDateFormat(endDay),
              label: 'End date',
              hintBottomText: "*End Date should be greater than Start Date",
            ),
          ),
        ],
      ),
    );
  }
}
