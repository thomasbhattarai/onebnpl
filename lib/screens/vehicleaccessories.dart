import 'package:flutter/material.dart';
import 'package:onebnpl/data/products_data.dart';
import 'package:onebnpl/data/user_profile_data.dart';
import 'package:onebnpl/models/product.dart';
import 'package:onebnpl/models/user_profile.dart';
import 'package:onebnpl/screens/productdetails.dart';
import 'package:onebnpl/widgets/bottom_navigation.dart';

class VehicleAccessoriesPage extends StatefulWidget {
  const VehicleAccessoriesPage({super.key});

  @override
  State<VehicleAccessoriesPage> createState() =>
      _VehicleAccessoriesPageState();
}

class _VehicleAccessoriesPageState extends State<VehicleAccessoriesPage> {
  final TextEditingController _searchController = TextEditingController();
  bool _sortAscending = false;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final query = _searchController.text.trim().toLowerCase();

    return Scaffold(
      extendBody: false,
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
                        colors: [Color(0xFFF2EDFF), Color(0xFF7A6CFF)],
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(22),
                        topRight: Radius.circular(22),
                      ),
                    ),
                    padding: const EdgeInsets.fromLTRB(14, 16, 14, 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Hi,',
                                  style: TextStyle(
                                    fontSize: 33 / 2,
                                    color: Color(0xFF4C3EA6),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                FutureBuilder<UserProfile>(
                                  future: UserProfileRepository.fetchProfile(),
                                  builder: (context, snapshot) {
                                    return Text(
                                      snapshot.data?.fullName ?? 'Jane Dhungel',
                                      style: const TextStyle(
                                        fontSize: 33 / 2,
                                        color: Color(0xFF4C3EA6),
                                        fontWeight: FontWeight.w500,
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                            const Icon(
                              Icons.notifications_none,
                              color: Color(0xFF4C3EA6),
                              size: 20,
                            ),
                          ],
                        ),
                        const SizedBox(height: 14),
                        Container(
                          height: 48,
                          decoration: BoxDecoration(
                            color: const Color(0xFFF6F6F6),
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: const [
                              BoxShadow(
                                color: Color(0x33000000),
                                blurRadius: 6,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.search,
                                color: Color(0xFF9E9E9E),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: TextField(
                                  controller: _searchController,
                                  onChanged: (_) => setState(() {}),
                                  decoration: const InputDecoration(
                                    hintText: 'Search Products',
                                    hintStyle: TextStyle(
                                      fontSize: 15 * 0.95,
                                      color: Color(0xFF9E9E9E),
                                      fontWeight: FontWeight.w500,
                                    ),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 14),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: const [
                              BoxShadow(
                                color: Color(0x22000000),
                                blurRadius: 4,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.directions_car,
                                size: 14,
                                color: Color(0xFF5A4ED1),
                              ),
                              SizedBox(width: 6),
                              Text(
                                'Vehicle Accessories',
                                style: TextStyle(
                                  fontSize: 9,
                                  color: Color(0xFF4C3EA6),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            const Text(
                              'Sort By',
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xFF4C3EA6),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  _sortAscending = !_sortAscending;
                                });
                              },
                              padding: EdgeInsets.zero,
                              constraints: const BoxConstraints(),
                              icon: const Icon(
                                Icons.swap_vert,
                                color: Color(0xFF4C3EA6),
                                size: 18,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Expanded(
                          child: FutureBuilder<List<Product>>(
                            future: ProductsRepository.fetchProducts(),
                            builder: (context, snapshot) {
                              final baseItems =
                                  snapshot.data ?? const <Product>[];
                              if (snapshot.connectionState ==
                                      ConnectionState.waiting &&
                                  baseItems.isEmpty) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              }

                              var items = query.isEmpty
                                  ? List<Product>.from(baseItems)
                                  : baseItems.where((item) {
                                      final name = item.name.toLowerCase();
                                      final specs = item.specs.toLowerCase();
                                      return name.contains(query) ||
                                          specs.contains(query);
                                    }).toList();

                              items.sort((a, b) {
                                final priceA =
                                    int.tryParse(
                                      a.price.replaceAll(RegExp(r'[^0-9]'), ''),
                                    ) ??
                                    0;
                                final priceB =
                                    int.tryParse(
                                      b.price.replaceAll(RegExp(r'[^0-9]'), ''),
                                    ) ??
                                    0;
                                if (_sortAscending) {
                                  return priceA.compareTo(priceB);
                                }
                                return priceB.compareTo(priceA);
                              });

                              return GridView.builder(
                                padding: const EdgeInsets.only(bottom: 90),
                                itemCount: items.length,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3,
                                      crossAxisSpacing: 10,
                                      mainAxisSpacing: 10,
                                      childAspectRatio: 0.68,
                                    ),
                                itemBuilder: (context, index) {
                                  return _VehicleAccessoryCard(
                                    product: items[index],
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: const AppBottomNavigation(activeIndex: -1),
    );
  }
}

class _VehicleAccessoryCard extends StatelessWidget {
  final Product product;

  const _VehicleAccessoryCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => ProductDetailsPage(productId: product.name),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              color: Color(0x22000000),
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Center(
                child: Image.asset(product.imagePath, fit: BoxFit.contain),
              ),
            ),
            const SizedBox(height: 6),
            Text(
              product.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 9,
                color: Color(0xFF1E1E1E),
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              product.specs,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 7,
                color: Color(0xFF6F6F6F),
                fontWeight: FontWeight.w500,
                height: 1.15,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              product.price,
              style: const TextStyle(
                fontSize: 9,
                color: Color(0xFFE53935),
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
