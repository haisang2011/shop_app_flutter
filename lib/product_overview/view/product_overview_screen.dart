import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:second_app/dummy.dart';
import 'package:second_app/models/product.dart';
import 'package:second_app/widgets/product_item.dart';

class ProductOverviewScreen extends StatelessWidget {
  static const productOverviewRoute = '/product_overview';
  final List<Product> products = DummyData.products;

  ProductOverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('MyShop')),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: products.length,
        itemBuilder: (ctx, i) => ProductItem(id: products[i].id, title: products[i].title, imageUrl: products[i].imageUrl,),
      ),
    );
  }
}
