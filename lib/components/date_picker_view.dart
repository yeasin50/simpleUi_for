import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DatePickerTextField extends StatefulWidget {
  DatePickerTextField({
    Key? key,
    required this.label,
    required this.hintText,
    this.hintBottomText,
  }) : super(key: key);

  final String label;
  final String hintText;
  final String? hintBottomText;

  @override
  _DatePickerTextFieldState createState() => _DatePickerTextFieldState();
}

class _DatePickerTextFieldState extends State<DatePickerTextField> {
  final _isError = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        Container(
          height: 40,
          alignment: Alignment.centerLeft,
          child: Text(
            widget.hintText,
            style: GoogleFonts.montserrat(
                fontWeight: FontWeight.w500,
                fontSize: 20,
                letterSpacing: 1.37,
                color: Colors.black.withOpacity(.32)),
          ),
        ),
        Divider(
          thickness: 1,
          color: _isError ? Colors.red : const Color(0xffC4C4C4),
        ),
        if (widget.hintBottomText != null)
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
            ),
            child: Text(
              widget.hintBottomText ?? "",
              style: GoogleFonts.sourceSerifPro(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                letterSpacing: .41,
                color: Colors.black.withOpacity(.46),
              ),
            ),
          ),
      ],
    );
  }
}
