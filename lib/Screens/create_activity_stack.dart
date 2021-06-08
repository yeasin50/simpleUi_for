import 'package:auttu_test/providers/acitvity_info_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SecondScreenWidgets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Active name",
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                onChanged: (value) {
                  ///only activityType hold hint 😎
                  context.read(activityName).state = value;
                },
                decoration: InputDecoration(
                  hintText: "Ex: Cooking Class",
                  hintStyle: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    letterSpacing: 1.37,
                    color: Colors.black.withOpacity(.32),
                  ),
                ),
                validator: (value) {
                  if (value!.length > 120)
                    return "";
                  else
                    return null;
                },
                maxLength: 120,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                ),
                child: Text(
                  "*Name should be max 120 characters",
                  style: GoogleFonts.sourceSerifPro(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    letterSpacing: .41,
                    color: Colors.black.withOpacity(.46),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: constraints.maxHeight * .1,
          ),
          Text(
            "Activity Type",
            style: GoogleFonts.montserrat(
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
          ),
          TextFormField(
            onChanged: (value) {
              ///only activityType hold hint 😎

              context.read(activityType).state = value;
            },
            decoration: InputDecoration(
              hintText: "Ex: Cooking Class",
              hintStyle: GoogleFonts.montserrat(
                fontWeight: FontWeight.w500,
                fontSize: 20,
                letterSpacing: 1.37,
                color: Colors.black.withOpacity(.32),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
