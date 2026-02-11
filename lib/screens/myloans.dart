import 'package:flutter/material.dart';

import 'package:onebnpl/app/routes.dart';

const double _bottomNavHeight = 80;

class MyLoansPage extends StatelessWidget {
  const MyLoansPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Stack(
              children: [
                Positioned.fill(
                  child: Image.asset('assets/images/bg.png', fit: BoxFit.cover),
                ),
                SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight,
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
                                  const SizedBox(height: 10),
                                  GestureDetector(
                                    onTap: () => Navigator.pushReplacementNamed(
                                      context,
                                      AppRoutes.home,
                                    ),
                                    child: const Row(
                                      children: [
                                        Icon(
                                          Icons.arrow_back_ios_new,
                                          size: 14,
                                          color: Color(0xFF6A5AFF),
                                        ),
                                        SizedBox(width: 6),
                                        Text(
                                          'My Loans',
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Color(0xFF6A5AFF),
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  const Expanded(child: _LoanCard(days: 7)),
                                  const SizedBox(height: 12),
                                  const Expanded(child: _LoanCard(days: 18)),
                                  const SizedBox(height: 12),
                                  const Expanded(child: _LoanCard(days: 23)),
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
      ),
    );
  }
}

class _LoanCard extends StatelessWidget {
  final int days;

  const _LoanCard({required this.days});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(14, 16, 14, 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: const [
          BoxShadow(
            color: Color(0x26000000),
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          _LoanDial(days: days),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Lenovo Laptop',
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xFF2E2E2E),
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const Text(
                  'IT mart',
                  style: TextStyle(
                    fontSize: 10,
                    color: Color(0xFF7A7A7A),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 6),
                const Text(
                  'Outstanding :',
                  style: TextStyle(
                    fontSize: 10,
                    color: Color(0xFF6A6A6A),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Text(
                  'Next EMI :',
                  style: TextStyle(
                    fontSize: 10,
                    color: Color(0xFF6A6A6A),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    _LoanAction(label: 'Details'),
                    const SizedBox(width: 8),
                    _LoanAction(label: 'Pay Now'),
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

class _LoanDial extends StatelessWidget {
  final int days;

  const _LoanDial({required this.days});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 84,
      height: 84,
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: 84,
            height: 84,
            child: CircularProgressIndicator(
              value: 0.75,
              strokeWidth: 9,
              backgroundColor: const Color(0xFFE5DEFF),
              valueColor: const AlwaysStoppedAnimation<Color>(
                Color(0xFF6A5AFF),
              ),
            ),
          ),
          Text(
            'EMI on\n$days\nDays',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 9,
              color: Color(0xFF5A4AD6),
              fontWeight: FontWeight.w600,
              height: 1.1,
            ),
          ),
        ],
      ),
    );
  }
}

class _LoanAction extends StatelessWidget {
  final String label;

  const _LoanAction({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFFD9D0FF),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 10,
          color: Color(0xFF4A3BC9),
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class _BottomNav extends StatelessWidget {
  final VoidCallback? onHomeTap;

  const _BottomNav({this.onHomeTap, Key? key}) : super(key: key);

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
            const _BottomNavItem(icon: Icons.grid_view_rounded),
            const _BottomNavItem(icon: Icons.qr_code_2_rounded),
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
