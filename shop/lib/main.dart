import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/cart.dart';
import 'package:shop/providers/products_provider.dart';
import 'package:shop/utils/app_routes.dart';
import 'package:shop/views/cart_screen.dart';
import 'package:shop/views/product_detail_screen.dart';

import 'views/products_orverview_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ProductsProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => CartProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Minha Loja',
        theme: ThemeData(
            primarySwatch: Colors.purple,
            accentColor: Colors.deepOrange,
            fontFamily: 'Lato'),
        routes: {
          AppRoutes.HOME: (_) => ProductOverviewScreen(),
          AppRoutes.PRODUCT_DETAIL: (_) => ProductDetailScreen(),
          AppRoutes.CART: (_) => CartScreen(),
        },
      ),
    );
  }
}
