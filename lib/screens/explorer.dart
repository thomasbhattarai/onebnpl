import 'package:flutter/material.dart';

import 'package:onebnpl/app/routes.dart';
import 'package:onebnpl/data/products_data.dart';
import 'package:onebnpl/data/user_profile_data.dart';
import 'package:onebnpl/models/product.dart';
import 'package:onebnpl/models/user_profile.dart';

const double _bottomNavHeight = 80;

class ExplorerPage extends StatelessWidget {
  const ExplorerPage({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = const [
      _Category(label: 'Electronics', icon: Icons.tv_rounded),
      _Category(label: 'Home\nAppliances', icon: Icons.kitchen_rounded),
      _Category(label: 'Vehicle\nAccessories', icon: Icons.directions_car),
      _Category(label: 'View\nMore', icon: Icons.more_horiz),
    ];

    return Scaffold(
      extendBody: false,
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset('assets/images/bg.png', fit: BoxFit.cover),
          ),
          SafeArea(
            child: Column(
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
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
                    child: SingleChildScrollView(
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
                                      fontSize: 13.5,
                                      color: Color(0xFF4C3EA6),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(height: 2),
                                  FutureBuilder<UserProfile>(
                                    future:
                                        UserProfileRepository.fetchProfile(),
                                    builder: (context, snapshot) {
                                      final name = snapshot.data?.fullName;
                                      return Text(
                                        name ?? 'Loading...',
                                        style: const TextStyle(
                                          fontSize: 13.5,
                                          color: Color(0xFF4C3EA6),
                                          fontWeight: FontWeight.w700,
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                              Container(
                                width: 32,
                                height: 32,
                                decoration: BoxDecoration(
                                  color: const Color(0xFFEDE7FF),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: const Icon(
                                  Icons.notifications_none,
                                  color: Color(0xFF4E46D9),
                                  size: 20,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Container(
                            height: 44,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color(0x22000000),
                                  blurRadius: 6,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: Row(
                              children: const [
                                Icon(Icons.search, color: Color(0xFF6F6F6F)),
                                SizedBox(width: 8),
                                Text(
                                  'Search Products',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Color(0xFF8E8E8E),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 12),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: categories
                                .map(
                                  (category) =>
                                      _CategoryChip(category: category),
                                )
                                .toList(),
                          ),
                          const SizedBox(height: 14),
                          const Text(
                            'Recommendations',
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xFF4C3EA6),
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(height: 8),
                          FutureBuilder<List<Product>>(
                            future: ProductsRepository.fetchProducts(),
                            builder: (context, snapshot) {
                              final items = snapshot.data ?? const <Product>[];
                              if (snapshot.connectionState ==
                                      ConnectionState.waiting &&
                                  items.isEmpty) {
                                return const Center(
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(vertical: 16),
                                    child: Text(
                                      'Loading...',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Color(0xFF6F6F6F),
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                );
                              }

                              return GridView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: items.length,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3,
                                      crossAxisSpacing: 10,
                                      mainAxisSpacing: 10,
                                      childAspectRatio: 0.72,
                                    ),
                                itemBuilder: (context, index) {
                                  return _ProductCard(product: items[index]);
                                },
                              );
                            },
                          ),
                          const SizedBox(height: 0),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: _BottomNav(
        onHomeTap: () {
          Navigator.pushReplacementNamed(context, AppRoutes.home);
        },
        onQrTap: () {
          Navigator.pushNamed(context, AppRoutes.qrCode);
        },
        onOfferTap: () {
          Navigator.pushNamed(context, AppRoutes.offer);
        },
      ),
    );
  }
}

// The rest of the classes (_Category, _Product, _CategoryChip, _ProductCard, _BottomNav, _BottomNavItem) remain unchanged

class _Category {
  final String label;
  final IconData icon;

  const _Category({required this.label, required this.icon});
}

class _Product {
  final String name;
  final String specs;
  final String price;
  final String imagePath;

  const _Product({
    required this.name,
    required this.specs,
    required this.price,
    required this.imagePath,
  });
}

class _CategoryChip extends StatelessWidget {
  final _Category category;

  const _CategoryChip({required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 74,
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 6),
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
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(category.icon, size: 16, color: const Color(0xFF5A4ED1)),
          const SizedBox(height: 4),
          Text(
            category.label,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 8,
              color: Color(0xFF4C3EA6),
              fontWeight: FontWeight.w600,
              height: 1.1,
            ),
          ),
        ],
      ),
    );
  }
}

class _ProductCard extends StatelessWidget {
  final Product product;

  const _ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
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
          const SizedBox(height: 4),
          Text(
            product.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 8.5,
              color: Color(0xFF1E1E1E),
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            product.specs,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 7.5,
              color: Color(0xFF6F6F6F),
              fontWeight: FontWeight.w500,
              height: 1.15,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            product.price,
            style: const TextStyle(
              fontSize: 8.5,
              color: Color(0xFF4C3EA6),
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

class _BottomNav extends StatelessWidget {
  final VoidCallback? onHomeTap;
  final VoidCallback? onQrTap;
  final VoidCallback? onOfferTap;

  const _BottomNav({this.onHomeTap, this.onQrTap, this.onOfferTap, Key? key})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Container(
        height: _bottomNavHeight,
        margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
        decoration: BoxDecoration(
          color: const Color(0xFF0B0716),
          borderRadius: BorderRadius.circular(0),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _BottomNavItem(icon: Icons.home, label: 'Home', onTap: onHomeTap),
            const _BottomNavItem(
              icon: Icons.grid_view_rounded,
              active: true,
              label: 'Explore',
            ),
            _BottomNavItem(icon: Icons.qr_code_2_rounded, onTap: onQrTap),
            _BottomNavItem(icon: Icons.card_giftcard, onTap: onOfferTap),
          ],
        ),
      ),
    );
  }
}

class _BottomNavItem extends StatelessWidget {
  final IconData icon;
  final bool active;
  final String? label;
  final VoidCallback? onTap;

  const _BottomNavItem({
    required this.icon,
    this.active = false,
    this.label,
    this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (active) {
      return GestureDetector(
        onTap: onTap,
        child: Container(
          height: 38,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: const Color(0xFFCFC3FF),
            borderRadius: BorderRadius.circular(18),
          ),
          child: Row(
            children: [
              Icon(icon, color: const Color(0xFF0B0716), size: 22),
              const SizedBox(width: 8),
              Text(
                label ?? '',
                style: const TextStyle(
                  fontSize: 14,
                  color: Color(0xFF0B0716),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      );
    }

    return GestureDetector(
      onTap: onTap,
      child: Icon(icon, color: Colors.white, size: 24),
    );
  }
}
