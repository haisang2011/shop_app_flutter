import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:second_app/models/cart.dart';
import 'package:second_app/models/product.dart';
import 'package:second_app/product_overview/bloc/product_overview_event.dart';
import 'package:second_app/product_overview/bloc/product_overview_state.dart';

class ProductOverviewBloc extends Bloc<ProductOverviewEvent, ProductOverviewState> {
  ProductOverviewBloc() : super(ProductOverviewState.initial()) {
    on<LikeEvent>(_onLike);
    on<AddCartEvent>(_onAddCart);
    on<FilterProductItemEvent>(_onFilterShowProducts);
  }

  _onLike(LikeEvent event, Emitter emit) {
    int foundIndex = state.products.indexWhere((element) => element.id == event.productId);
    if (foundIndex != -1) {
      Product productFound = state.products[foundIndex];

      Product newProduct = Product(
        id: productFound.id, 
        title: productFound.title, 
        description: productFound.description, 
        price: productFound.price, 
        imageUrl: productFound.imageUrl,
        isFavorite: !productFound.isFavorite
      );

      state.products[foundIndex] = newProduct;
      
      emit(state.copyWith(productList: state.products));
    } else {
      print('Cannot found item');
    }
  }

  _onAddCart(AddCartEvent event, Emitter emit) {
    if (state.items.containsKey(event.productId)) {
      // handle existing product with increase quantity
      state.items.update(
        event.productId, 
        (exisitingCartItem) => 
          CartItem(
            id: exisitingCartItem.id, 
            title: exisitingCartItem.title, 
            quantity: exisitingCartItem.quantity + 1,
            price: exisitingCartItem.price
          )
      );
    } else {
      // Add product into cartItems
      state.products.indexWhere((element) => element.id == event.productId);

      state.items.putIfAbsent(
        event.productId, 
        () => CartItem(
          id: event.productId, 
          title: event.title, 
          quantity: 1, 
          price: event.price
        )
      );
    }

    emit(state.copyWith(cartItems: state.items));
  }

  _onFilterShowProducts(FilterProductItemEvent event, Emitter emit) {
    emit(state.copyWith(status: event.status));
  }
}