import 'package:auttu_test/providers/acitvity_info_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class EditTextField extends HookWidget {
  const EditTextField({
    Key? key,
    required this.label,
    required this.hintText,
    this.hintBottomText,
  }) : super(key: key);

  final String label;
  final String hintText;
  final String? hintBottomText;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        TextFormField(
          onChanged: (value) {
            ///only activityType hold hint 😎
            hintBottomText == null
                ? context.read(activityName).state = value
                : context.read(activityType).state = value;
          },
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: GoogleFonts.montserrat(
              fontWeight: FontWeight.w500,
              fontSize: 20,
              letterSpacing: 1.37,
              color: Colors.black.withOpacity(.32),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.amber,
                width: 2,
              ),
            ),
            border: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.red,
                width: 2,
              ),
            ),
          ),
          maxLength: 12,
        ),
        if (hintBottomText != null)
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
            ),
            child: Text(
              hintBottomText ?? "",
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
