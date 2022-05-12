import 'package:capstone_project_practice/models/cart_model.dart';
import 'package:flutter/material.dart';

class BuildDescription extends StatelessWidget {
  const BuildDescription({
    Key? key,
    required this.item,
  }) : super(key: key);

  final CartItem item;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      itemCount: item.services.length,
      itemBuilder: (context, index) {
        return ListTile(
          tileColor: const Color(0xFFD6E3FF).withOpacity(0.4),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(2),
              side: const BorderSide(width: 1, color: Color(0xFFEAEAEA))),
          leading: Icon(
            Icons.remove_circle,
            color: const Color(0xFFCA1414).withOpacity(0.5),
          ),
          title: Text(
            '${item.services.keys.toList()[index]} ${item.name}',
            style: Theme.of(context)
                .textTheme
                .bodyText2
                ?.copyWith(color: const Color(0xFF000000), fontSize: 13),
          ),
          trailing: Text('\$${item.services.values.toList()[index]}'),
        );
      },
    );
  }
}
