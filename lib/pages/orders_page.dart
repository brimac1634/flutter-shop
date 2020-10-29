import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/app_drawer.dart';
import '../providers/orders.dart' show Orders;
import '../widgets/order_item.dart';

class OrdersPage extends StatelessWidget {
  static const pathName = '/orders';

  @override
  Widget build(BuildContext context) {
    // final orderData = Provider.of<Orders>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('Your Orders'),
        ),
        drawer: AppDrawer(),
        body: FutureBuilder(
            future: Provider.of<Orders>(context, listen: false).fetchOrders(),
            builder: (ctx, dataSnapshot) {
              if (dataSnapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else {
                return Consumer<Orders>(
                    builder: (ctx, orderData, child) => ListView.builder(
                          itemBuilder: (ctx, i) {
                            return OrderItem(orderData.orders[i]);
                          },
                          itemCount: orderData.orders.length,
                        ));
              }
            }));
  }
}
