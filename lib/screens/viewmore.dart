import 'package:flutter/material.dart';
import 'package:onebnpl/data/user_profile_data.dart';
import 'package:onebnpl/models/user_profile.dart';
import 'package:onebnpl/widgets/bottom_navigation.dart';

class ViewMorePage extends StatefulWidget {
  const ViewMorePage({super.key});

  @override
  State<ViewMorePage> createState() => _ViewMorePageState();
}

class _ViewMorePageState extends State<ViewMorePage> {
  final TextEditingController _searchController = TextEditingController();

  final List<_IconInfo> _iconItems = const [
    _IconInfo(
      icon: Icons.home_filled,
      title: 'Home',
      description: 'Home icon for dashboard and main landing screen.',
    ),
    _IconInfo(
      icon: Icons.grid_view_rounded,
      title: 'Explore',
      description: 'Explore icon for categories and product discovery.',
    ),
    _IconInfo(
      icon: Icons.qr_code_scanner,
      title: 'QR Scanner',
      description: 'QR scanner icon for scan and pay actions.',
    ),
    _IconInfo(
      icon: Icons.local_offer,
      title: 'Offers',
      description: 'Offers icon for discount and promotional products.',
    ),
    _IconInfo(
      icon: Icons.tv_rounded,
      title: 'Electronics',
      description: 'Category icon for laptops, gadgets, and electronics.',
    ),
    _IconInfo(
      icon: Icons.kitchen_rounded,
      title: 'Home Appliances',
      description: 'Category icon for kitchen and home appliance products.',
    ),
    _IconInfo(
      icon: Icons.directions_car,
      title: 'Vehicle Accessories',
      description: 'Category icon for car and vehicle accessory products.',
    ),
    _IconInfo(
      icon: Icons.notifications_none,
      title: 'Notifications',
      description: 'Notification bell icon for app alerts and updates.',
    ),
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final query = _searchController.text.trim().toLowerCase();
    final filteredItems = query.isEmpty
        ? _iconItems
        : _iconItems
            .where(
              (item) =>
                  item.title.toLowerCase().contains(query) ||
                  item.description.toLowerCase().contains(query),
            )
            .toList();

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
                                    hintText: 'Search Icons',
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
                                Icons.more_horiz,
                                size: 14,
                                color: Color(0xFF5A4ED1),
                              ),
                              SizedBox(width: 6),
                              Text(
                                'View More',
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
                        const Text(
                          'Icons and Descriptions',
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFF4C3EA6),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Expanded(
                          child: ListView.separated(
                            padding: const EdgeInsets.only(bottom: 90),
                            itemCount: filteredItems.length,
                            separatorBuilder: (_, __) => const SizedBox(height: 8),
                            itemBuilder: (context, index) {
                              final item = filteredItems[index];
                              return Container(
                                padding: const EdgeInsets.all(10),
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
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 34,
                                      height: 34,
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFF2EDFF),
                                        borderRadius: BorderRadius.circular(9),
                                      ),
                                      child: Icon(
                                        item.icon,
                                        size: 20,
                                        color: const Color(0xFF4C3EA6),
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            item.title,
                                            style: const TextStyle(
                                              fontSize: 12,
                                              color: Color(0xFF1E1E1E),
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          const SizedBox(height: 4),
                                          Text(
                                            item.description,
                                            style: const TextStyle(
                                              fontSize: 10.5,
                                              color: Color(0xFF6F6F6F),
                                              fontWeight: FontWeight.w500,
                                              height: 1.2,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
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

class _IconInfo {
  final IconData icon;
  final String title;
  final String description;

  const _IconInfo({
    required this.icon,
    required this.title,
    required this.description,
  });
}
