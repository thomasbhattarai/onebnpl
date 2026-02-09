import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: [
            // Background
            Positioned.fill(
              child: Image.asset('image/assets/bg.png', fit: BoxFit.cover),
            ),

            Positioned(
              top: 120,
              left: 31,

              child: Image.asset(
                'image/assets/shopping-bag.png',
                width: 100,
                height: 80,
                fit: BoxFit.contain,
              ),
            ),
            Positioned(
              top: 260,
              right: 31,
              child: Image.asset(
                'image/assets/creditcard1.png',
                width: 100,
                height: 80,
                fit: BoxFit.contain,
              ),
            ),

            // Center hero (onebnpl logo)
            Positioned(
              top: 80,
              left: 0,
              right: 0,
              child: Center(
                child: Image.asset(
                  'image/assets/onebnpllogo.png',
                  width: 600,
                  height: 600,
                  fit: BoxFit.contain,
                ),
              ),
            ),

            // Top hero (logo + tagline)
            Positioned(
              top: 40,
              right: 24,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: const [
                  Image(
                    image: AssetImage('image/assets/bnpllogo.png'),
                    width: 160,
                    height: 60,
                    fit: BoxFit.contain,
                  ),
                  SizedBox(height: 1),
                  Text(
                    'Live Your Dreams Now',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.4,
                    ),
                  ),
                ],
              ),
            ),

            // Bottom Card
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
                  height: 480,
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
                        padding: const EdgeInsets.fromLTRB(20, 36, 20, 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Align(
                              alignment: Alignment.centerRight,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Image.asset(
                                    'image/assets/creditcard.png',
                                    width: 80,
                                    height: 80,
                                  ),
                                  const SizedBox(height: 8),
                                  RichText(
                                    text: const TextSpan(
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Color(0xFF4C3EA6),
                                        fontWeight: FontWeight.w500,
                                      ),
                                      children: [
                                        TextSpan(
                                          text: "Don't have an account? ",
                                        ),
                                        TextSpan(
                                          text: "Sign up",
                                          style: TextStyle(
                                            color: Color(0xFFE53935),
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 26),

                            // Inputs
                            const InputField(hint: "Username"),
                            const SizedBox(height: 16),
                            const InputField(hint: "Password", obscure: true),

                            const SizedBox(height: 22),

                            // Button
                            Center(
                              child: SizedBox(
                                width: 200,
                                height: 42,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF4E46D9),
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(11),
                                    ),
                                  ),
                                  child: const Text(
                                    "Create Account",
                                    style: TextStyle(
                                      fontSize: 13.5,
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
                        bottom: 12,
                        child: SizedBox(
                          width: 190,
                          height: 130,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 10,
                                bottom: 0,
                                child: Image.asset(
                                  'image/assets/gigure.png',
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

class InputField extends StatelessWidget {
  final String hint;
  final bool obscure;

  const InputField({super.key, required this.hint, this.obscure = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
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
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(fontSize: 12.5, color: Color(0xFF6F6F6F)),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
        ),
      ),
    );
  }
}
