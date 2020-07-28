import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'product_item.dart';

import '../models/product.dart';
import '../providers/products_provider.dart';

class ProductsGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final products = productsData.items;
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10),
      itemBuilder: (ctx, i) {
        return ProductItem(
          id: products[i].id,
          title: products[i].title,
          imageUrl: products[i].imageUrl,
        );
      },
      itemCount: products.length,
      padding: const EdgeInsets.all(10),
    );
  }
}
