import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:online_shop/core/styles/theme.dart';
import 'package:online_shop/home/presenter/components/body.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Body(),
    );
  }
}

AppBar buildAppBar() {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    shadowColor: Colors.white,
    leading: IconButton(
      icon: SvgPicture.asset(
        "assets/icons/back.svg",
      ),
      onPressed: () {},
    ),
    actions: <Widget>[
      IconButton(
        icon: SvgPicture.asset(
          "assets/icons/search.svg",
          color: textColor,
        ),
        onPressed: () {},
      ),
      IconButton(
        icon: SvgPicture.asset(
          "assets/icons/cart.svg",
          color: textColor,
        ),
        onPressed: () {},
      ),
      SizedBox(
        width: defaultPadding / 2,
      )
    ],
  );
}
