import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:onebnpl/app/routes.dart';
import 'package:onebnpl/widgets/phone_country_data.dart';

class Phonenumberverify extends StatefulWidget {
  const Phonenumberverify({super.key});

  @override
  State<Phonenumberverify> createState() => _PhonenumberverifyState();
}

class _PhonenumberverifyState extends State<Phonenumberverify> {
  late Country _selectedCountry;
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _selectedCountry = phoneCountries.firstWhere(
      (country) => country.code == 'NP',
      orElse: () => phoneCountries.first,
    );
  }

  @override
  void dispose() {
    _phoneController.dispose();
    _emailController.dispose();
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
                            // Welcome text and credit card on same line
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Text(
                                  "Welcome,",
                                  style: TextStyle(
                                    fontSize: 22,
                                    color: Color(0xFF4C3EA6),
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Image.asset(
                                  'assets/images/creditcard.png',
                                  width: 80,
                                  height: 80,
                                ),
                              ],
                            ),

                            // Negative gap using Transform
                            Transform.translate(
                              offset: const Offset(
                                0,
                                -20,
                              ), // move up by 4 pixels
                              child: const Text(
                                "Verify with phone number or email.",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xFF6F6F6F),
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),

                            const SizedBox(height: 22),

                            const Text(
                              "Enter Your Mobile Number :",
                              style: TextStyle(
                                fontSize: 12,
                                color: Color(0xFF4C3EA6),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 8),

                            // Phone number input with country selector
                            Container(
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
                              child: Row(
                                children: [
                                  const SizedBox(width: 8),
                                  DropdownButtonHideUnderline(
                                    child: DropdownButton<Country>(
                                      value: _selectedCountry,
                                      isDense: true,
                                      icon: const Icon(
                                        Icons.keyboard_arrow_down,
                                        color: Color(0xFF6F6F6F),
                                      ),
                                      items: phoneCountries
                                          .map(
                                            (
                                              country,
                                            ) => DropdownMenuItem<Country>(
                                              value: country,
                                              child: Row(
                                                children: [
                                                  Text(
                                                    flagEmoji(country.code),
                                                    style: const TextStyle(
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                  const SizedBox(width: 6),
                                                  Text(
                                                    '${country.code} ${country.dialCode}',
                                                    style: const TextStyle(
                                                      fontSize: 12,
                                                      color: Color(0xFF4C3EA6),
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                  const SizedBox(width: 8),
                                                ],
                                              ),
                                            ),
                                          )
                                          .toList(),
                                      onChanged: (value) {
                                        if (value == null) {
                                          return;
                                        }
                                        setState(() {
                                          _selectedCountry = value;
                                        });
                                      },
                                    ),
                                  ),
                                  const VerticalDivider(
                                    width: 16,
                                    thickness: 1,
                                    color: Color(0xFFE0E0E0),
                                  ),
                                  Expanded(
                                    child: TextField(
                                      controller: _phoneController,
                                      decoration: const InputDecoration(
                                        hintText: "",
                                        hintStyle: TextStyle(
                                          fontSize: 12.5,
                                          color: Color(0xFF6F6F6F),
                                        ),
                                        border: InputBorder.none,
                                        contentPadding: EdgeInsets.symmetric(
                                          horizontal: 12,
                                          vertical: 12,
                                        ),
                                      ),
                                      keyboardType: TextInputType.phone,
                                      inputFormatters: [
                                        FilteringTextInputFormatter.digitsOnly,
                                        if (_selectedCountry.code == 'NP')
                                          LengthLimitingTextInputFormatter(10),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 14),

                            Row(
                              children: const [
                                Expanded(
                                  child: Divider(
                                    color: Color(0xFFBDBDBD),
                                    thickness: 1,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 8),
                                  child: Text(
                                    "OR",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xFF6F6F6F),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Divider(
                                    color: Color(0xFFBDBDBD),
                                    thickness: 1,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 14),

                            const Text(
                              "Enter Your Email :",
                              style: TextStyle(
                                fontSize: 12,
                                color: Color(0xFF4C3EA6),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 8),

                            // Email input
                            Container(
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
                                controller: _emailController,
                                decoration: const InputDecoration(
                                  hintText: "",
                                  hintStyle: TextStyle(
                                    fontSize: 12.5,
                                    color: Color(0xFF6F6F6F),
                                  ),
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 12,
                                  ),
                                ),
                                keyboardType: TextInputType.emailAddress,
                              ),
                            ),
                            const SizedBox(height: 20),

                            // Continue button
                            Align(
                              alignment: Alignment.centerRight,
                              child: SizedBox(
                                width: 150,
                                height: 42,
                                child: ElevatedButton(
                                  onPressed: () {
                                    final phone = _phoneController.text.trim();
                                    final email = _emailController.text.trim();
                                    if (phone.isEmpty && email.isEmpty) {
                                      ScaffoldMessenger.of(
                                        context,
                                      ).showSnackBar(
                                        const SnackBar(
                                          content: Text(
                                            'Enter a phone number or an email to continue.',
                                          ),
                                        ),
                                      );
                                      return;
                                    }
                                    final phoneValid = phone.isEmpty
                                        ? true
                                        : _selectedCountry.code == 'NP'
                                        ? phone.length == 10
                                        : phone.length >= 7;
                                    final emailValid = email.isEmpty
                                        ? true
                                        : RegExp(
                                            r'^[^@\s]+@[^@\s]+\.[^@\s]+$',
                                          ).hasMatch(email);
                                    if (!phoneValid || !emailValid) {
                                      ScaffoldMessenger.of(
                                        context,
                                      ).showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            _selectedCountry.code == 'NP'
                                                ? 'Enter a 10-digit Nepal phone number or a valid email.'
                                                : 'Enter a valid phone number or a valid email.',
                                          ),
                                        ),
                                      );
                                      return;
                                    }
                                    Navigator.of(
                                      context,
                                    ).pushNamed(AppRoutes.verificationCode);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF4E46D9),
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(11),
                                    ),
                                  ),
                                  child: const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Next",
                                        style: TextStyle(
                                          fontSize: 13.5,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white,
                                        ),
                                      ),
                                      SizedBox(width: 8),
                                      Icon(
                                        Icons.arrow_forward,
                                        size: 18,
                                        color: Colors.white,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const Spacer(),

                            // Terms and conditions
                            RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Color.fromARGB(255, 255, 251, 251),
                                  fontWeight: FontWeight.w400,
                                ),
                                children: [
                                  const TextSpan(
                                    text:
                                        "By Creating this account you agree with our ",
                                  ),
                                  TextSpan(
                                    text: "Terms and Conditions",
                                    style: const TextStyle(
                                      color: Color(0xFFE53935),
                                      fontWeight: FontWeight.w600,
                                    ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        // Navigate to terms and conditions
                                      },
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
                        bottom: 55,
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
}
