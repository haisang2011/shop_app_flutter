import 'package:second_app/models/cart.dart';
import 'package:second_app/models/product.dart';
import 'package:second_app/product_overview/enum/filter_product_enum.dart';

final List<Product> dummyProducts = [
    Product(
      id: '1', 
      title: 'MacBook Pro 14', 
      description: 'This is a MacBook Pro 14', 
      price: 1500, 
      imageUrl: 'assets/images/macbookpro14.jpeg'
    ),
    Product(
      id: '2', 
      title: 'AirPod Pro 2', 
      description: 'This is a AirPod Pro 2', 
      price: 500, 
      imageUrl: 'assets/images/images2.jpeg'
    ),
    Product(
      id: '3', 
      title: 'Ipad Air 4', 
      description: 'This is a Ipad Air 4', 
      price: 900, 
      imageUrl: 'assets/images/images3.jpg'
    ),
    Product(
      id: '4', 
      title: 'Linux PC', 
      description: 'This is a Linux PC', 
      price: 1500, 
      imageUrl: 'assets/images/images4.jpg'
    ),
    Product(
      id: '5', 
      title: 'Mini PC', 
      description: 'This is a Mini PC', 
      price: 1500, 
      imageUrl: 'assets/images/images5.jpeg'
    ),
  ];

class ProductOverviewState {
  final List<Product> products;
  final Map<String, CartItem> items;
  final FilterProductEnum status;

  const ProductOverviewState._({ 
    required this.products,
    required this.items,
    required this.status
  });

  ProductOverviewState.initial()
    : this._(products: dummyProducts, items: {}, status: FilterProductEnum.all);

  ProductOverviewState copyWith({
    List<Product>? productList,
    Map<String, CartItem>? cartItems,
    FilterProductEnum? status,
  }) {
    return ProductOverviewState._(
      products: productList ?? products, 
      items: cartItems ?? items,
      status: status ?? this.status,
    );
  }
}