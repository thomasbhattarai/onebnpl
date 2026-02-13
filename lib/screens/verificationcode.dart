import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:onebnpl/app/routes.dart';
import 'package:onebnpl/services/auth_service.dart';

class Verificationcode extends StatefulWidget {
  const Verificationcode({super.key});

  @override
  State<Verificationcode> createState() => _VerificationcodeState();
}

class _VerificationcodeState extends State<Verificationcode> {
  late String _phoneNumber;
  late String _fullName;

  final TextEditingController _pinController = TextEditingController();
  final FocusNode _pinFocusNode = FocusNode();
  final AuthService _authService = AuthService();
  bool _isLoading = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    if (args != null) {
      _phoneNumber = args['phone'] ?? '';
      _fullName = args['fullName'] ?? '';
    }
  }

  @override
  void dispose() {
    _pinController.dispose();
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

            // Top left sign up
            const Positioned(
              top: 175,
              left: 18,
              child: Text(
                'Create PIN',
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
                              'Create Your PIN',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xFF4C3EA6),
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(height: 4),
                            const Text(
                              'Enter a 6-digit PIN for your account security.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 11.5,
                                color: Color(0xFF6F6F6F),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const SizedBox(height: 18),

                            // PIN input field
                            GestureDetector(
                              behavior: HitTestBehavior.opaque,
                              onTap: () => _pinFocusNode.requestFocus(),
                              child: Container(
                                height: 54,
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
                            const SizedBox(height: 28),

                            // Sign up button
                            Align(
                              alignment: Alignment.centerRight,
                              child: SizedBox(
                                width: 220,
                                height: 42,
                                child: ElevatedButton(
                                  onPressed: _isLoading
                                      ? null
                                      : () async {
                                          final pin = _pinController.text
                                              .trim();
                                          if (pin.length != 6) {
                                            ScaffoldMessenger.of(
                                              context,
                                            ).showSnackBar(
                                              const SnackBar(
                                                content: Text(
                                                  'Enter a 6-digit PIN to continue.',
                                                ),
                                              ),
                                            );
                                            return;
                                          }

                                          setState(() => _isLoading = true);
                                          try {
                                            await _authService.signup(
                                              fullName: _fullName,
                                              phoneNumber: _phoneNumber,
                                              password: pin,
                                            );

                                            if (!mounted) return;

                                            ScaffoldMessenger.of(
                                              context,
                                            ).showSnackBar(
                                              const SnackBar(
                                                content: Text(
                                                  'Sign up successful! Please log in.',
                                                ),
                                                backgroundColor: Colors.green,
                                              ),
                                            );

                                            Navigator.of(
                                              context,
                                            ).pushReplacementNamed(
                                              AppRoutes.login,
                                            );
                                          } catch (e) {
                                            setState(() => _isLoading = false);
                                            if (!mounted) return;

                                            ScaffoldMessenger.of(
                                              context,
                                            ).showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  'Sign up failed: ${e.toString()}',
                                                ),
                                                backgroundColor: Colors.red,
                                              ),
                                            );
                                          }
                                        },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF4E46D9),
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(11),
                                    ),
                                  ),
                                  child: _isLoading
                                      ? const SizedBox(
                                          height: 20,
                                          width: 20,
                                          child: CircularProgressIndicator(
                                            strokeWidth: 2,
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                                  Colors.white,
                                                ),
                                          ),
                                        )
                                      : const Text(
                                          'Sign Up',
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
                                      ..onTap = () {
                                        Navigator.of(
                                          context,
                                        ).pushReplacementNamed(AppRoutes.login);
                                      },
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
                          ],
                        ),
                      ),

                      // Bottom illustration
                      Positioned(
                        left: 10,
                        bottom: 70,
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
