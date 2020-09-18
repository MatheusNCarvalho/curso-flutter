import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/orders.dart';
import 'package:shop/widgets/app_drawer.dart';
import 'package:shop/widgets/order_widget.dart';

class OrdersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meus pedidos'),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future:
            Provider.of<OrdersProvider>(context, listen: false).loadOrders(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return Consumer<OrdersProvider>(
            builder: (context, orders, child) {
              return ListView.builder(
                itemCount: orders.itemsCount,
                itemBuilder: (context, index) {
                  return OrderWidget(order: orders.items[index]);
                },
              );
            },
          );
        },
      ),
      drawer: AppDrawer(),
    );
  }
}
