import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final String label;
  const LoginButton({
    Key? key,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      decoration: const BoxDecoration(boxShadow: [
        BoxShadow(
            offset: Offset(6, 4), blurRadius: 10, color: Color(0xFF1F319D))
      ]),
      child: ElevatedButton(
        onPressed: () => Navigator.pushReplacementNamed(context, '/home'),
        child: Text(
          label,
          style: Theme.of(context)
              .textTheme
              .bodyText1
              ?.copyWith(color: const Color(0xFFEEEDF3)),
        ),
        style: ElevatedButton.styleFrom(
            primary: const Color(0xFF1F319D),
            fixedSize: Size(width, 63),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
      ),
    );
  }
}
