import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'profilecompleted.dart';

class Password extends StatelessWidget {
  const Password({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
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
                            'Enter Your Password',
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xFF4C3EA6),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 8),
                          const LabeledInput(obscure: true),
                          const SizedBox(height: 12),

                          const Text(
                            'Confirm Password',
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xFF4C3EA6),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 8),
                          const LabeledInput(obscure: true),

                          SizedBox(height: 20),

                          Align(
                            alignment: Alignment.centerRight,
                            child: SizedBox(
                              width: 170,
                              height: 38,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const Profilecompleted(),
                                    ),
                                  );
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
                              text: 'terms and conditions',
                              style: const TextStyle(
                                color: Color(0xFFE53935),
                                fontWeight: FontWeight.w600,
                              ),
                              recognizer: TapGestureRecognizer()..onTap = () {},
                            ),
                          ],
                        ),
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
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class LabeledInput extends StatelessWidget {
  final bool obscure;

  const LabeledInput({super.key, this.obscure = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 38,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Color(0x3D6C63C8),
            blurRadius: 8,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: TextField(
        obscureText: obscure,
        decoration: const InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        ),
      ),
    );
  }
}
