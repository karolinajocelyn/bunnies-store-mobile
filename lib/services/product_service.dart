import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:bunnies_store_mobile/models/product_entry.dart';

class ProductService {
  static const String baseUrl =
      'http://karolina-jocelyn-bunniesstore.pbp.cs.ui.ac.id/';

  // Fungsi untuk mengambil produk yang dimiliki pengguna login
  static Future<List<ProductEntry>> fetchUserProducts() async {
    final url = Uri.parse('$baseUrl/user-products/');
    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        List<dynamic> jsonData = json.decode(response.body)['products'];
        return jsonData.map((json) => ProductEntry.fromJson(json)).toList();
      } else {
        throw Exception('Failed to fetch user products: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching user products: $e');
    }
  }

  static Future<ProductEntry> fetchProductById(String id) async {
    final url = Uri.parse('$baseUrl/product/$id/');
    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body)['product'];
        return ProductEntry.fromJson(jsonData);
      } else {
        throw Exception('Failed to fetch product: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching product: $e');
    }
  }
}
