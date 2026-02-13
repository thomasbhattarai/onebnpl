import 'package:flutter/material.dart';
import 'package:onebnpl/app/routes.dart';
import 'package:onebnpl/screens/homepage.dart';
import 'package:onebnpl/screens/explorer.dart';
import 'package:onebnpl/screens/offer.dart';
import 'package:onebnpl/screens/myprofile.dart';
import 'package:onebnpl/screens/qrcode.dart';

const double bottomNavHeight = 80;

class AppBottomNavigation extends StatelessWidget {
  final int activeIndex;

  const AppBottomNavigation({required this.activeIndex, Key? key})
    : super(key: key);

  static Widget _getPageForRoute(String routeName) {
    switch (routeName) {
      case AppRoutes.home:
        return const Homepage();
      case AppRoutes.explorer:
        return const ExplorerPage();
      case AppRoutes.qrCode:
        return const QrcodePage();
      case AppRoutes.offer:
        return const OfferPage();
      case AppRoutes.myProfile:
        return const MyProfilePage();
      default:
        return const Homepage();
    }
  }

  static void navigateWithTransition(BuildContext context, String routeName) {
    Navigator.of(context).pushReplacement(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            _getPageForRoute(routeName),
        settings: RouteSettings(name: routeName),
        transitionDuration: const Duration(milliseconds: 500),
        reverseTransitionDuration: const Duration(milliseconds: 350),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          // Incoming page animations
          const slideBegin = Offset(0.0, 0.015);
          const slideEnd = Offset.zero;
          final slideCurve = CurveTween(curve: Curves.easeOutExpo);

          var slideAnimation = Tween(
            begin: slideBegin,
            end: slideEnd,
          ).chain(slideCurve).animate(animation);

          // Fade with custom timing
          var fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
            CurvedAnimation(
              parent: animation,
              curve: const Interval(0.0, 0.65, curve: Curves.easeOut),
            ),
          );

          // Scale animation for depth effect
          var scaleAnimation = Tween<double>(begin: 0.96, end: 1.0).animate(
            CurvedAnimation(parent: animation, curve: Curves.easeOutCubic),
          );

          // Outgoing page fade out
          var secondaryFadeAnimation = Tween<double>(begin: 1.0, end: 0.0)
              .animate(
                CurvedAnimation(
                  parent: secondaryAnimation,
                  curve: const Interval(0.0, 0.5, curve: Curves.easeIn),
                ),
              );

          // Outgoing page slight scale down
          var secondaryScaleAnimation = Tween<double>(begin: 1.0, end: 0.95)
              .animate(
                CurvedAnimation(
                  parent: secondaryAnimation,
                  curve: Curves.easeInCubic,
                ),
              );

          return Stack(
            children: [
              // Outgoing page with fade and scale
              if (secondaryAnimation.status != AnimationStatus.dismissed)
                FadeTransition(
                  opacity: secondaryFadeAnimation,
                  child: ScaleTransition(
                    scale: secondaryScaleAnimation,
                    child: child,
                  ),
                ),
              // Incoming page with fade, slide and scale
              FadeTransition(
                opacity: fadeAnimation,
                child: SlideTransition(
                  position: slideAnimation,
                  child: ScaleTransition(scale: scaleAnimation, child: child),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

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
                  : () => navigateWithTransition(context, AppRoutes.home),
            ),
            _BottomNavItem(
              icon: Icons.grid_view_rounded,
              label: 'Explore',
              active: activeIndex == 1,
              onTap: activeIndex == 1
                  ? null
                  : () => navigateWithTransition(context, AppRoutes.explorer),
            ),
            _BottomNavItem(
              icon: Icons.qr_code_2_rounded,
              label: 'Scan',
              active: activeIndex == 2,
              onTap: activeIndex == 2
                  ? null
                  : () => navigateWithTransition(context, AppRoutes.qrCode),
            ),
            _BottomNavItem(
              icon: Icons.card_giftcard,
              label: 'Offers',
              active: activeIndex == 3,
              onTap: activeIndex == 3
                  ? null
                  : () => navigateWithTransition(context, AppRoutes.offer),
            ),
            _BottomNavItem(
              icon: Icons.person_outline,
              label: 'Profile',
              active: activeIndex == 4,
              onTap: activeIndex == 4
                  ? null
                  : () => navigateWithTransition(context, AppRoutes.myProfile),
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
