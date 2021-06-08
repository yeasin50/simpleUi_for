import 'package:auttu_test/providers/dot_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

class MyAppBar extends StatelessWidget {
  final String title;
  final IconData data;

  const MyAppBar({
    Key? key,
    required this.title,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 4),
          InkWell(
            onTap: () {
              final _currentIndex = context.read(currentIndexProvider).state;

              if (_currentIndex == 0)
                Navigator.of(context).pop();
              else
                context.read(currentIndexProvider).state -= 1;
            },
            child: Icon(
              data,
              color: Colors.black,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            title,
            style: GoogleFonts.montserrat(
              fontWeight: FontWeight.w500,
              fontSize: 32,
              letterSpacing: 1.37,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
