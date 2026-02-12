import 'dart:async';

import 'package:app_settings/app_settings.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

import 'package:onebnpl/app/routes.dart';

class ConnectivityGate extends StatefulWidget {
  const ConnectivityGate({super.key});

  @override
  State<ConnectivityGate> createState() => _ConnectivityGateState();
}

class _ConnectivityGateState extends State<ConnectivityGate> {
  bool? _hasConnection;
  bool _navigated = false;
  late final StreamSubscription<List<ConnectivityResult>> _subscription;

  @override
  void initState() {
    super.initState();
    _checkNow();
    _subscription = Connectivity().onConnectivityChanged.listen(
      _handleConnectivityChange,
    );
  }

  Future<bool> _checkNow() async {
    final results = await Connectivity().checkConnectivity();
    _updateStatus(results);
    return _isConnected(results);
  }

  void _handleConnectivityChange(List<ConnectivityResult> results) {
    _updateStatus(results);
  }

  bool _isConnected(List<ConnectivityResult> results) {
    return results.any((result) => result != ConnectivityResult.none);
  }

  void _updateStatus(List<ConnectivityResult> results) {
    final hasConnection = _isConnected(results);
    if (!mounted) {
      return;
    }

    setState(() {
      _hasConnection = hasConnection;
    });

    if (hasConnection && !_navigated) {
      _navigated = true;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) {
          return;
        }
        Navigator.of(context).pushReplacementNamed(AppRoutes.login);
      });
    }
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_hasConnection == null) {
      return const Scaffold(
        body: SafeArea(child: Center(child: CircularProgressIndicator())),
      );
    }

    if (_hasConnection == true) {
      return const SizedBox.shrink();
    }

    return ConnectivityScreen(onRefresh: _checkNow);
  }
}

class ConnectivityScreen extends StatelessWidget {
  const ConnectivityScreen({super.key, required this.onRefresh});

  final Future<bool> Function() onRefresh;

  void _showPlaceholderSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), behavior: SnackBarBehavior.floating),
    );
  }

  Future<void> _openNetworkSettings(BuildContext context) async {
    try {
      await AppSettings.openAppSettings(type: AppSettingsType.wifi);
    } catch (_) {
      if (!context.mounted) {
        return;
      }
      _showPlaceholderSnackBar(
        context,
        'Unable to open network settings on this device.',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFF5B4BFF);
    const cardTop = Color(0xFFF6F4FF);
    const cardBottom = Color(0xFF7B6CFF);

    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/bg.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
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
              Expanded(
                child: Center(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    padding: const EdgeInsets.fromLTRB(20, 24, 20, 24),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [cardTop, cardBottom],
                      ),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          'Oops, Connection Lost',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Icon(
                          Icons.wifi_off,
                          size: 56,
                          color: Colors.black26,
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'Seems like you\'re offline,\nPlease make sure your internet is working fine',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 12, color: Colors.black54),
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () async {
                              await _openNetworkSettings(context);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: primaryColor,
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14),
                              ),
                            ),
                            child: const Text('Network Settings'),
                          ),
                        ),
                        const SizedBox(height: 12),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () async {
                              final hasConnection = await onRefresh();
                              if (!context.mounted) {
                                return;
                              }
                              if (!hasConnection) {
                                _showPlaceholderSnackBar(
                                  context,
                                  'Still offline. Please check your connection.',
                                );
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.black87,
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14),
                              ),
                            ),
                            child: const Text('Refresh Now'),
                          ),
                        ),
                        const SizedBox(height: 12),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              _showPlaceholderSnackBar(
                                context,
                                'SMS mode is not available yet.',
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.black87,
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14),
                              ),
                            ),
                            child: const Text('Use SMS Mode'),
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextButton.icon(
                          onPressed: () {
                            _showPlaceholderSnackBar(
                              context,
                              'Contact support is not configured yet.',
                            );
                          },
                          icon: const Icon(Icons.call_outlined),
                          label: const Text('Contact Us'),
                          style: TextButton.styleFrom(
                            foregroundColor: primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
