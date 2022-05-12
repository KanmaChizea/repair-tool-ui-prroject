import 'package:capstone_project_practice/components/cart_description.dart';
import 'package:capstone_project_practice/components/order_button.dart';
import 'package:capstone_project_practice/models/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  List<CartItem> cart = [
    CartItem(
        iconPath: 'lib/assets/microwave_icon.svg',
        name: 'Microvave',
        location: 'Kitchen',
        services: {'Set up': 22, 'Repair': 80}),
    CartItem(
        iconPath: 'lib/assets/fridge_icon.svg',
        name: 'Fridge',
        location: 'Kitchen',
        services: {'Set up': 20, 'Repair': 50}),
    CartItem(
        iconPath: 'lib/assets/washer_icon.svg',
        name: 'Washer',
        location: 'Bathroom',
        services: {'Repair': 135}),
    CartItem(
        iconPath: 'lib/assets/computer_icon.svg',
        name: 'Computer',
        location: 'Bedroom',
        services: {'Set up': 30})
  ];
  TextStyle listTileTitle = const TextStyle(
      color: Color(0xFF000000),
      fontSize: 13,
      fontFamily: 'Gotham',
      fontWeight: FontWeight.w500);
  TextStyle listTileSubtitle = TextStyle(
      color: const Color(0xFF000000).withOpacity(0.5),
      fontSize: 12,
      fontFamily: 'Gotham',
      fontWeight: FontWeight.w500);
  late List<bool> showDescription;
  late int totalPrice;

  @override
  void initState() {
    showDescription = List.filled(cart.length, false);
    totalPrice = calculateTotalPrice();
    super.initState();
  }

  int calculateTotalPrice() {
    int price = 0;
    for (var element in cart) {
      price = price +
          element.services.values.reduce((sum, element) => sum + element);
    }
    return price;
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: SingleChildScrollView(
            child: Column(children: [
              SizedBox(
                height: height / 5,
                child: Stack(
                  children: [
                    Positioned(
                      right: 0,
                      top: 0,
                      child: ClipRect(
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          heightFactor: 0.4,
                          widthFactor: 0.7,
                          child: SvgPicture.asset('lib/assets/app_logo.svg',
                              height: height / 2,
                              color: Colors.grey.withOpacity(0.2)),
                        ),
                      ),
                    ),
                    AppBar(
                      toolbarHeight: height / 5,
                      title: const Text('Cart'),
                    )
                  ],
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: cart.length,
                itemBuilder: (context, index) {
                  final item = cart[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: buildCartItems(item, index, context),
                  );
                },
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text('Total price'),
                  Text(
                    '\$${totalPrice.toString()}',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2
                        ?.copyWith(color: Colors.black),
                  )
                ],
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 60,
                child: OrderButton(
                    buttonName: 'Make an order',
                    onPrimary: const Color(0xFFF9F9F9),
                    primary: const Color(0xFF1B1B1D),
                    onpressed: () {}),
              )
            ]),
          ),
        ),
      ),
    );
  }

  Column buildCartItems(CartItem item, int index, BuildContext context) {
    return Column(
      children: [
        ListTile(
          tileColor: const Color(0xFFF1F4FD),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: const BorderSide(color: Color(0xFFEAEAEA), width: 1)),
          leading: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  color: const Color(0xFFC7D9FF),
                  borderRadius: BorderRadius.circular(10)),
              child: SvgPicture.asset(
                item.iconPath,
                fit: BoxFit.scaleDown,
              )),
          title: Text(
            'Fix ${item.name}',
            style: listTileTitle,
          ),
          subtitle: showDescription[index]
              ? Text(
                  item.location,
                  style: listTileSubtitle,
                )
              : Text(
                  '${item.services.length} Service',
                  style: listTileSubtitle,
                ),
          trailing: SizedBox(
            width: 90,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\$${(item.services.values.reduce((sum, element) => sum + element).toString())}',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2
                      ?.copyWith(color: const Color(0xFF7B7B7B), fontSize: 13),
                ),
                IconButton(
                  icon: const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    setState(() {
                      showDescription[index] = !showDescription[index];
                    });
                  },
                ),
              ],
            ),
          ),
        ),
        showDescription[index] ? BuildDescription(item: item) : Container(),
      ],
    );
  }
}
