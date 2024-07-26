import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StarsBackground extends StatelessWidget {
  const StarsBackground({super.key});

  static const colors = [
    Color.fromRGBO(244, 249, 255, 1),
    Color.fromRGBO(224, 237, 251, 1)
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: ConstrainedBox(
        constraints: BoxConstraints(
            minWidth: MediaQuery.of(context).size.width,
            minHeight: MediaQuery.of(context).size.height),
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: colors,
            ),
          ),
          child: Center(
            child: SvgPicture.asset(
              'assets/icons/stars-bg.svg',
            ),
          ),
        ),
      ),
    );
  }
}
