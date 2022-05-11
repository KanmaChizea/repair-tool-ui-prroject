import 'package:capstone_project_practice/components/app_logo.dart';
import 'package:capstone_project_practice/components/form_field.dart';
import 'package:capstone_project_practice/components/login_button.dart';
import 'package:capstone_project_practice/components/social_media_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: ListView(children: [
      SizedBox(
          height: size.height / 3.5,
          child: Stack(children: [
            Positioned(
              top: 0,
              right: 0,
              child: ClipRect(
                child: Align(
                  alignment: Alignment.topLeft,
                  widthFactor: 0.5,
                  child: SvgPicture.asset(
                    'lib/assets/app_logo.svg',
                    height: size.height / 3.5,
                  ),
                ),
              ),
            ),
            Positioned(
                left: size.width / 2 - 61,
                bottom: 0,
                child: const AppLogo(color: Color(0xFF1F319D))),
          ])),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Login to your account',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            const SizedBox(height: 10),
            const CustomTextFormField(title: 'Email'),
            const SizedBox(height: 20),
            const CustomTextFormField(title: 'Password'),
            const SizedBox(height: 20),
            const LoginButton(label: 'Sign in'),
            const SizedBox(height: 30),
            const Center(child: Text('\u2022 Or sign in with -')),
            const SizedBox(height: 10),
            const SMIcons(),
            const SizedBox(height: 30),
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, '/signup'),
              child: const Center(
                  child: Text(
                "\u2022 Don't have an account? Sign up",
              )),
            ),
          ],
        ),
      )
    ]));
  }
}
