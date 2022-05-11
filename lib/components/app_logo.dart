import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppLogo extends StatelessWidget {
  final Color color;
  const AppLogo({
    Key? key,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          'lib/assets/app_logo.svg',
          color: color,
        ),
        Text(
          'REPAIR HOME',
          style: Theme.of(context).textTheme.headline1?.copyWith(color: color),
        )
      ],
    ));
  }
}
