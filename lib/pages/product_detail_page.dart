import 'package:flutter/material.dart';

class ProductDetailPage extends StatelessWidget {
  static const pathName = '/product-detail';

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context).settings.arguments as String;

    return Scaffold(
        appBar: AppBar(
      title: Text('title'),
    ));
  }
}
