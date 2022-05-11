import 'package:flutter/material.dart';

import '../models/offers_model.dart';

class OffersSection extends StatelessWidget {
  const OffersSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Offers> offerList = [
      Offers(
          validityDate: 'june 30th',
          infoText: 'Cashback 5% from each repair',
          imagePath: 'lib/assets/girl.png',
          headerColor: const Color(0xFFCAE8F2),
          bodyColor: const Color(0xFFEEEDF3)),
      Offers(
          validityDate: 'july 2nd',
          infoText: 'Sale on appliances repair!',
          imagePath: 'lib/assets/My project.png',
          headerColor: const Color(0xFFEEEDF3),
          bodyColor: const Color(0xFFD1D3FA))
    ];
    return SizedBox(
      height: 240,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: offerList.length,
        itemBuilder: (context, index) => Container(
          margin: const EdgeInsets.all(10),
          width: 270,
          child: Column(
            children: [
              Container(
                height: 50,
                width: 270,
                child: Center(
                    child: Text(
                  'valid until ${offerList[index].validityDate}',
                  style: Theme.of(context).textTheme.bodyText1,
                )),
                decoration: BoxDecoration(
                    color: offerList[index].headerColor,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    )),
              ),
              Container(
                padding: const EdgeInsets.only(left: 20),
                decoration: BoxDecoration(
                    color: offerList[index].bodyColor,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    )),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Flexible(
                        child: Text(
                          offerList[index].infoText,
                          style:
                              Theme.of(context).textTheme.bodyText1?.copyWith(),
                        ),
                      ),
                      Image.asset(
                        offerList[index].imagePath,
                        fit: BoxFit.fitHeight,
                      )
                    ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
