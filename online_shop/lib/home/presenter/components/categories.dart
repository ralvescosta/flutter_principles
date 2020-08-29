import 'package:flutter/material.dart';
import 'package:online_shop/core/styles/theme.dart';

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<String> categories = [
    'Hand bag',
    'Jewellery',
    'Footwear',
    'Dresses',
    'UguLugu'
  ];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: SizedBox(
        height: 25,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) => buildCategory(index),
        ),
      ),
    );
  }

  Widget buildCategory(int index) {
    final item = categories[index];
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              item,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: selectedIndex == index ? textColor : textLightColor,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 5),
              width: 30,
              height: 2,
              color: selectedIndex == index ? Colors.black : Colors.transparent,
            ),
          ],
        ),
      ),
    );
  }
}
