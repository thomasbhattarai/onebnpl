import 'package:flutter/material.dart';

import 'package:onebnpl/app/routes.dart';
import 'package:onebnpl/data/offers_data.dart';
import 'package:onebnpl/data/user_profile_data.dart';
import 'package:onebnpl/models/offer.dart';
import 'package:onebnpl/models/user_profile.dart';
import 'package:onebnpl/screens/explorer.dart';
import 'package:onebnpl/screens/qrcode.dart';

class OfferPage extends StatelessWidget {
  const OfferPage({super.key});

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
                      minHeight: constraints.maxHeight,
                    ),
                    child: IntrinsicHeight(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const SizedBox(height: 8),
                          Column(
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
                          const SizedBox(height: 12),
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
                                16,
                                16,
                                20,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Row(
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
                                              fontSize: 12,
                                              color: Color(0xFF4C3EA6),
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          const SizedBox(height: 2),
                                          FutureBuilder<UserProfile>(
                                            future:
                                                UserProfileRepository.fetchProfile(),
                                            builder: (context, snapshot) {
                                              final name =
                                                  snapshot.data?.fullName;
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
                                  const SizedBox(height: 12),
                                  const Text(
                                    'New Offers For You !!!',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Color(0xFF4C3EA6),
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  FutureBuilder<List<Offer>>(
                                    future: OffersRepository.fetchOffers(),
                                    builder: (context, snapshot) {
                                      final items =
                                          snapshot.data ?? const <Offer>[];
                                      if (snapshot.connectionState ==
                                              ConnectionState.waiting &&
                                          items.isEmpty) {
                                        return const Center(
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                              vertical: 16,
                                            ),
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

                                      if (items.isEmpty) {
                                        return const Center(
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                              vertical: 16,
                                            ),
                                            child: Text(
                                              'No offers available',
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Color(0xFF6F6F6F),
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                        );
                                      }

                                      return Column(
                                        children: List.generate(
                                          items.length,
                                          (index) => Padding(
                                            padding: EdgeInsets.only(
                                              bottom: index == items.length - 1
                                                  ? 0
                                                  : 12,
                                            ),
                                            child: _OfferCard(
                                              item: items[index],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
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
        onHomeTap: () =>
            Navigator.pushReplacementNamed(context, AppRoutes.home),
        onQrTap: () {
          Navigator.of(context).pushReplacement(
            PageRouteBuilder(
              pageBuilder: (_, __, ___) => const QrcodePage(),
              transitionDuration: Duration.zero,
              reverseTransitionDuration: Duration.zero,
            ),
          );
        },
      ),
    );
  }
}

class _OfferCard extends StatelessWidget {
  final Offer item;

  const _OfferCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Color(0x1F000000),
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 56,
            height: 56,
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: const Color(0xFFF6F4FF),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.asset(item.imagePath, fit: BoxFit.contain),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  style: const TextStyle(
                    fontSize: 12.5,
                    color: Color(0xFF1E1E1E),
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  item.subtitle,
                  style: const TextStyle(
                    fontSize: 10.5,
                    color: Color(0xFF6F6F6F),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    Text(
                      item.oldPrice,
                      style: const TextStyle(
                        fontSize: 11,
                        color: Color(0xFF6F6F6F),
                        decoration: TextDecoration.lineThrough,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      item.newPrice,
                      style: const TextStyle(
                        fontSize: 11,
                        color: Color(0xFF1E1E1E),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ],
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

  const _BottomNav({this.onHomeTap, this.onQrTap});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Container(
        height: 72,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: const BoxDecoration(color: Color(0xFF0B0716)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: onHomeTap,
              child: const Icon(Icons.home, color: Colors.white, size: 24),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const ExplorerPage()),
                );
              },
              child: const Icon(
                Icons.grid_view_rounded,
                color: Colors.white,
                size: 24,
              ),
            ),
            GestureDetector(
              onTap: onQrTap,
              child: const Icon(
                Icons.qr_code_2_rounded,
                color: Colors.white,
                size: 24,
              ),
            ),
            const _ActiveOffer(),
          ],
        ),
      ),
    );
  }
}

class _ActiveOffer extends StatelessWidget {
  const _ActiveOffer();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36,
      padding: const EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
        color: const Color(0xFFCFC3FF),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: const [
          Icon(Icons.card_giftcard, color: Color(0xFF0B0716), size: 20),
          SizedBox(width: 6),
          Text(
            'Offers',
            style: TextStyle(
              fontSize: 12,
              color: Color(0xFF0B0716),
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
