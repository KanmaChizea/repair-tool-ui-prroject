import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String title;
  const CustomTextFormField({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Color(0xFFFFFEFE),
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
                offset: Offset(6, 4),
                blurRadius: 10,
                color: Color.fromRGBO(0, 0, 0, 0.12))
          ]),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: title,
          enabledBorder: const OutlineInputBorder(borderSide: BorderSide.none),
        ),
      ),
    );
  }
}
