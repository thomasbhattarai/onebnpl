import 'package:flutter/material.dart';

import 'package:onebnpl/screens/homepage.dart';
import 'package:onebnpl/screens/loginpage.dart';
import 'package:onebnpl/screens/myloans.dart';
import 'package:onebnpl/screens/password.dart';
import 'package:onebnpl/screens/phonenumberverify.dart';
import 'package:onebnpl/screens/profilecompleted.dart';
import 'package:onebnpl/screens/qrcode.dart';
import 'package:onebnpl/screens/signup.dart';
import 'package:onebnpl/screens/verificationcode.dart';

class AppRoutes {
  static const login = '/login';
  static const home = '/home';
  static const myLoans = '/my-loans';
  static const qrCode = '/qr-code';
  static const phoneVerify = '/phone-verify';
  static const verificationCode = '/verification-code';
  static const signup = '/signup';
  static const password = '/password';
  static const profileCompleted = '/profile-completed';
}

final Map<String, WidgetBuilder> appRoutes = {
  AppRoutes.login: (_) => const Loginpage(),
  AppRoutes.home: (_) => const Homepage(),
  AppRoutes.myLoans: (_) => const MyLoansPage(),
  AppRoutes.qrCode: (_) => const QrcodePage(),
  AppRoutes.phoneVerify: (_) => const Phonenumberverify(),
  AppRoutes.verificationCode: (_) => const Verificationcode(),
  AppRoutes.signup: (_) => const Signup(),
  AppRoutes.password: (_) => const Password(),
  AppRoutes.profileCompleted: (_) => const Profilecompleted(),
};
