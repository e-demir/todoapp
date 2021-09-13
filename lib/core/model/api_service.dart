import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:todoapp/core/model/product.dart';

class ApiService {
  String _baseUrl = "";

  static ApiService _instance = ApiService._privateConstructor();
  ApiService._privateConstructor() {
    _baseUrl =
        "https://applava-todo-default-rtdb.europe-west1.firebasedatabase.app/";
  }

  static ApiService getInstance() {
    if (_instance == null) {
      return ApiService._privateConstructor();
    }
    return _instance;
  }

  Future<List<Product>> getProducts() async {
    final url = Uri.parse("$_baseUrl/products.json");

    final response = await http.get(url);

    final jsonResponse = json.decode(response.body);

    switch (response.statusCode) {
      case HttpStatus.ok:
        final productList = ProductList.fromJsonList(jsonResponse);
        return productList.products;

      case HttpStatus.unauthorized:
        Logger().e(jsonResponse);
        break;
    }
    return Future.error(jsonResponse);
  }
}
