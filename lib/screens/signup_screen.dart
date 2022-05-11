import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../components/app_logo.dart';
import '../components/form_field.dart';
import '../components/login_button.dart';
import '../components/social_media_icons.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(
              height: height / 3.5,
              child: Stack(children: [
                Positioned(
                  top: 0,
                  left: 0,
                  child: ClipRect(
                    child: Align(
                      alignment: Alignment.topRight,
                      widthFactor: 0.5,
                      child: SvgPicture.asset(
                        'lib/assets/app_logo.svg',
                        height: height / 3.5,
                      ),
                    ),
                  ),
                ),
                Positioned(
                    left: width / 2 - 61,
                    bottom: 0,
                    child: const AppLogo(color: Color(0xFF1F319D))),
              ])),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Create new account',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    const SizedBox(height: 10),
                    const CustomTextFormField(title: 'Email'),
                    const SizedBox(height: 20),
                    const CustomTextFormField(title: 'Password'),
                    const SizedBox(height: 20),
                    const CustomTextFormField(title: 'Confirm password'),
                    const SizedBox(height: 20),
                    const LoginButton(label: 'Sign up'),
                    const SizedBox(height: 30),
                    const Center(child: Text('\u2022 Or sign up with -')),
                    const SizedBox(height: 10),
                    const SMIcons(),
                    const SizedBox(height: 30),
                  ]))
        ],
      ),
    );
  }
}
