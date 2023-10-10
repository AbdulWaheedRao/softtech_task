import 'dart:convert';

import 'package:flutter_softtech_task/model/products_model.dart';
import 'package:http/http.dart' as http;

class ApiProvider {
  Future<List<Product>> fetchProducts() async {
    final response =
        await http.get(Uri.parse('https://fakestoreapi.com/products?limit=10'));

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((data) => Product.fromMap(data)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }
}
