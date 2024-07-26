import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:clario_auth_test_app/utils/all.dart';
import 'package:clario_auth_test_app/styles/colors.dart';

class _ValidationText extends StatelessWidget {
  const _ValidationText({super.key, required this.label, required this.color});

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      textAlign: TextAlign.start,
      style: GoogleFonts.inter(
          color: color, fontSize: 13, fontWeight: FontWeight.w400),
    );
  }
}

class PasswordValidation extends StatefulWidget {
  const PasswordValidation({super.key, required this.valueListenable});

  final ValueListenable<String> valueListenable;

  @override
  State<StatefulWidget> createState() {
    return _PasswordValidationState();
  }
}

class _PasswordValidationState extends State<PasswordValidation> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: widget.valueListenable,
        builder: (BuildContext context, String value, Widget? chid) {
          List<Color> colors = [];
          List<Widget> childrens = [];

          final texts = <String>[
            '8 characters or more (no spaces)',
            'Uppercase and lowercase letters',
            'At least one digit'
          ];

          colors = value == ''
              ? List<Color>.generate(3, (i) => AppColors.primary).toList()
              : [
                  value.isValidPasswordLength()
                      ? AppColors.green
                      : AppColors.red,
                  value.hasLowercaseAndUppercase()
                      ? AppColors.green
                      : AppColors.red,
                  value.hasDigit() ? AppColors.green : AppColors.red
                ];

          childrens = texts.map((element) {
            var index = texts.indexOf(element);
            var color = colors[index];

            return _ValidationText(label: element, color: color);
          }).toList();

          return Flex(
            direction: Axis.vertical,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: childrens,
          );
        });
  }
}
