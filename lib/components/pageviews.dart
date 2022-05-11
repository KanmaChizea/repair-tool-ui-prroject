import 'package:capstone_project_practice/models/appliance_model.dart';
import 'package:capstone_project_practice/screens/order_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PageCategories extends StatefulWidget {
  const PageCategories({Key? key}) : super(key: key);

  @override
  State<PageCategories> createState() => _PageCategoriesState();
}

class _PageCategoriesState extends State<PageCategories> {
  int selectedIndex = 0;
  List pages = ['Offers', 'Kitchen', 'Livingroom', 'Bathroom'];
  List<Appliance> applianceList = [
    Appliance(
        name: 'Microwave',
        iconPath: 'lib/assets/microwave_icon.svg',
        imagePath: 'lib/assets/microwave.png',
        repairCost: '\$52',
        setupCost: '\$12',
        applianceLocation: 'Kitchen'),
    Appliance(
        name: 'Tv set',
        iconPath: 'lib/assets/tv_icon.svg',
        repairCost: '\$152',
        setupCost: '\$22',
        applianceLocation: 'Livingroom'),
    Appliance(
        name: 'Fridge',
        iconPath: 'lib/assets/fridge_icon.svg',
        repairCost: '\$52',
        setupCost: '\$12',
        applianceLocation: 'Kitchen'),
    Appliance(
        name: 'Washer',
        iconPath: 'lib/assets/washer_icon.svg',
        repairCost: '\$77',
        setupCost: '\$12',
        applianceLocation: 'Bathroom'),
    Appliance(
        name: 'Computer',
        iconPath: 'lib/assets/computer_icon.svg',
        repairCost: '\$502',
        setupCost: '\$15',
        applianceLocation: 'Livingroom'),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        pageHeaders(),
        buildPageViews(selectedIndex),
      ],
    );
  }

  SizedBox pageHeaders() {
    return SizedBox(
      height: 35,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: 4,
          itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                child: Container(
                  height: 35,
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  padding: const EdgeInsets.all(9),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(19),
                      color: selectedIndex == index
                          ? const Color(0xFF1B1B1D)
                          : Colors.transparent),
                  child: Text(
                    pages[index],
                    style: selectedIndex == index
                        ? Theme.of(context)
                            .textTheme
                            .bodyText2
                            ?.copyWith(color: const Color(0xFFF9F9F9))
                        : Theme.of(context)
                            .textTheme
                            .bodyText2
                            ?.copyWith(color: const Color(0xFF7B7B7B)),
                  ),
                ),
              )),
    );
  }

  buildPageViews(int currentPage) {
    List<Appliance> categorizedList = [];
    switch (currentPage) {
      case 0:
        categorizedList = applianceList;
        break;
      case 1:
        categorizedList = applianceList
            .where((element) => element.applianceLocation == 'Kitchen')
            .toList();
        break;
      case 2:
        categorizedList = applianceList
            .where((element) => element.applianceLocation == 'Livingroom')
            .toList();
        break;
      case 3:
        categorizedList = applianceList
            .where((element) => element.applianceLocation == 'Bathroom')
            .toList();
        break;
    }
    return ListView.builder(
        shrinkWrap: true,
        itemCount: categorizedList.length,
        physics: const ClampingScrollPhysics(),
        itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                tileColor: const Color(0xFFD6E3FF),
                title: Text(
                  'Fix ${categorizedList[index].name}',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2
                      ?.copyWith(color: const Color(0xFF000000), fontSize: 13),
                ),
                subtitle: Text(
                  categorizedList[index].applianceLocation,
                  style: Theme.of(context).textTheme.bodyText2?.copyWith(
                      color: const Color(0xFF000000).withOpacity(0.5),
                      fontSize: 12),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  color: Color(0xFF1B1B1D),
                ),
                leading: IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(categorizedList[index].iconPath)),
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        OrderScreen(appliance: categorizedList[index]))),
              ),
            ));
  }
}
