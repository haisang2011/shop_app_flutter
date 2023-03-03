import 'package:flutter/material.dart';

class ProductDetailScreen extends StatelessWidget {
  static const productDetailRoute = '/product_detail';

  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Text'),),
      body: const Text('Product Detail'),
    );
  }
}