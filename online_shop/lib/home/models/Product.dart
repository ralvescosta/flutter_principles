import 'package:flutter/material.dart';

class ProductModel {
  final String image, title, description;
  final int price, size, id;
  final Color color;

  ProductModel({
    this.image,
    this.title,
    this.description,
    this.price,
    this.size,
    this.id,
    this.color,
  });
}
