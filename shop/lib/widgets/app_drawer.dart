import 'package:flutter/material.dart';
import 'package:shop/utils/app_routes.dart';
import 'package:shop/widgets/app_drawer_item.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            title: Text('Bem vindo Usuário'),
            automaticallyImplyLeading: false,
          ),
          AppDrawerItem(
            icon: Icons.shop,
            title: 'Loja',
            routeName: AppRoutes.HOME,
          ),
          Divider(),
          AppDrawerItem(
            icon: Icons.payment,
            title: 'Pedidos',
            routeName: AppRoutes.ORDERS,
          ),
          Divider(),
          AppDrawerItem(
            icon: Icons.edit,
            title: 'Gerenciar Produtos',
            routeName: AppRoutes.PRODUCTS,
          ),
        ],
      ),
    );
  }
}
