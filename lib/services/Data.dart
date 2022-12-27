import 'dart:convert';

import 'package:http/http.dart' as http;

class ProductService {
  static Future<List<Map<String, dynamic>>> getProduct() async {
    http.Response response =
        await http.get(Uri.parse('https://fakestoreapi.com/products'));
    List<Map<String, dynamic>> data = List.from(jsonDecode(response.body));
    return data;
  }
}
