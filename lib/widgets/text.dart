import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:clario_auth_test_app/styles/colors.dart';

class Heading1 extends StatelessWidget {
  final String text;

  const Heading1({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: GoogleFonts.inter(
            fontSize: 28,
            fontWeight: FontWeight.w700,
            color: AppColors.primary));
  }
}
