import 'package:second_app/product_overview/enum/filter_product_enum.dart';

abstract class ProductOverviewEvent {}

class LikeEvent extends ProductOverviewEvent {
  final String productId;

  LikeEvent({ required this.productId });
}

class AddCartEvent extends ProductOverviewEvent {
  final String productId;
  final String title;
  final double price;

  AddCartEvent({ required this.productId, required this.title, required this.price });
}

class FilterProductItemEvent extends ProductOverviewEvent {
  final FilterProductEnum status;

  FilterProductItemEvent({ required this.status });
}