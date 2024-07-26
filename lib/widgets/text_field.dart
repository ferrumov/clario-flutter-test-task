import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:clario_auth_test_app/utils/all.dart';

class FormTextField extends StatefulWidget {
  const FormTextField(
      {super.key,
      this.validator,
      this.onChanged,
      this.disableSpaces = false,
      required this.hintText,
      required this.keyboardType,
      required this.enabledBorder});

  final String hintText;
  final bool? disableSpaces;
  final InputBorder enabledBorder;
  final TextInputType keyboardType;
  final void Function(String?)? onChanged;
  final String? Function(String?)? validator;

  @override
  State<StatefulWidget> createState() {
    return _FormTextFieldState();
  }
}

class _FormTextFieldState extends State<FormTextField> {
  bool passwordVisible = false;

  final TextStyle _hintStyle = const TextStyle(
      fontFamily: 'Inter',
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: Color.fromRGBO(111, 145, 188, 1));

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: TextFormField(
            autocorrect: false,
            onChanged: widget.onChanged,
            validator: widget.validator,
            obscureText: widget.keyboardType == TextInputType.visiblePassword
                ? !passwordVisible
                : false,
            keyboardType: widget.keyboardType,
            autovalidateMode: AutovalidateMode.disabled,
            inputFormatters: [
              if (widget.disableSpaces == true)
                TextInputFormatter.withFunction(
                    (TextEditingValue oldValue, TextEditingValue newValue) {
                  return RegExp(r'\s').hasMatch(newValue.text)
                      ? oldValue
                      : newValue;
                })
            ],
            decoration: InputDecoration(
                filled: true,
                isDense: true,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                errorMaxLines: 1,
                errorStyle: const TextStyle(
                  color: Colors.transparent,
                  fontSize: 0,
                ),
                hintStyle: _hintStyle,
                fillColor: Colors.white,
                hintText: widget.hintText,
                errorBorder: InputBorderType.error,
                enabledBorder: widget.enabledBorder,
                focusedBorder: InputBorderType.focused,
                focusedErrorBorder: InputBorderType.error,
                suffixIcon: widget.keyboardType == TextInputType.visiblePassword
                    ? IconButton(
                        icon: Icon(
                          passwordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            passwordVisible = !passwordVisible;
                          });
                        },
                      )
                    : const IconButton(
                        icon: Icon(
                          Icons.abc,
                          color: Colors.transparent,
                        ),
                        onPressed: null,
                      ))));
  }
}
