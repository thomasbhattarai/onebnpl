import 'package:flutter/material.dart';
import 'password.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
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
                      padding: const EdgeInsets.fromLTRB(18, 18, 18, 16),
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
                                width: 60,
                                height: 60,
                              ),
                            ],
                          ),
                          Transform.translate(
                            offset: const Offset(0, -10),
                            child: const Text(
                              'Hello there, sign in to continue.',
                              style: TextStyle(
                                fontSize: 13,
                                color: Color(0xFF6F6F6F),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          const SizedBox(height: 4),

                          Row(
                            children: const [
                              Expanded(
                                child: Divider(
                                  color: Color(0xFF7B6FF0),
                                  thickness: 1,
                                ),
                              ),
                              SizedBox(width: 8),
                              Text(
                                'Personal Details',
                                style: TextStyle(
                                  fontSize: 11.5,
                                  color: Color(0xFF4C3EA6),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(width: 8),
                              Expanded(
                                child: Divider(
                                  color: Color(0xFF7B6FF0),
                                  thickness: 1,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 6),

                          const LabeledInput(label: 'First Name :'),
                          const SizedBox(height: 6),
                          const LabeledInput(label: 'Middle Name :'),
                          const SizedBox(height: 6),
                          const LabeledInput(label: 'Last Name :'),
                          const SizedBox(height: 6),

                          const Text(
                            'Gender :',
                            style: TextStyle(
                              fontSize: 11.5,
                              color: Color(0xFF4C3EA6),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              GenderOption(label: 'Male'),
                              GenderOption(label: 'Female'),
                              GenderOption(label: 'Others'),
                            ],
                          ),
                          const SizedBox(height: 6),

                          const DropdownField(label: 'Province :'),
                          const SizedBox(height: 6),
                          const DropdownField(label: 'City :'),
                          const SizedBox(height: 6),
                          const LabeledInput(label: 'Email :'),

                          const SizedBox(height: 20),

                          Align(
                            alignment: Alignment.centerRight,
                            child: SizedBox(
                              width: 130,
                              height: 32,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => const Password(),
                                    ),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF4E46D9),
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(9),
                                  ),
                                ),
                                child: const Text(
                                  'Next Page',
                                  style: TextStyle(
                                    fontSize: 12,
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

                    // Bottom illustration
                    Positioned(
                      left: 8,
                      bottom: 10,
                      child: SizedBox(
                        width: 170,
                        height: 110,
                        child: Stack(
                          children: [
                            Positioned(
                              left: 10,
                              bottom: 0,
                              child: Image.asset(
                                'assets/images/gigure.png',
                                width: 160,
                                height: 120,
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
  final String label;

  const LabeledInput({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 11.5,
            color: Color(0xFF4C3EA6),
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 6),
        Container(
          height: 32,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(9),
            boxShadow: const [
              BoxShadow(
                color: Color(0x3D6C63C8),
                blurRadius: 8,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: const TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            ),
          ),
        ),
      ],
    );
  }
}

class GenderOption extends StatelessWidget {
  final String label;

  const GenderOption({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 11.5,
            color: Color(0xFF4C3EA6),
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(width: 6),
        Container(
          width: 28,
          height: 26,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(7),
            boxShadow: const [
              BoxShadow(
                color: Color(0x3D6C63C8),
                blurRadius: 6,
                offset: Offset(0, 2),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class DropdownField extends StatelessWidget {
  final String label;

  const DropdownField({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 11.5,
            color: Color(0xFF4C3EA6),
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 6),
        Container(
          height: 32,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(9),
            boxShadow: const [
              BoxShadow(
                color: Color(0x3D6C63C8),
                blurRadius: 8,
                offset: Offset(0, 3),
              ),
            ],
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            children: const [
              Expanded(child: SizedBox()),
              Icon(Icons.keyboard_arrow_down, color: Color(0xFF6F6F6F)),
            ],
          ),
        ),
      ],
    );
  }
}
