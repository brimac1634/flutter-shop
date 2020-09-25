import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './pages/orders_page.dart';
import './pages/cart_page.dart';
import './pages/products_overview_pages.dart';
import './pages/product_detail_page.dart';
import './pages/user_products_page.dart';
import './pages/edit_product_page.dart';

import 'providers/products.dart';
import './providers/cart.dart';
import './providers/orders.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => Products()),
        ChangeNotifierProvider(create: (ctx) => Cart()),
        ChangeNotifierProvider(
          create: (ctx) => Orders(),
        )
      ],
      child: MaterialApp(
          title: 'My Shop',
          theme: ThemeData(
            primarySwatch: Colors.purple,
            accentColor: Colors.deepOrange,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: ProductsOverviewPage(),
          routes: {
            ProductDetailPage.pathName: (ctx) => ProductDetailPage(),
            CartPage.pathName: (ctx) => CartPage(),
            OrdersPage.pathName: (ctx) => OrdersPage(),
            UserProductsPage.pathName: (ctx) => UserProductsPage(),
            EditProductPage.pathName: (ctx) => EditProductPage(),
          }),
    );
  }
}
