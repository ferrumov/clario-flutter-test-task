import 'package:flutter/material.dart';

import 'package:clario_auth_test_app/widgets/all.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        title: 'Auth Test App',
        home: Scaffold(
          body: Stack(
            children: [
              StarsBackground(),
              SafeArea(
                child: Padding(
                  padding: EdgeInsets.only(top: 90, left: 30, right: 30),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                          padding: EdgeInsets.only(bottom: 40),
                          child: Heading1(text: 'Sign up')),
                      SignUpForm()
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
