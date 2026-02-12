import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:onebnpl/app/routes.dart';

class Verificationcode extends StatefulWidget {
  const Verificationcode({super.key});

  @override
  State<Verificationcode> createState() => _VerificationcodeState();
}

class _VerificationcodeState extends State<Verificationcode> {
  final List<TextEditingController> _controllers = List.generate(
    5,
    (_) => TextEditingController(),
  );
  final List<FocusNode> _focusNodes = List.generate(5, (_) => FocusNode());

  @override
  void dispose() {
    for (final controller in _controllers) {
      controller.dispose();
    }
    for (final node in _focusNodes) {
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

            // Top left sign in
            const Positioned(
              top: 175,
              left: 18,
              child: Text(
                'Sign In',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            // Top right logo and tagline
            Positioned(
              top: 1,
              right: 20,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment:
                    CrossAxisAlignment.center, // center children horizontally
                children: [
                  SizedBox(
                    height: 150, // logo height
                    child: Image.asset(
                      'assets/images/bnpllogo.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                  Transform.translate(
                    offset: const Offset(0, -60), // move text upwards
                    child: const Text(
                      'Live Your Dreams Now',
                      textAlign: TextAlign.center, // center text
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
                  height: 680,
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
                            const SizedBox(height: 40),

                            const Text(
                              'Verify your Mobile Number',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xFF4C3EA6),
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(height: 4),
                            const Text(
                              'We just sent a 5-digit code to your mobile number.\nEnter it below.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 11.5,
                                color: Color(0xFF6F6F6F),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const SizedBox(height: 18),

                            // OTP boxes
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(5, (index) {
                                return Padding(
                                  padding: EdgeInsets.only(
                                    right: index == 4 ? 0 : 8,
                                  ),
                                  child: SizedBox(
                                    width: 48,
                                    height: 48,
                                    child: TextField(
                                      controller: _controllers[index],
                                      focusNode: _focusNodes[index],
                                      keyboardType: TextInputType.number,
                                      textAlign: TextAlign.center,
                                      maxLength: 1,
                                      inputFormatters: [
                                        FilteringTextInputFormatter.digitsOnly,
                                      ],
                                      decoration: InputDecoration(
                                        counterText: '',
                                        filled: true,
                                        fillColor: Colors.white,
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                          borderSide: const BorderSide(
                                            color: Color(0xFF8E83E8),
                                            width: 1,
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                          borderSide: const BorderSide(
                                            color: Color(0xFF4E46D9),
                                            width: 1.5,
                                          ),
                                        ),
                                      ),
                                      onChanged: (value) {
                                        if (value.isNotEmpty) {
                                          if (index < _focusNodes.length - 1) {
                                            _focusNodes[index + 1]
                                                .requestFocus();
                                          } else {
                                            _focusNodes[index].unfocus();
                                          }
                                        }
                                      },
                                    ),
                                  ),
                                );
                              }),
                            ),
                            const SizedBox(height: 18),

                            Align(
                              alignment: Alignment.center,
                              child: SizedBox(
                                width: 220,
                                height: 42,
                                child: ElevatedButton(
                                  onPressed: () {
                                    final codeComplete = _controllers.every(
                                      (controller) =>
                                          controller.text.trim().isNotEmpty,
                                    );
                                    if (!codeComplete) {
                                      ScaffoldMessenger.of(
                                        context,
                                      ).showSnackBar(
                                        const SnackBar(
                                          content: Text(
                                            'Enter the complete 5-digit code to continue.',
                                          ),
                                        ),
                                      );
                                      return;
                                    }
                                    Navigator.of(
                                      context,
                                    ).pushNamed(AppRoutes.signup);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF4E46D9),
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(11),
                                    ),
                                  ),
                                  child: const Text(
                                    'Verify',
                                    style: TextStyle(
                                      fontSize: 13.5,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),

                            RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Color(0xFF6F6F6F),
                                  fontWeight: FontWeight.w400,
                                ),
                                children: [
                                  const TextSpan(
                                    text: 'Already have an account? ',
                                  ),
                                  TextSpan(
                                    text: 'Sign In',
                                    style: const TextStyle(
                                      color: Color(0xFFE53935),
                                      fontWeight: FontWeight.w700,
                                    ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {},
                                  ),
                                ],
                              ),
                            ),

                            const Spacer(),

                            RichText(
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
                                    text: 'Terms and onditions',
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
                          ],
                        ),
                      ),

                      // Bottom illustration
                      Positioned(
                        left: 10,
                        bottom: 70,
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
}
