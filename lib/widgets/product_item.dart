import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:second_app/screens/product_detail_screen.dart';

class ProductItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;

  ProductItem({
    super.key,
    required this.id,
    required this.title,
    required this.imageUrl,
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
                  IconButton(onPressed: () {}, icon: const Icon(Icons.favorite), color: themeData.accentColor,),
              trailing: IconButton(
                  onPressed: () {}, icon: const Icon(Icons.shopping_cart), color: themeData.accentColor,)),
          child: Image.network(
            imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
