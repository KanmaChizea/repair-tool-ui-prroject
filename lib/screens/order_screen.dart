import 'package:capstone_project_practice/constants.dart' as globals;
import 'package:capstone_project_practice/models/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:capstone_project_practice/models/appliance_model.dart';

import '../components/order_button.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({
    Key? key,
    required this.appliance,
  }) : super(key: key);
  final Appliance appliance;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text('Fix ${appliance.name}'),
          backgroundColor: const Color(0xFFF3B29E).withOpacity(0.4),
        ),
        body: ListView(shrinkWrap: true, children: [
          Container(
            height: size.height / 2 - 56,
            width: size.width,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10)),
              color: const Color(0xFFF3B29E).withOpacity(0.4),
            ),

            //show appliance image
            child: Stack(children: [
              Positioned(
                  right: 0,
                  bottom: 0,
                  child: ClipRRect(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      widthFactor: 0.8,
                      child: SvgPicture.asset('lib/assets/app_logo.svg',
                          height: size.height / 2.5,
                          color: Colors.grey.withOpacity(0.2)),
                    ),
                  )),
              appliance.imagePath == null
                  ? const Center(child: Text('No display image available'))
                  : Center(child: Image.asset(appliance.imagePath!))
            ]),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Row(children: [
                  Expanded(
                    child: ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          'Reviews',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              ?.copyWith(fontSize: 20),
                        ),
                        style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            primary: const Color(0xFFF3B29E).withOpacity(0.4),
                            onPrimary: const Color(0xFF1B1B1D),
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)))),
                  ),
                  const SizedBox(width: 15),
                  ElevatedButton(
                      onPressed: () {},
                      child: SvgPicture.asset('lib/assets/message.svg'),
                      style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          primary: const Color(0xFF1B1B1D),
                          onPrimary: const Color(0xFFE8E8E8),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)))),
                ]),
                const SizedBox(height: 20),
                buildCosts('Repair', appliance.repairCost, context),
                const SizedBox(height: 20),
                buildCosts('Setup', appliance.setupCost, context),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: OrderButton(
                        onPrimary: const Color(0xFFE8E8E8),
                        primary: const Color(0xFF1B1B1D),
                        buttonName: 'Order repair',
                        onpressed: () {},
                      ),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: OrderButton(
                        onPrimary: const Color(0xFF1B1B1D),
                        primary: const Color(0xFFFFFEFE),
                        buttonName: 'Order setup',
                        onpressed: () {},
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ]));
  }

  buildCosts(String name, String cost, BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(17, 17, 23, 17),
      height: 60,
      decoration: BoxDecoration(
          color: const Color(0xFFFFFEFE),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: const Color(0xFFD3D3D3), width: 1)),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(name,
            style:
                Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 16)),
        Text(cost,
            style:
                Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 16))
      ]),
    );
  }
}
