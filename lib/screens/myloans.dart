import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:onebnpl/app/routes.dart';
import 'package:onebnpl/data/loans_data.dart';
import 'package:onebnpl/models/loan.dart';
import 'package:onebnpl/services/loan_service.dart';
import 'package:onebnpl/widgets/bottom_navigation.dart';
import 'myloandetails.dart';

class MyLoansPage extends StatefulWidget {
  const MyLoansPage({super.key});

  @override
  State<MyLoansPage> createState() => _MyLoansPageState();
}

class _MyLoansPageState extends State<MyLoansPage> {
  final LoanService _loanService = LoanService();
  final List<Loan> _fallbackLoans = demoLoans;
  late Future<List<Loan>> _loansFuture;

  @override
  void initState() {
    super.initState();
    _loansFuture = _loanService.fetchLoans();
  }

  void _retryLoad() {
    setState(() {
      _loansFuture = _loanService.fetchLoans();
    });
  }

  Widget _buildLoansList(List<Loan> loans) {
    return Column(
      children: [
        for (int i = 0; i < loans.length; i++) ...[
          _LoanCard(loan: loans[i]),
          if (i != loans.length - 1) const SizedBox(height: 12),
        ],
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Stack(
              children: [
                Positioned.fill(
                  child: Image.asset('assets/images/bg.png', fit: BoxFit.cover),
                ),
                SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight,
                    ),
                    child: IntrinsicHeight(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Positioned(
                            top: 1,
                            left: 16,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 150,
                                  height: 150,
                                  child: Image.asset(
                                    'assets/images/bnpllogo.png',
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                Transform.translate(
                                  offset: const Offset(0, -60),
                                  child: const SizedBox(
                                    width: 150,
                                    child: Center(
                                      child: Text(
                                        'Live Your Dreams Now',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 10,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400,
                                          letterSpacing: 0.25,
                                          height: 1.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 12),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Color(0xFFF2EDFF),
                                    Color(0xFF6C5BFF),
                                  ],
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(18),
                                  topRight: Radius.circular(18),
                                ),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color(0x26000000),
                                    blurRadius: 12,
                                    offset: Offset(0, 6),
                                  ),
                                ],
                              ),
                              padding: const EdgeInsets.fromLTRB(
                                16,
                                16,
                                16,
                                20,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Hi,',
                                            style: TextStyle(
                                              fontSize: 13.5,
                                              color: Color(0xFF4C3EA6),
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          SizedBox(height: 2),
                                          Text(
                                            'Thomas Bhattarai',
                                            style: TextStyle(
                                              fontSize: 13.5,
                                              color: Color(0xFF4C3EA6),
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        width: 32,
                                        height: 32,
                                        decoration: BoxDecoration(
                                          color: const Color(0xFFEDE7FF),
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                        ),
                                        child: const Icon(
                                          Icons.notifications_none,
                                          color: Color(0xFF4E46D9),
                                          size: 20,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  GestureDetector(
                                    onTap: () => Navigator.pushReplacementNamed(
                                      context,
                                      AppRoutes.home,
                                    ),
                                    child: const Row(
                                      children: [
                                        Icon(
                                          Icons.arrow_back_ios_new,
                                          size: 14,
                                          color: Color(0xFF6A5AFF),
                                        ),
                                        SizedBox(width: 6),
                                        Text(
                                          'My Loans',
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Color(0xFF6A5AFF),
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  FutureBuilder<List<Loan>>(
                                    future: _loansFuture,
                                    builder: (context, snapshot) {
                                      if (snapshot.connectionState ==
                                          ConnectionState.waiting) {
                                        return const Padding(
                                          padding: EdgeInsets.symmetric(
                                            vertical: 24,
                                          ),
                                          child: Center(
                                            child: CircularProgressIndicator(
                                              color: Color(0xFF6A5AFF),
                                            ),
                                          ),
                                        );
                                      }

                                      if (snapshot.hasError) {
                                        return _buildLoansList(_fallbackLoans);
                                      }

                                      final loans = snapshot.data ?? [];
                                      if (loans.isEmpty) {
                                        return _buildLoansList(_fallbackLoans);
                                      }

                                      return _buildLoansList(loans);
                                    },
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
            );
          },
        ),
      ),
      bottomNavigationBar: const AppBottomNavigation(activeIndex: -1),
    );
  }
}

class _LoanCard extends StatelessWidget {
  final Loan loan;

  const _LoanCard({required this.loan});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(14, 16, 14, 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: const [
          BoxShadow(
            color: Color(0x26000000),
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          _LoanDial(days: loan.daysToEmi, progress: loan.progress),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  loan.title,
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xFF2E2E2E),
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  loan.merchant,
                  style: TextStyle(
                    fontSize: 10,
                    color: Color(0xFF7A7A7A),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  'Outstanding : ${loan.outstanding}',
                  style: TextStyle(
                    fontSize: 10,
                    color: Color(0xFF6A6A6A),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  'Next EMI : ${loan.nextEmi}',
                  style: TextStyle(
                    fontSize: 10,
                    color: Color(0xFF6A6A6A),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    _LoanAction(
                      label: 'Details',
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const MyLoanDetailsPage(),
                          ),
                        );
                      },
                    ),
                    const SizedBox(width: 8),
                    _LoanAction(label: 'Pay Now'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _LoanDial extends StatelessWidget {
  final int days;
  final double progress;

  const _LoanDial({required this.days, required this.progress});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 84,
      height: 84,
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: 84,
            height: 84,
            child: CircularProgressIndicator(
              value: progress.clamp(0, 1),
              strokeWidth: 9,
              backgroundColor: const Color(0xFFE5DEFF),
              valueColor: const AlwaysStoppedAnimation<Color>(
                Color(0xFF6A5AFF),
              ),
            ),
          ),
          Text(
            'EMI on\n$days\nDays',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 9,
              color: Color(0xFF5A4AD6),
              fontWeight: FontWeight.w600,
              height: 1.1,
            ),
          ),
        ],
      ),
    );
  }
}

class _LoanAction extends StatelessWidget {
  final String label;
  final VoidCallback? onTap;

  const _LoanAction({required this.label, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: const Color(0xFFD9D0FF),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 10,
            color: Color(0xFF4A3BC9),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

class _LoansMessage extends StatelessWidget {
  final String title;
  final String? actionLabel;
  final VoidCallback? onAction;

  const _LoansMessage({required this.title, this.actionLabel, this.onAction});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 18),
      child: Column(
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 11,
              color: Color(0xFF5A4AD6),
              fontWeight: FontWeight.w600,
            ),
          ),
          if (actionLabel != null && onAction != null) ...[
            const SizedBox(height: 8),
            TextButton(
              onPressed: onAction,
              style: TextButton.styleFrom(
                foregroundColor: const Color(0xFF6A5AFF),
              ),
              child: Text(actionLabel!),
            ),
          ],
        ],
      ),
    );
  }
}
