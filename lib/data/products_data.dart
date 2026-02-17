import 'package:onebnpl/models/product.dart';

class ProductsRepository {
  static Future<List<Product>> fetchProducts() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return const [
      Product(
        name: 'Dell Inspiron 3501',
        specs: 'Intel Core i3 11th Gen\n8GB RAM | 256GB SSD',
        price: 'Rs 50,000',
        imagePath: 'assets/images/dell.png',
      ),
      Product(
        name: 'HP Pavilion 15',
        specs: 'Intel Core i5 10th Gen\n8GB RAM | 512GB SSD',
        price: 'Rs 85,000',
        imagePath: 'assets/images/dell.png',
      ),
      Product(
        name: 'Lenovo ThinkPad E14',
        specs: 'Intel Core i3 11th Gen\n8GB RAM | 256GB SSD',
        price: 'Rs 65,000',
        imagePath: 'assets/images/dell.png',
      ),
      Product(
        name: 'Acer Aspire 5',
        specs: 'Intel Core i3 11th Gen\n8GB RAM | 256GB SSD',
        price: 'Rs 65,000',
        imagePath: 'assets/images/dell.png',
      ),
      Product(
        name: 'Asus VivoBook 14',
        specs: 'Intel Core i5 10th Gen\n8GB RAM | 512GB SSD',
        price: 'Rs 85,000',
        imagePath: 'assets/images/dell.png',
      ),
      Product(
        name: 'Dell Latitude 3420',
        specs: 'Intel Core i3 11th Gen\n8GB RAM | 256GB SSD',
        price: 'Rs 65,000',
        imagePath: 'assets/images/dell.png',
      ),
      Product(
        name: 'MSI Modern 14',
        specs: 'Intel Core i3 11th Gen\n8GB RAM | 256GB SSD',
        price: 'Rs 65,000',
        imagePath: 'assets/images/dell.png',
      ),
      Product(
        name: 'Huawei MateBook D15',
        specs: 'Intel Core i5 10th Gen\n8GB RAM | 512GB SSD',
        price: 'Rs 85,000',
        imagePath: 'assets/images/dell.png',
      ),
      Product(
        name: 'Apple MacBook Air M1',
        specs: 'Intel Core i3 11th Gen\n8GB RAM | 256GB SSD',
        price: 'Rs 65,000',
        imagePath: 'assets/images/dell.png',
      ),
      Product(
        name: 'Samsung Galaxy Book 2',
        specs: 'Intel Core i3 11th Gen\n8GB RAM | 256GB SSD',
        price: 'Rs 65,000',
        imagePath: 'assets/images/dell.png',
      ),
      Product(
        name: 'Microsoft Surface Laptop Go',
        specs: 'Intel Core i5 10th Gen\n8GB RAM | 512GB SSD',
        price: 'Rs 85,000',
        imagePath: 'assets/images/dell.png',
      ),
      Product(
        name: 'LG Gram 15',
        specs: 'Intel Core i3 11th Gen\n8GB RAM | 256GB SSD',
        price: 'Rs 65,000',
        imagePath: 'assets/images/dell.png',
      ),
    ];
  }
}
