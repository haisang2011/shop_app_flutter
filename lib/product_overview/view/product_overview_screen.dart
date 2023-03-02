import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:second_app/models/product.dart';
import 'package:second_app/product_overview/bloc/product_overview_bloc.dart';
import 'package:second_app/product_overview/bloc/product_overview_event.dart';
import 'package:second_app/product_overview/bloc/product_overview_provider.dart';
import 'package:second_app/product_overview/bloc/product_overview_state.dart';
import 'package:second_app/product_overview/enum/filter_product_enum.dart';
import 'package:second_app/widgets/product_item.dart';

class ProductOverviewScreen extends StatelessWidget {
  static const productOverviewRoute = '/product_overview';

  const ProductOverviewScreen({super.key});

  _onLikeProduct(BuildContext context, String productId) {
    context.read<ProductOverviewBloc>().add(LikeEvent(productId: productId));
  }

  _onAddCart(
      BuildContext context, String productId, String title, double price) {
    context
        .read<ProductOverviewBloc>()
        .add(AddCartEvent(productId: productId, title: title, price: price));
  }

  _onFilter(BuildContext context, FilterProductEnum status) {
    context.read<ProductOverviewBloc>().add(FilterProductItemEvent(status: status));
  }

  List<Product> getProductsByCriteria(List<Product> products, FilterProductEnum filter) {
    // Purpose for this handle to easier read when add new FilterProductEnum
    switch (filter) {
      case FilterProductEnum.all:
        return products;
      case FilterProductEnum.favorites:
        return products.where((product) => product.isFavorite).toList();
      default:
        return products;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ProductOverviewProvider(
      child: BlocBuilder<ProductOverviewBloc, ProductOverviewState>(
        builder: (context, state) => Scaffold(
          appBar: AppBar(
            title: const Text('MyShop'),
            actions: <Widget>[
              PopupMenuButton(
                  onSelected: (value) => _onFilter(context, value),
                  icon: const Icon(Icons.more_vert),
                    itemBuilder: (_) => [
                          const PopupMenuItem(value: FilterProductEnum.favorites, child: Text('Only Favorites')),
                          const PopupMenuItem(value: FilterProductEnum.all, child: Text('Show All')),
                        ]),
              Badge(
                label: Align(alignment: Alignment.topLeft, child: Text('10'),),
                textStyle: TextStyle(),
                alignment: AlignmentDirectional.bottomEnd,
                child: IconButton(icon: const Icon(Icons.shopping_cart), onPressed: () {print('object');}, alignment: Alignment.bottomCenter,))
            ],
          ),
          body: BlocBuilder<ProductOverviewBloc, ProductOverviewState>(
            builder: (context, state) {
              List<Product> products = getProductsByCriteria(state.products, state.status);
              return products.isNotEmpty ? GridView.builder(
                padding: const EdgeInsets.all(10),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 3 / 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: products.length,
                itemBuilder: (ctx, i) => ProductItem(
                  id: products[i].id,
                  title: products[i].title,
                  price: products[i].price,
                  imageUrl: products[i].imageUrl,
                  isFavorite: products[i].isFavorite,
                  cartItems: state.items,
                  onLikeProduct: (String productId) =>
                      _onLikeProduct(context, productId),
                  onAddCart: (String productId, String title, double price) =>
                      _onAddCart(context, productId, title, price),
                ),
              ) : const Center(child: Text('No Products', style: TextStyle(fontSize: 26, fontWeight: FontWeight.w500),),);
            },
          ),
        ),
      ),
    );
  }
}
