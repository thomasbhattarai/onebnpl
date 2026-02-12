import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:onebnpl/app/routes.dart';
import 'package:onebnpl/widgets/phone_country_data.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  late Country _selectedCountry;
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _pinController = TextEditingController();
  final FocusNode _phoneFocusNode = FocusNode();
  final FocusNode _pinFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _selectedCountry = phoneCountries.firstWhere(
      (country) => country.code == 'NP',
      orElse: () => phoneCountries.first,
    );
    _phoneFocusNode.addListener(() {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
    _pinFocusNode.addListener(() {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    _phoneController.dispose();
    _pinController.dispose();
    _phoneFocusNode.dispose();
    _pinFocusNode.dispose();
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

            Positioned(
              top: 120,
              left: 31,

              child: Image.asset(
                'assets/images/shopping-bag.png',
                width: 100,
                height: 80,
                fit: BoxFit.contain,
              ),
            ),
            Positioned(
              top: 260,
              right: 31,
              child: Image.asset(
                'assets/images/creditcard1.png',
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
                child: SizedBox(
                  width: 600,
                  height: 600,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset(
                        'assets/images/onebnpllogo.png',
                        width: 600,
                        height: 600,
                        fit: BoxFit.contain,
                      ),
                      Align(
                        alignment: const Alignment(0, -0.5),
                        child: Text(
                          'Live Your Dreams Now',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.2,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Top hero (logo + tagline)
            // Top hero (logo + tagline)
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
                                    'assets/images/creditcard.png',
                                    width: 80,
                                    height: 80,
                                  ),
                                  const SizedBox(height: 8),
                                  RichText(
                                    text: TextSpan(
                                      style: const TextStyle(
                                        fontSize: 15,
                                        color: Color(0xFF4C3EA6),
                                        fontWeight: FontWeight.w500,
                                      ),
                                      children: [
                                        const TextSpan(
                                          text: "Don't have an account? ",
                                        ),
                                        TextSpan(
                                          text: "Sign up",
                                          style: const TextStyle(
                                            color: Color(0xFFE53935),
                                            fontWeight: FontWeight.w700,
                                          ),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {
                                              Navigator.of(context).pushNamed(
                                                AppRoutes.phoneVerify,
                                              );
                                            },
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 26),

                            // Inputs
                            const Text(
                              'Phone number',
                              style: TextStyle(
                                fontSize: 12,
                                color: Color(0xFF4C3EA6),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 8),
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
                                    child: GestureDetector(
                                      behavior: HitTestBehavior.opaque,
                                      onTap: () =>
                                          _phoneFocusNode.requestFocus(),
                                      child: Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              left: 4,
                                              right: 12,
                                            ),
                                            child: Row(
                                              children: List.generate(10, (
                                                index,
                                              ) {
                                                final text =
                                                    _phoneController.text;
                                                final char = index < text.length
                                                    ? text[index]
                                                    : '';
                                                final showCaret =
                                                    _phoneFocusNode.hasFocus &&
                                                    text.length < 10 &&
                                                    index == text.length;
                                                return Expanded(
                                                  child: Stack(
                                                    alignment: Alignment.center,
                                                    children: [
                                                      Text(
                                                        char,
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: const TextStyle(
                                                          fontSize: 16,
                                                          color: Color(
                                                            0xFF6F6F6F,
                                                          ),
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                      ),
                                                      if (showCaret)
                                                        Container(
                                                          width: 2,
                                                          height: 18,
                                                          decoration: BoxDecoration(
                                                            color: const Color(
                                                              0xFF4E46D9,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius.circular(
                                                                  2,
                                                                ),
                                                          ),
                                                        ),
                                                    ],
                                                  ),
                                                );
                                              }),
                                            ),
                                          ),
                                          Positioned.fill(
                                            child: TextField(
                                              controller: _phoneController,
                                              focusNode: _phoneFocusNode,
                                              keyboardType:
                                                  TextInputType.number,
                                              textAlign: TextAlign.start,
                                              textAlignVertical:
                                                  TextAlignVertical.center,
                                              maxLength: 10,
                                              inputFormatters: [
                                                FilteringTextInputFormatter
                                                    .digitsOnly,
                                                LengthLimitingTextInputFormatter(
                                                  10,
                                                ),
                                              ],
                                              style: const TextStyle(
                                                fontSize: 16,
                                                color: Colors.transparent,
                                                letterSpacing: 18,
                                                fontWeight: FontWeight.w600,
                                              ),
                                              showCursor: false,
                                              cursorColor: const Color(
                                                0xFF4E46D9,
                                              ),
                                              decoration: const InputDecoration(
                                                counterText: '',
                                                border: InputBorder.none,
                                                contentPadding:
                                                    EdgeInsets.symmetric(
                                                      horizontal: 4,
                                                      vertical: 12,
                                                    ),
                                              ),
                                              onChanged: (_) => setState(() {}),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 16),
                            const Text(
                              'PIN',
                              style: TextStyle(
                                fontSize: 12,
                                color: Color(0xFF4C3EA6),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 8),
                            GestureDetector(
                              behavior: HitTestBehavior.opaque,
                              onTap: () => _pinFocusNode.requestFocus(),
                              child: Container(
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
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 16,
                                      ),
                                      child: Row(
                                        children: List.generate(6, (index) {
                                          final text = _pinController.text;
                                          final showCaret =
                                              _pinFocusNode.hasFocus &&
                                              text.length < 6 &&
                                              index == text.length;
                                          final char = index < text.length
                                              ? text[index]
                                              : (showCaret ? '' : '_');
                                          return Expanded(
                                            child: Stack(
                                              alignment: Alignment.center,
                                              children: [
                                                Text(
                                                  char,
                                                  textAlign: TextAlign.center,
                                                  style: const TextStyle(
                                                    fontSize: 18,
                                                    color: Color(0xFF6F6F6F),
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                                if (showCaret)
                                                  Container(
                                                    width: 2,
                                                    height: 20,
                                                    decoration: BoxDecoration(
                                                      color: const Color(
                                                        0xFF4E46D9,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            2,
                                                          ),
                                                    ),
                                                  ),
                                              ],
                                            ),
                                          );
                                        }),
                                      ),
                                    ),
                                    Positioned.fill(
                                      child: TextField(
                                        controller: _pinController,
                                        focusNode: _pinFocusNode,
                                        keyboardType: TextInputType.number,
                                        textAlign: TextAlign.start,
                                        textAlignVertical:
                                            TextAlignVertical.center,
                                        maxLength: 6,
                                        inputFormatters: [
                                          FilteringTextInputFormatter
                                              .digitsOnly,
                                        ],
                                        style: const TextStyle(
                                          fontSize: 18,
                                          color: Colors.transparent,
                                          letterSpacing: 18,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        showCursor: false,
                                        cursorColor: const Color(0xFF4E46D9),
                                        decoration: const InputDecoration(
                                          counterText: '',
                                          border: InputBorder.none,
                                          contentPadding: EdgeInsets.symmetric(
                                            horizontal: 16,
                                            vertical: 12,
                                          ),
                                        ),
                                        onChanged: (_) => setState(() {}),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            const SizedBox(height: 22),

                            // Button
                            Center(
                              child: SizedBox(
                                width: 200,
                                height: 42,
                                child: ElevatedButton(
                                  onPressed: () {
                                    final phone = _phoneController.text.trim();
                                    final pin = _pinController.text.trim();
                                    final phoneValid =
                                        _selectedCountry.code == 'NP'
                                        ? phone.length == 10
                                        : phone.length >= 7;
                                    final pinValid = pin.length == 6;
                                    if (!phoneValid || !pinValid) {
                                      ScaffoldMessenger.of(
                                        context,
                                      ).showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            _selectedCountry.code == 'NP'
                                                ? 'Enter a 10-digit Nepal phone number and 6-digit PIN.'
                                                : 'Enter a valid phone number and 6-digit PIN.',
                                          ),
                                        ),
                                      );
                                      return;
                                    }

                                    Navigator.of(
                                      context,
                                    ).pushReplacementNamed(AppRoutes.home);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF4E46D9),
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(11),
                                    ),
                                  ),
                                  child: const Text(
                                    "Login",
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
