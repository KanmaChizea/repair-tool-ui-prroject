import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SMIcons extends StatelessWidget {
  const SMIcons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        buildIconContainer(icon: 'lib/assets/google_icon.svg'),
        buildIconContainer(icon: 'lib/assets/fb_icon.svg'),
        buildIconContainer(icon: 'lib/assets/twitter_icon.svg'),
      ],
    );
  }

  Container buildIconContainer({required String icon}) {
    return Container(
        height: 50,
        width: 100,
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: const BoxDecoration(
            color: Color(0xFFFFFEFE),
            borderRadius: BorderRadius.all(Radius.circular(10)),
            boxShadow: [
              BoxShadow(
                  blurRadius: 15, color: Color.fromRGBO(211, 211, 211, 0.25)),
            ]),
        child: SvgPicture.asset(
          icon,
          fit: BoxFit.fitHeight,
        ));
  }
}
