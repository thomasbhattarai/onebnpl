import 'package:flutter/material.dart';
import 'package:onebnpl/data/products_data.dart';
import 'package:onebnpl/data/user_profile_data.dart';
import 'package:onebnpl/models/product.dart';
import 'package:onebnpl/models/user_profile.dart';
import 'package:onebnpl/widgets/bottom_navigation.dart';

class ProductDetailsPage extends StatefulWidget {
  final String productId;

  const ProductDetailsPage({Key? key, required this.productId})
    : super(key: key);

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  int _selectedRamIndex = 0;
  final List<String> _ramOptions = ['8GB RAM', '16GB RAM', '64GB RAM'];
  final List<int> _ramPriceIncrements = [0, 10000, 40000];
  final double _discountPercentage = 15.0;

  Future<Product?> _getProduct() async {
    final products = await ProductsRepository.fetchProducts();
    return products.firstWhere(
      (p) => p.name == widget.productId,
      orElse: () => products.first,
    );
  }

  Map<String, double> _calculatePrice(Product product) {
    int basePrice =
        int.tryParse(product.price.replaceAll(RegExp(r'[^0-9]'), '')) ?? 0;
    double originalPrice =
        basePrice.toDouble() + _ramPriceIncrements[_selectedRamIndex];
    double discountedPrice = originalPrice * (1 - _discountPercentage / 100);
    return {'originalPrice': originalPrice, 'discountedPrice': discountedPrice};
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Product?>(
      future: _getProduct(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        final product = snapshot.data!;
        final prices = _calculatePrice(product);
        final originalPrice = prices['originalPrice']!;
        final discountedPrice = prices['discountedPrice']!;
        return Scaffold(
          backgroundColor: const Color(0xFFEEE9FF),
          body: SafeArea(
            child: Stack(
              children: [
                Positioned.fill(
                  child: Image.asset('assets/images/bg.png', fit: BoxFit.cover),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 10, 16, 0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 150,
                              height: 150,
                              child: Image.asset(
                                'assets/images/bnpllogo.png',
                                fit: BoxFit.contain,
                              ),
                            ),
                            Transform.translate(
                              offset: const Offset(0, -60),
                              child: const SizedBox(
                                width: 150,
                                child: Center(
                                  child: Text(
                                    'Live Your Dreams Now',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: 0.25,
                                      height: 1.0,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Color(0xFFF2EDFF), Color(0xFF6C5BFF)],
                          ),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(18),
                            topRight: Radius.circular(18),
                          ),
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0x26000000),
                              blurRadius: 12,
                              offset: Offset(0, 6),
                            ),
                          ],
                        ),
                        child: SingleChildScrollView(
                          padding: const EdgeInsets.fromLTRB(12, 14, 12, 90),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              FutureBuilder<UserProfile>(
                                future: UserProfileRepository.fetchProfile(),
                                builder: (context, snapshot) {
                                  final name = snapshot.data?.fullName ?? '...';
                                  return Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            'Hi,',
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: Color(0xFF3D34A4),
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          Text(
                                            name,
                                            style: const TextStyle(
                                              fontSize: 16,
                                              color: Color(0xFF3D34A4),
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Icon(
                                        Icons.notifications_none,
                                        color: Color(0xFF4C3EA6),
                                        size: 20,
                                      ),
                                    ],
                                  );
                                },
                              ),
                              const SizedBox(height: 20),
                              const Text(
                                'New Offers For You !!!',
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Color(0xFF4443A6),
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(height: 14),
                              Container(
                                decoration: BoxDecoration(
                                  color: const Color(0xFFF6F6F6),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                padding: const EdgeInsets.all(12),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Image.asset(
                                          'assets/images/dell.png',
                                          width: 60,
                                          height: 28,
                                          fit: BoxFit.contain,
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 8),
                                    Center(
                                      child: Image.asset(
                                        product.imagePath,
                                        width: 170,
                                        height: 120,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      product.name,
                                      style: const TextStyle(
                                        fontSize: 36 / 2,
                                        fontWeight: FontWeight.w700,
                                        color: Color(0xFF1E1E1E),
                                      ),
                                    ),
                                    const SizedBox(height: 2),
                                    Text(
                                      'Grab yours at $_discountPercentage% off',
                                      style: TextStyle(
                                        fontSize: 11,
                                        color: Colors.grey[700],
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'Rs.${originalPrice.toStringAsFixed(0)}',
                                          style: const TextStyle(
                                            fontSize: 16,
                                            color: Colors.grey,
                                            decoration:
                                                TextDecoration.lineThrough,
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                        Text(
                                          'Rs.${discountedPrice.toStringAsFixed(0)}',
                                          style: const TextStyle(
                                            fontSize: 17,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 2),
                                    const Text(
                                      'By ITMART',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Color(0xFF4C3EA6),
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    const Text(
                                      'Storage',
                                      style: TextStyle(
                                        fontSize: 17,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    const SizedBox(height: 6),
                                    Row(
                                      children: List.generate(
                                        _ramOptions.length,
                                        (i) => Padding(
                                          padding: EdgeInsets.only(
                                            right: i < _ramOptions.length - 1
                                                ? 8
                                                : 0,
                                          ),
                                          child: _StorageChip(
                                            label: _ramOptions[i],
                                            selected: _selectedRamIndex == i,
                                            onTap: () {
                                              setState(() {
                                                _selectedRamIndex = i;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 12),
                                    const Text(
                                      'Features :',
                                      style: TextStyle(
                                        fontSize: 17,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    const Text(
                                      '11th Gen Intel Core i5-1135G7 (4 cores, 8 threads, 2.4 GHz - 4.2 GHz)\nIntegrated Intel Iris Xe Graphics\nRAM: 4 GB - 32 GB DDR4, 3200 MHz\nSSD: from 128 GB up to 512 GB PCIe NVMe SSD',
                                      style: TextStyle(
                                        fontSize: 13,
                                        color: Color(0xFF1E1E1E),
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 14),
                              Row(
                                children: [
                                  Expanded(
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.white,
                                        elevation: 4,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                        ),
                                      ),
                                      child: const Text(
                                        'Add to Cart',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.white,
                                        elevation: 4,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                        ),
                                      ),
                                      child: const Text(
                                        'Pay Now',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: AppBottomNavigation(activeIndex: -1),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _StorageChip extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback? onTap;

  const _StorageChip({required this.label, this.selected = false, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: selected ? const Color(0xFFECEBFA) : const Color(0xFFF4F4F6),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xFF7E70E6), width: 1),
          boxShadow: const [
            BoxShadow(
              color: Color(0x407E70E6),
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 11,
            color: Color(0xFF1E1E1E),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
