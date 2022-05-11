import 'package:flutter/material.dart';

class OrderButton extends StatelessWidget {
  const OrderButton({
    Key? key,
    required this.buttonName,
    required this.onPrimary,
    required this.primary,
    required this.onpressed,
  }) : super(key: key);
  final String buttonName;
  final Color onPrimary;
  final Color primary;
  final Function onpressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onpressed,
      child: Text(
        buttonName,
        style:
            Theme.of(context).textTheme.bodyText2?.copyWith(color: onPrimary),
      ),
      style: ElevatedButton.styleFrom(
          elevation: 0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          padding: const EdgeInsets.symmetric(vertical: 15),
          primary: primary,
          side: const BorderSide(color: Color(0xFFD3D3D3), width: 1)),
    );
  }
}
