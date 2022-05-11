import 'package:capstone_project_practice/components/pageviews.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../components/offers_section.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu),
        actions: [
          IconButton(
              onPressed: () => Navigator.pushNamed(context, '/cart'),
              icon: const Icon(Icons.shopping_cart_outlined))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
        child: ListView(
          shrinkWrap: true,
          children: [
            Text(
              "What's broken?",
              style:
                  Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 24),
            ),
            const SizedBox(height: 10),
            buildSearchBar(),
            const SizedBox(height: 30),
            Text('Offers', style: Theme.of(context).textTheme.bodyText1),
            const SizedBox(height: 10),
            const OffersSection(),
            const SizedBox(height: 15),
            Text('We can fix it', style: Theme.of(context).textTheme.bodyText1),
            const SizedBox(height: 10),
            const PageCategories()
          ],
        ),
      ),
    );
  }

  TextField buildSearchBar() {
    return TextField(
      decoration: InputDecoration(
          fillColor: const Color(0xFFFFFEFE),
          filled: true,
          hintText: 'Search appliances',
          suffixIcon: IconButton(
              onPressed: () {},
              icon: SvgPicture.asset('lib/assets/search_icon.svg')),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide:
                  const BorderSide(color: Color(0xFFD3D3D3), width: 1))),
    );
  }
}
