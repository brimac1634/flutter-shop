import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../models/http_exception.dart';

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  bool isFavorite;

  Product(
      {@required this.id,
      @required this.title,
      @required this.description,
      @required this.price,
      @required this.imageUrl,
      this.isFavorite = false});

  Future<void> toggleFavorite() async {
    final oldStatus = isFavorite;
    final url = 'https://flutter-test-571c2.firebaseio.com/products/$id.json';
    isFavorite = !isFavorite;
    notifyListeners();
    try {
      await http.patch(url, body: json.encode({'isFavorite': isFavorite}));
    } catch (error) {
      isFavorite = oldStatus;
      notifyListeners();
      throw HttpException('Unable to update favorites');
    }
  }
}
