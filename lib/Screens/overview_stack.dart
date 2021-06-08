import 'package:auttu_test/components/date_format.dart';
import 'package:auttu_test/providers/acitvity_info_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OverViewScreen extends StatelessWidget {
  final textStyle = GoogleFonts.montserrat(
    fontWeight: FontWeight.w500,
    fontSize: 20,
    letterSpacing: 1.37,
    color: Colors.black.withOpacity(.32),
  );
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Activity Name: ${context.read(activityName).state}",
            style: textStyle,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Type: ${context.read(activityType).state}",
            style: textStyle,
            maxLines: 12,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Start date: ${customDateFormat(context.read(activityStartDate).state)}",
            style: textStyle,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "End date: ${customDateFormat(context.read(activityEndDate).state)}",
            style: textStyle,
          ),
        ],
      ),
    );
  }
}
