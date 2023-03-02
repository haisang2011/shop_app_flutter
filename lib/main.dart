import 'package:flutter/material.dart';
import 'package:second_app/cart/view/cart_screen.dart';
import 'package:second_app/product_detail/view/product_detail_screen.dart';
import 'package:second_app/product_overview/bloc/product_overview_provider.dart';
import 'package:second_app/product_overview/view/product_overview_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ProductOverviewProvider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'MyShop Demo',
        theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.deepOrange,
          fontFamily: 'OpenSans'
        ),
        home: const ProductOverviewScreen(),
        routes: {
          ProductOverviewScreen.productOverviewRoute: (ctx) => const ProductOverviewScreen(),
          ProductDetailScreen.productDetailRoute: (ctx) => const ProductDetailScreen(),
          CartScreen.routeName: (_) => const CartScreen(), 
        },
      ),
    );
  }
}