import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:second_app/models/cart.dart';
import 'package:second_app/product_overview/bloc/product_overview_bloc.dart';
import 'package:second_app/product_overview/bloc/product_overview_state.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  static const String routeName = '/cart';

  Widget _renderCartItem(CartItem item) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      child: Row(
        children: [
          Text(
            item.title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.white),
          ),
          const SizedBox(
            width: 6,
          ),
          Text(' x ${item.quantity} :',
              style:
                  const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.white)),
          const SizedBox(
            width: 8,
          ),
          Text('${item.price}\$',
              style:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    TextStyle totalCardStyle = TextStyle(
        color: themeData.primaryColor,
        fontSize: 20,
        fontWeight: FontWeight.w600);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart items'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Card(
              color: themeData.primaryColorLight,
              elevation: 3,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                child: Row(
                  children: [
                    Text(
                      'Total: ',
                      style: totalCardStyle,
                    ),
                    BlocBuilder<ProductOverviewBloc, ProductOverviewState>(
                      builder: (context, state) {
                        // Calculate total price
                        final total = state.items.entries.fold<double>(
                          0, 
                          (previousValue, element) => 
                            previousValue + (element.value.quantity * element.value.price)
                        );

                        return Text(
                        '$total\$',
                        style: totalCardStyle,
                      );
                      },
                    )
                  ],
                ),
              ),
            ),
            BlocBuilder<ProductOverviewBloc, ProductOverviewState>(
              builder: (context, state) {
                inspect(state);
                return Card(
                  color: themeData.primaryColor,
                  elevation: 3,
                  child: Column(
                    children: [
                      ...state.items.entries
                          .map((entry) => _renderCartItem(entry.value))
                          .toList()
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
