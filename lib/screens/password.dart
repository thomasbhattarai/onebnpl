import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:onebnpl/app/routes.dart';

class Password extends StatefulWidget {
  const Password({super.key});

  @override
  State<Password> createState() => _PasswordState();
}

class _PasswordState extends State<Password> {
  final List<TextEditingController> _pinControllers = List.generate(
    6,
    (_) => TextEditingController(),
  );
  final List<FocusNode> _pinFocusNodes = List.generate(6, (_) => FocusNode());
  final List<TextEditingController> _confirmControllers = List.generate(
    6,
    (_) => TextEditingController(),
  );
  final List<FocusNode> _confirmFocusNodes = List.generate(
    6,
    (_) => FocusNode(),
  );

  @override
  void dispose() {
    for (final controller in _pinControllers) {
      controller.dispose();
    }
    for (final node in _pinFocusNodes) {
      node.dispose();
    }
    for (final controller in _confirmControllers) {
      controller.dispose();
    }
    for (final node in _confirmFocusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // Background
            Positioned.fill(
              child: Image.asset('assets/images/bg.png', fit: BoxFit.cover),
            ),

            // Top centered logo and tagline
            Positioned(
              top: 10,
              left: 0,
              right: 0,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    'assets/images/bnpllogo.png',
                    width: 380,
                    height: 280,
                    fit: BoxFit.contain,
                  ),
                  Transform.translate(
                    offset: const Offset(0, -110), // move text upwards
                    child: const Text(
                      'Live Your Dreams Now',
                      textAlign: TextAlign.center, // center text
                      style: TextStyle(
                        fontSize: 15,
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

            // Main content card
            Positioned(
              left: 14,
              right: 14,
              bottom: 0,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(26),
                  topRight: Radius.circular(26),
                ),
                child: Container(
                  height: 520,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color(0xFFF3F0FF), Color(0xFF7A69FF)],
                    ),
                  ),
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 28, 20, 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Text(
                                  'Welcome,',
                                  style: TextStyle(
                                    fontSize: 22,
                                    color: Color(0xFF4C3EA6),
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Image.asset(
                                  'assets/images/creditcard.png',
                                  width: 70,
                                  height: 70,
                                ),
                              ],
                            ),
                            Transform.translate(
                              offset: const Offset(0, -10),
                              child: const Text(
                                'Hello there, sign up to continue.',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Color(0xFF6F6F6F),
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),

                            const Text(
                              'Enter Your PIN',
                              style: TextStyle(
                                fontSize: 12,
                                color: Color(0xFF4C3EA6),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 8),
                            _buildPinRow(
                              controllers: _pinControllers,
                              focusNodes: _pinFocusNodes,
                            ),
                            const SizedBox(height: 12),

                            const Text(
                              'Confirm PIN',
                              style: TextStyle(
                                fontSize: 12,
                                color: Color(0xFF4C3EA6),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 8),
                            _buildPinRow(
                              controllers: _confirmControllers,
                              focusNodes: _confirmFocusNodes,
                            ),

                            const SizedBox(height: 20),

                            Align(
                              alignment: Alignment.centerRight,
                              child: SizedBox(
                                width: 170,
                                height: 38,
                                child: ElevatedButton(
                                  onPressed: () {
                                    final pin = _pinControllers
                                        .map((controller) => controller.text)
                                        .join();
                                    final confirmPin = _confirmControllers
                                        .map((controller) => controller.text)
                                        .join();
                                    final pinComplete = _pinControllers.every(
                                      (controller) =>
                                          controller.text.isNotEmpty,
                                    );
                                    final confirmComplete = _confirmControllers
                                        .every(
                                          (controller) =>
                                              controller.text.isNotEmpty,
                                        );
                                    if (!pinComplete || !confirmComplete) {
                                      ScaffoldMessenger.of(
                                        context,
                                      ).showSnackBar(
                                        const SnackBar(
                                          content: Text(
                                            'Enter and confirm a 6-digit PIN.',
                                          ),
                                        ),
                                      );
                                      return;
                                    }
                                    if (pin != confirmPin) {
                                      ScaffoldMessenger.of(
                                        context,
                                      ).showSnackBar(
                                        const SnackBar(
                                          content: Text(
                                            'PINs do not match. Please try again.',
                                          ),
                                        ),
                                      );
                                      return;
                                    }
                                    Navigator.of(
                                      context,
                                    ).pushNamed(AppRoutes.profileCompleted);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF4E46D9),
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),

                                  child: const Text(
                                    'Create Account',
                                    style: TextStyle(
                                      fontSize: 12.5,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      Positioned(
                        left: 20,
                        right: 20,
                        bottom: 16,
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            style: const TextStyle(
                              fontSize: 16,
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontWeight: FontWeight.w400,
                            ),
                            children: [
                              const TextSpan(
                                text:
                                    'By Creating this account you agree with our ',
                              ),
                              TextSpan(
                                text: 'Terms and Conditions',
                                style: const TextStyle(
                                  color: Color(0xFFE53935),
                                  fontWeight: FontWeight.w600,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {},
                              ),
                            ],
                          ),
                        ),
                      ),

                      // Bottom illustration
                      Positioned(
                        left: 10,
                        bottom: 54,
                        child: IgnorePointer(
                          child: SizedBox(
                            width: 190,
                            height: 130,
                            child: Stack(
                              children: [
                                Positioned(
                                  left: 10,
                                  bottom: 0,
                                  child: Image.asset(
                                    'assets/images/gigure.png',
                                    width: 180,
                                    height: 140,
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
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPinRow({
    required List<TextEditingController> controllers,
    required List<FocusNode> focusNodes,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(6, (index) {
        return SizedBox(
          width: 42,
          height: 42,
          child: TextField(
            controller: controllers[index],
            focusNode: focusNodes[index],
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            maxLength: 1,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            decoration: InputDecoration(
              counterText: '',
              filled: true,
              fillColor: Colors.white,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: Color(0xFF8E83E8),
                  width: 1,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: Color(0xFF4E46D9),
                  width: 1.5,
                ),
              ),
            ),
            onChanged: (value) {
              if (value.isNotEmpty) {
                if (index < focusNodes.length - 1) {
                  focusNodes[index + 1].requestFocus();
                } else {
                  focusNodes[index].unfocus();
                }
              }
            },
          ),
        );
      }),
    );
  }
}
