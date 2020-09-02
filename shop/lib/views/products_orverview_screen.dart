import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/cart.dart';
import 'package:shop/utils/app_routes.dart';
import 'package:shop/widgets/badge.dart';
import 'package:shop/widgets/product_grid.dart';

enum FilterOptions {
  Favorite,
  All,
}

class ProductOverviewScreen extends StatefulWidget {
  @override
  _ProductOverviewScreenState createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  bool _showFavoriteOnly = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Minha Loja'),
        actions: <Widget>[
          PopupMenuButton(
            onSelected: (FilterOptions selectedValue) {
              setState(() {
                if (selectedValue == FilterOptions.Favorite) {
                  _showFavoriteOnly = true;
                  return;
                }
                _showFavoriteOnly = false;
              });
            },
            icon: Icon(Icons.more_vert),
            itemBuilder: (_) {
              return [
                PopupMenuItem(
                  child: Text("Somene Favoritos"),
                  value: FilterOptions.Favorite,
                ),
                PopupMenuItem(
                  child: Text("Todos"),
                  value: FilterOptions.All,
                ),
              ];
            },
          ),
          Consumer<CartProvider>(
            child: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.of(context).pushNamed(AppRoutes.CART);
              },
            ),
            builder: (_, cart, child) => Badge(
              child: child,
              value: cart.itemCount.toString(),
            ),
          )
        ],
      ),
      body: ProductGrid(
        showFavoriteOnly: _showFavoriteOnly,
      ),
    );
  }
}
