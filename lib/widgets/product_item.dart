import 'package:flutter/material.dart';
import 'package:second_app/models/cart.dart';
import 'package:second_app/product_detail/view/product_detail_screen.dart';

class ProductItem extends StatelessWidget {
  final String id;
  final String title;
  final double price;
  final String imageUrl;
  final bool isFavorite;
  final Map<String, CartItem> cartItems;
  final Function onLikeProduct;
  final Function onAddCart;

  const ProductItem({
    super.key,
    required this.id,
    required this.title,
    required this.price,
    required this.imageUrl,
    required this.isFavorite,
    required this.cartItems,
    required this.onLikeProduct,
    required this.onAddCart,
  });

  void goToProductDetailScreen(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      ProductDetailScreen.productDetailRoute,
    );
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return GestureDetector(
      onTap: () => goToProductDetailScreen(context),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: GridTile(
          footer: GridTileBar(
              backgroundColor: Colors.black54,
              title: Text(
                title,
                textAlign: TextAlign.center,
              ),
              leading:
                  IconButton(
                    onPressed: () => onLikeProduct(id), 
                    icon: isFavorite ? const Icon(Icons.favorite) : const Icon(Icons.favorite_border), 
                    color: themeData.accentColor
                  ),
              trailing: IconButton(
                  onPressed: () => onAddCart(id, title, price), icon: cartItems.containsKey(id) ? const Icon(Icons.shopping_cart) : const Icon(Icons.shopping_cart_outlined), color: themeData.accentColor,)),
          child: Image.asset(imageUrl),
        ),
      ),
    );
  }
}
