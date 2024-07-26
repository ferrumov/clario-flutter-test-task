import 'package:flutter/material.dart';

import 'package:clario_auth_test_app/utils/all.dart';
import 'package:clario_auth_test_app/widgets/text_field.dart';
import 'package:clario_auth_test_app/widgets/action_button.dart';
import 'package:clario_auth_test_app/widgets/password_validation.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SignUpFormState();
  }
}

class _SignUpFormState extends State<SignUpForm> {
  var isSubmitted = false;

  final _formKey = GlobalKey<FormState>();
  final ValueNotifier<String> _password = ValueNotifier<String>('');

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.disabled,
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: FormTextField(
                hintText: 'Email',
                validator: Validator.validateEmail,
                keyboardType: TextInputType.emailAddress,
                enabledBorder: isSubmitted
                    ? InputBorderType.success
                    : InputBorderType.enabled,
                onChanged: (value) {
                  setState(() {
                    isSubmitted = false;
                  });
                },
              )),
          Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: FormTextField(
                disableSpaces: true,
                hintText: 'Create your password',
                validator: Validator.validatePassword,
                keyboardType: TextInputType.visiblePassword,
                enabledBorder: isSubmitted
                    ? InputBorderType.success
                    : InputBorderType.enabled,
                onChanged: (value) {
                  _password.value = value ?? '';
                  setState(() {
                    isSubmitted = false;
                  });
                },
              )),
          Padding(
            padding: const EdgeInsets.only(bottom: 40, left: 20, right: 20),
            child: PasswordValidation(
              valueListenable: _password,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 37.5),
            child: ActionButton(
              text: 'Sign up',
              onPressed: () {
                FocusScope.of(context).unfocus();
                if (_formKey.currentState!.validate()) {
                  setState(() {
                    isSubmitted = true;
                  });
                  ScaffoldMessenger.of(context)
                      .showSnackBar(const SnackBar(content: Text('Success')));
                }
              },
            ),
          )
        ]));
  }
}
