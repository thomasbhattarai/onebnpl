import 'package:onebnpl/models/product.dart';

class ProductsRepository {
  static Future<List<Product>> fetchProducts() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return const [
      Product(
        name: 'Dell Inspiron 3501',
        specs: 'Intel Core i3 11th Gen\n8GB RAM | 256GB SSD',
        price: 'Rs 5,000',
        imagePath: 'assets/images/dell.png',
      ),
      Product(
        name: 'Dell Inspiron 3501',
        specs: 'Intel Core i5 10th Gen\n8GB RAM | 512GB SSD',
        price: 'Rs 85,000',
        imagePath: 'assets/images/dell.png',
      ),
      Product(
        name: 'Dell Inspiron 3501',
        specs: 'Intel Core i3 11th Gen\n8GB RAM | 256GB SSD',
        price: 'Rs 65,000',
        imagePath: 'assets/images/dell.png',
      ),
      Product(
        name: 'Dell Inspiron 3501',
        specs: 'Intel Core i3 11th Gen\n8GB RAM | 256GB SSD',
        price: 'Rs 65,000',
        imagePath: 'assets/images/dell.png',
      ),
      Product(
        name: 'Dell Inspiron 3501',
        specs: 'Intel Core i5 10th Gen\n8GB RAM | 512GB SSD',
        price: 'Rs 85,000',
        imagePath: 'assets/images/dell.png',
      ),
      Product(
        name: 'Dell Inspiron 3501',
        specs: 'Intel Core i3 11th Gen\n8GB RAM | 256GB SSD',
        price: 'Rs 65,000',
        imagePath: 'assets/images/dell.png',
      ),
      Product(
        name: 'Dell Inspiron 3501',
        specs: 'Intel Core i3 11th Gen\n8GB RAM | 256GB SSD',
        price: 'Rs 65,000',
        imagePath: 'assets/images/dell.png',
      ),
      Product(
        name: 'Dell Inspiron 3501',
        specs: 'Intel Core i5 10th Gen\n8GB RAM | 512GB SSD',
        price: 'Rs 85,000',
        imagePath: 'assets/images/dell.png',
      ),
      Product(
        name: 'Dell Inspiron 3501',
        specs: 'Intel Core i3 11th Gen\n8GB RAM | 256GB SSD',
        price: 'Rs 65,000',
        imagePath: 'assets/images/dell.png',
      ),
      Product(
        name: 'Dell Inspiron 3501',
        specs: 'Intel Core i3 11th Gen\n8GB RAM | 256GB SSD',
        price: 'Rs 65,000',
        imagePath: 'assets/images/dell.png',
      ),
      Product(
        name: 'Dell Inspiron 3501',
        specs: 'Intel Core i5 10th Gen\n8GB RAM | 512GB SSD',
        price: 'Rs 85,000',
        imagePath: 'assets/images/dell.png',
      ),
      Product(
        name: 'Dell Inspiron 3501',
        specs: 'Intel Core i3 11th Gen\n8GB RAM | 256GB SSD',
        price: 'Rs 65,000',
        imagePath: 'assets/images/dell.png',
      ),
    ];
  }
}
