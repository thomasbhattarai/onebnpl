import 'package:flutter/material.dart';
import 'package:onebnpl/app/routes.dart';
import 'package:onebnpl/data/finance_summary_data.dart';
import 'package:onebnpl/data/promo_card_data.dart';
import 'package:onebnpl/data/top_items_data.dart';
import 'package:onebnpl/data/user_profile_data.dart';
import 'package:onebnpl/models/finance_summary.dart';
import 'package:onebnpl/models/promo_card.dart';
import 'package:onebnpl/models/top_item.dart';
import 'package:onebnpl/models/user_profile.dart';
import 'package:onebnpl/screens/explorer.dart';
import 'package:onebnpl/widgets/bottom_navigation.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) async {
        if (didPop) return;

        final shouldLogout = await showDialog<bool>(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Logout'),
            content: const Text('Are you sure you want to logout?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text('No'),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: const Text('Yes'),
              ),
            ],
          ),
        );

        if (shouldLogout == true && context.mounted) {
          Navigator.of(
            context,
          ).pushNamedAndRemoveUntil(AppRoutes.login, (route) => false);
        }
      },
      child: Scaffold(
        extendBody: false,
        body: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Stack(
                children: [
                  Positioned.fill(
                    child: Image.asset(
                      'assets/images/bg.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  SingleChildScrollView(
                    padding: const EdgeInsets.fromLTRB(16, 10, 16, 0),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: constraints.maxHeight - bottomNavHeight,
                      ),
                      child: IntrinsicHeight(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Align(
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
                                  24,
                                  16,
                                  56,
                                ),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
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
                                            left: 0,
                                            top: 0,
                                            child: Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                    horizontal: 12,
                                                    vertical: 8,
                                                  ),
                                              decoration: BoxDecoration(
                                                color: const Color(0xFF6A5AFF),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: FutureBuilder<FinanceSummary>(
                                                future:
                                                    FinanceSummaryRepository.fetchSummary(),
                                                builder: (context, snapshot) {
                                                  final summary = snapshot.data;
                                                  final text = summary == null
                                                      ? 'Loading...'
                                                      : 'My Balance: ${summary.balance}\n'
                                                            'My Loan: ${summary.loan}\n'
                                                            'No of EMI: ${summary.emiCount}\n'
                                                            'Nearest EMI: ${summary.nearestEmi}';

                                                  return Text(
                                                    text,
                                                    style: const TextStyle(
                                                      fontSize: 10,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      height: 1.2,
                                                    ),
                                                  );
                                                },
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
                                            onTap: () {
                                              Navigator.of(context).push(
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      ExplorerPage(),
                                                ),
                                              );
                                            },
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
                                      future:
                                          TopItemsRepository.fetchTopItems(),
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
                                                        color: Color(
                                                          0xFF6F6F6F,
                                                        ),
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
                                                    label:
                                                        displayItems[i].label,
                                                    assetPath: displayItems[i]
                                                        .assetPath,
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
                                    FutureBuilder<PromoCard>(
                                      future:
                                          PromoCardRepository.fetchPromoCard(),
                                      builder: (context, snapshot) {
                                        final promo = snapshot.data;
                                        if (promo == null) {
                                          return Container(
                                            height: 140,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(14),
                                            ),
                                            child: const Text(
                                              'Loading...',
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Color(0xFF6F6F6F),
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          );
                                        }

                                        return Container(
                                          height: 140,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              14,
                                            ),
                                            image: DecorationImage(
                                              image: AssetImage(
                                                promo.imagePath,
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
                                                Text(
                                                  promo.title,
                                                  style: const TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w800,
                                                  ),
                                                ),
                                                Text(
                                                  promo.subtitle,
                                                  style: const TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.white70,
                                                  ),
                                                ),
                                                const Spacer(),
                                                GestureDetector(
                                                  onTap: () {
                                                    Navigator.pushNamed(
                                                      context,
                                                      AppRoutes.offer,
                                                    );
                                                  },
                                                  child: Container(
                                                    padding:
                                                        const EdgeInsets.symmetric(
                                                          horizontal: 10,
                                                          vertical: 6,
                                                        ),
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            12,
                                                          ),
                                                    ),
                                                    child: Text(
                                                      promo.ctaText,
                                                      style: const TextStyle(
                                                        fontSize: 10,
                                                        color: Color(
                                                          0xFF4E46D9,
                                                        ),
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
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
        bottomNavigationBar: const AppBottomNavigation(activeIndex: 0),
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
