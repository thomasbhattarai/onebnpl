import 'package:flutter/material.dart';
import 'package:onebnpl/app/routes.dart';
import 'package:onebnpl/screens/qrcode.dart';

const double bottomNavHeight = 80;

class AppBottomNavigation extends StatelessWidget {
  final int activeIndex;

  const AppBottomNavigation({required this.activeIndex, Key? key})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Container(
        height: bottomNavHeight,
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
              label: 'Home',
              active: activeIndex == 0,
              onTap: activeIndex == 0
                  ? null
                  : () {
                      Navigator.pushReplacementNamed(context, AppRoutes.home);
                    },
            ),
            _BottomNavItem(
              icon: Icons.grid_view_rounded,
              label: 'Explore',
              active: activeIndex == 1,
              onTap: activeIndex == 1
                  ? null
                  : () {
                      Navigator.pushReplacementNamed(
                        context,
                        AppRoutes.explorer,
                      );
                    },
            ),
            _BottomNavItem(
              icon: Icons.qr_code_2_rounded,
              active: activeIndex == 2,
              onTap: activeIndex == 2
                  ? null
                  : () {
                      Navigator.of(context).pushReplacement(
                        PageRouteBuilder(
                          pageBuilder: (_, __, ___) => const QrcodePage(),
                          transitionDuration: Duration.zero,
                          reverseTransitionDuration: Duration.zero,
                        ),
                      );
                    },
            ),
            _BottomNavItem(
              icon: Icons.card_giftcard,
              active: activeIndex == 3,
              onTap: activeIndex == 3
                  ? null
                  : () {
                      Navigator.pushReplacementNamed(context, AppRoutes.offer);
                    },
            ),
            _BottomNavItem(
              icon: Icons.person_outline,
              active: activeIndex == 4,
              onTap: activeIndex == 4
                  ? null
                  : () {
                      Navigator.pushReplacementNamed(
                        context,
                        AppRoutes.myProfile,
                      );
                    },
            ),
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
              if (label != null) ...[
                const SizedBox(width: 8),
                Text(
                  label!,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF0B0716),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
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
