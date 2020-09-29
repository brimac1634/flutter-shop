import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/user_product_item.dart';
import '../widgets/app_drawer.dart';
import '../pages/edit_product_page.dart';

import '../providers/products.dart';

class UserProductsPage extends StatelessWidget {
  static const pathName = '/user-products';

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Products'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(EditProductPage.pathName);
            },
          )
        ],
      ),
      drawer: AppDrawer(),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: ListView.builder(
          itemBuilder: (_, i) => Column(children: [
            UserProductItem(productsData.items[i].id,
                productsData.items[i].title, productsData.items[i].imageUrl),
            Divider()
          ]),
          itemCount: productsData.items.length,
        ),
      ),
    );
  }
}
