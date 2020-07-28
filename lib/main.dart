import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './pages/products_overview_pages.dart';
import './pages/product_detail_page.dart';

import './providers/products_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => Products(),
      child: MaterialApp(
          title: 'My Shop',
          theme: ThemeData(
            primarySwatch: Colors.purple,
            accentColor: Colors.deepOrange,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: ProductsOverviewPage(),
          routes: {ProductDetailPage.pathName: (ctx) => ProductDetailPage()}),
    );
  }
}
