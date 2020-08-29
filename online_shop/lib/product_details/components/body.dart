import 'package:flutter/material.dart';
import 'package:online_shop/home/models/Product.dart';
import 'package:online_shop/product_details/components/product_title_with_image.dart';

class Body extends StatelessWidget {
  final ProductModel product;

  const Body({Key key, this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: size.height,
            child: Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.3),
                  padding: EdgeInsets.only(
                    top: size.height * 0.12,
                    left: 20,
                    right: 20,
                  ),
                  // height: 500,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: [
                          Column(
                            children: [
                              Text('Color'),
                              Container(
                                margin: EdgeInsets.only(top: 5, right: 10),
                                padding: EdgeInsets.all(2.5),
                                height: 24,
                                width: 24,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Color(0xFF356C95),
                                  ),
                                ),
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    color: Color(0xFF356C95),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
                ProductTitleWithImage(product: product)
              ],
            ),
          )
        ],
      ),
    );
  }
}
