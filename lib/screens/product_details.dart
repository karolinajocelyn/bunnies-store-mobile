import 'package:flutter/material.dart';
import 'package:bunnies_store_mobile/models/product_entry.dart';
import 'package:bunnies_store_mobile/services/product_service.dart';

class ProductDetailPage extends StatelessWidget {
  final String productId;

  const ProductDetailPage({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Detail'),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: FutureBuilder<ProductEntry>(
        future: ProductService.fetchProductById(productId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                'Error: ${snapshot.error}',
                style: const TextStyle(color: Colors.red, fontSize: 16),
              ),
            );
          } else if (!snapshot.hasData) {
            return const Center(
              child: Text('Product not found.'),
            );
          } else {
            final product = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.albumTitle,
                    style: const TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text('Artist: ${product.artistName}'),
                  const SizedBox(height: 8),
                  Text('Price: Rp${product.price}'),
                  const SizedBox(height: 8),
                  Text('Description: ${product.description}'),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
