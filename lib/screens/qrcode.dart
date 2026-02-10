import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import 'package:onebnpl/app/routes.dart';

const double _bottomNavHeight = 80;

class QrcodePage extends StatefulWidget {
  const QrcodePage({super.key});

  @override
  State<QrcodePage> createState() => _QrcodePageState();
}

class _QrcodePageState extends State<QrcodePage> {
  CameraController? _controller;
  late final Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    _initializeControllerFuture = _initCamera();
  }

  Future<void> _initCamera() async {
    try {
      final cameras = await availableCameras();
      if (cameras.isEmpty) {
        return;
      }
      final controller = CameraController(
        cameras.first,
        ResolutionPreset.high,
        enableAudio: false,
      );
      _controller = controller;
      await controller.initialize();
      if (!mounted) {
        await controller.dispose();
        return;
      }
      setState(() {});
    } catch (_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: false,
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(child: _buildCameraPreview()),
            Positioned.fill(child: _buildFrameOverlay()),
          ],
        ),
      ),
      bottomNavigationBar: _BottomNav(
        onHomeTap: () =>
            Navigator.pushReplacementNamed(context, AppRoutes.home),
      ),
    );
  }

  Widget _buildCameraPreview() {
    return FutureBuilder<void>(
      future: _initializeControllerFuture,
      builder: (context, snapshot) {
        if (_controller == null) {
          return const Center(
            child: Text(
              'Camera unavailable',
              style: TextStyle(color: Colors.white),
            ),
          );
        }
        if (snapshot.connectionState != ConnectionState.done) {
          return const Center(
            child: CircularProgressIndicator(color: Colors.white),
          );
        }
        return CameraPreview(_controller!);
      },
    );
  }

  Widget _buildFrameOverlay() {
    return LayoutBuilder(
      builder: (context, constraints) {
        final size = constraints.biggest;
        final frameSize = (size.shortestSide * 0.72).clamp(220.0, 320.0);
        final frameTop = (size.height - frameSize) / 2;
        final labelTop = (frameTop - 32).clamp(12.0, size.height);
        final logoTop = (frameTop + frameSize + 16).clamp(
          12.0,
          size.height - 80,
        );

        return Stack(
          children: [
            Positioned(
              top: labelTop,
              left: 0,
              right: 0,
              child: const Text(
                'Scan a QR code',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Center(
              child: Container(
                width: frameSize,
                height: frameSize,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 2),
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
            Positioned(
              top: logoTop,
              left: 0,
              right: 0,
              child: Column(
                mainAxisSize: MainAxisSize.min,
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
                    child: const Text(
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
                ],
              ),
            ),
          ],
        );
      },
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
            const _BottomNavItem(
              icon: Icons.qr_code_2_rounded,
              active: true,
              label: 'QR',
            ),
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
