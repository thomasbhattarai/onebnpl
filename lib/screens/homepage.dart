import 'package:flutter/material.dart';

import 'package:onebnpl/app/routes.dart';
import 'package:onebnpl/data/top_items_data.dart';
import 'package:onebnpl/models/top_item.dart';

const double _bottomNavHeight = 80;

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: false,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Stack(
              children: [
                Positioned.fill(
                  child: Image.asset('assets/images/bg.png', fit: BoxFit.cover),
                ),
                SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(16, 10, 16, 0),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight - _bottomNavHeight,
                    ),
                    child: IntrinsicHeight(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Positioned(
                            top: 1,
                            left: 16,
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
                          const SizedBox(height: 0),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Color(0xFFF2EDFF),
                                    Color(0xFF6C5BFF),
                                  ],
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
                              padding: const EdgeInsets.fromLTRB(
                                16,
                                46,
                                16,
                                56,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Hi,',
                                            style: TextStyle(
                                              fontSize: 13.5,
                                              color: Color(0xFF4C3EA6),
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          SizedBox(height: 2),
                                          Text(
                                            'Thomas Bhattarai',
                                            style: TextStyle(
                                              fontSize: 13.5,
                                              color: Color(0xFF4C3EA6),
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        width: 32,
                                        height: 32,
                                        decoration: BoxDecoration(
                                          color: const Color(0xFFEDE7FF),
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                        ),
                                        child: const Icon(
                                          Icons.notifications_none,
                                          color: Color(0xFF4E46D9),
                                          size: 20,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 20),
                                  Container(
                                    height: 170,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(14),
                                      image: const DecorationImage(
                                        image: AssetImage(
                                          'assets/images/p.png',
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          left: 10,
                                          top: 10,
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 12,
                                              vertical: 8,
                                            ),
                                            decoration: BoxDecoration(
                                              color: const Color(0xFF6A5AFF),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: const Text(
                                              'My Balance: 00,000\nMy Loan: 00,000\nNo of EMI: 00\nNearest EMI: 6/12/2026',
                                              style: TextStyle(
                                                fontSize: 10,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500,
                                                height: 1.2,
                                              ),
                                            ),
                                          ),
                                        ),
                                        const Center(
                                          child: Text(
                                            'ONEBNPL',
                                            style: TextStyle(
                                              fontSize: 26,
                                              letterSpacing: 2,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w800,
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          right: 10,
                                          bottom: 10,
                                          child: Container(
                                            width: 28,
                                            height: 28,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(14),
                                            ),
                                            child: const Icon(
                                              Icons.arrow_forward,
                                              color: Color(0xFF4E46D9),
                                              size: 18,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 14),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: _ActionButton(
                                          icon: Icons.person_outline,
                                          label: 'My Loans',
                                          onTap: () {
                                            Navigator.pushNamed(
                                              context,
                                              AppRoutes.myLoans,
                                            );
                                          },
                                        ),
                                      ),
                                      const SizedBox(width: 12),
                                      Expanded(
                                        child: _ActionButton(
                                          icon: Icons.explore_outlined,
                                          label: 'Explore More',
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 12),
                                  const Align(
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      'Top Items',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Color(0xFF4C3EA6),
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  FutureBuilder<List<TopItem>>(
                                    future: TopItemsRepository.fetchTopItems(),
                                    builder: (context, snapshot) {
                                      final items =
                                          snapshot.data ?? const <TopItem>[];
                                      final displayItems = items
                                          .take(4)
                                          .toList();

                                      return Container(
                                        height: 54,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(
                                            12,
                                          ),
                                          border: Border.all(
                                            color: const Color(0xFFE0E0E0),
                                          ),
                                        ),
                                        child: Row(
                                          children: [
                                            if (displayItems.isEmpty)
                                              const Expanded(
                                                child: Center(
                                                  child: Text(
                                                    'Loading...',
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      color: Color(0xFF6F6F6F),
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                ),
                                              )
                                            else
                                              for (
                                                var i = 0;
                                                i < displayItems.length;
                                                i++
                                              ) ...[
                                                _BrandItem(
                                                  label: displayItems[i].label,
                                                  assetPath:
                                                      displayItems[i].assetPath,
                                                ),
                                                if (i !=
                                                    displayItems.length - 1)
                                                  _Divider(),
                                              ],
                                            const Expanded(
                                              child: Icon(
                                                Icons.arrow_forward,
                                                color: Color(0xFF4E46D9),
                                                size: 18,
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                  const SizedBox(height: 14),
                                  Container(
                                    height: 140,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(14),
                                      image: const DecorationImage(
                                        image: AssetImage(
                                          'assets/images/lprect.png',
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                        14,
                                        12,
                                        14,
                                        12,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            'LEGION',
                                            style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w800,
                                            ),
                                          ),
                                          const Text(
                                            'by Lenovo',
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.white70,
                                            ),
                                          ),
                                          const Spacer(),
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 10,
                                              vertical: 6,
                                            ),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                            child: const Text(
                                              'PRE-ORDER NOW',
                                              style: TextStyle(
                                                fontSize: 10,
                                                color: Color(0xFF4E46D9),
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
      bottomNavigationBar: _BottomNav(
        onQrTap: () {
          Navigator.pushNamed(context, AppRoutes.qrCode);
        },
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback? onTap;

  const _ActionButton({required this.icon, required this.label, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 44,
        decoration: BoxDecoration(
          color: const Color(0xFFECE6FF),
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              color: Color(0x22000000),
              blurRadius: 6,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: const Color(0xFF4E46D9), size: 18),
            const SizedBox(width: 6),
            Text(
              label,
              style: const TextStyle(
                fontSize: 12,
                color: Color(0xFF4C3EA6),
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BrandItem extends StatelessWidget {
  final String label;
  final String assetPath;

  const _BrandItem({required this.label, required this.assetPath});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Image.asset(
          assetPath,
          height: 22,
          fit: BoxFit.contain,
          semanticLabel: label,
        ),
      ),
    );
  }
}

class _Divider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(width: 1, height: 24, color: const Color(0xFFE0E0E0));
  }
}

class _BottomNav extends StatelessWidget {
  final VoidCallback? onHomeTap;
  final VoidCallback? onQrTap;

  const _BottomNav({this.onHomeTap, this.onQrTap, Key? key}) : super(key: key);

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
            _BottomNavItem(
              icon: Icons.home,
              active: true,
              label: 'Home',
              onTap: onHomeTap,
            ),
            const _BottomNavItem(icon: Icons.grid_view_rounded),
            _BottomNavItem(icon: Icons.qr_code_2_rounded, onTap: onQrTap),
            const _BottomNavItem(icon: Icons.card_giftcard),
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
