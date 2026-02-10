import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class Profilecompleted extends StatelessWidget {
  const Profilecompleted({super.key});

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
                  height: 560,
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
                        padding: const EdgeInsets.fromLTRB(20, 26, 20, 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const SizedBox(height: 10),
                            Center(
                              child: Image.asset(
                                'assets/images/party-popper.png',
                                width: 90,
                                height: 90,
                                fit: BoxFit.contain,
                              ),
                            ),
                            const SizedBox(height: 14),
                            const Center(
                              child: Text(
                                'Yay! Your Profile is completed.',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Color(0xFF4C3EA6),
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            const Center(
                              child: Text(
                                'We have sent a confirmation email to your registered email address.\nIf the email address is incorrect, please update it.',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Color(0xFF6F6F6F),
                                  fontWeight: FontWeight.w400,
                                  height: 1.3,
                                ),
                              ),
                            ),
                            const SizedBox(height: 16),
                            Center(
                              child: SizedBox(
                                width: 150,
                                height: 36,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF4E46D9),
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  child: const Text(
                                    'Continue',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const Spacer(),
                          ],
                        ),
                      ),

                      // Bottom illustration
                      Positioned(
                        left: 10,
                        bottom: 54,
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

                      // Terms and conditions at bottom
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
