import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Auth with ChangeNotifier {
  static const key = 'AIzaSyBFL5kNtxeoc55kvZ2v0ERklScQbWq9I-g';
  String _token;
  DateTime _expiryDate;
  String userId;

  Future<void> signUp(String email, String password) async {
    final url =
        'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=$key';

    try {
      final response = await http.post(url,
          body: json.encode({
            'email': email,
            'password': password,
            'returnSecureToken': true
          }));
      print(json.decode(response.body));
    } catch (error) {
      print(error);
    }
  }

  Future<void> login(String email, String password) async {
    final url =
        'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=$key';
    try {
      final response = await http.post(url,
          body: json.encode({'email': email, 'password': password}));
    } catch (error) {
      print(error);
    }
  }
}
