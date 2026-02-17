import 'package:flutter/material.dart';
import 'package:onebnpl/widgets/bottom_navigation.dart';

class MyLoanDetailsPage extends StatelessWidget {
  const MyLoanDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final installments = [
      _Installment(
        title: 'Installment No. 1',
        paidOn: '12/02/2025',
        amount: '5,500',
        total: '50,000',
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFFB6FFB5), Color(0xFFFFFFFF)],
        ),
        statusColor: Color(0xFF0F9B48),
      ),
      _Installment(
        title: 'Installment No. 1',
        paidOn: '12/02/2025',
        amount: '5,500',
        total: '50,000',
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFFB6FFB5), Color(0xFFFFFFFF)],
        ),
        statusColor: Color(0xFF0F9B48),
      ),
      _Installment(
        title: 'Installment No. 1',
        paidOn: '12/02/2025',
        amount: '------',
        total: '50,000',
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFFFFD3D3), Color(0xFFFFFFFF)],
        ),
        statusColor: Color(0xFFE00000),
      ),
    ];

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
                          _LogoHeader(),
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
                                  const _GreetingRow(),
                                  const SizedBox(height: 10),
                                  GestureDetector(
                                    onTap: () => Navigator.of(context).pop(),
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
                                  const SizedBox(height: 16),
                                  const _DetailsCard(),
                                  const SizedBox(height: 18),
                                  const Text(
                                    'Repayment Schedule',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xFF6A5AFF),
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  ...[
                                    for (
                                      int i = 0;
                                      i < installments.length;
                                      i++
                                    ) ...[
                                      _InstallmentCard(
                                        installment: installments[i],
                                      ),
                                      if (i != installments.length - 1)
                                        const SizedBox(height: 10),
                                    ],
                                  ],
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
      bottomNavigationBar: const AppBottomNavigation(activeIndex: 0),
    );
  }
}

class _LogoHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 150,
          height: 150,
          child: Image.asset('assets/images/bnpllogo.png', fit: BoxFit.contain),
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
    );
  }
}

class _GreetingRow extends StatelessWidget {
  const _GreetingRow();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
              'Jane Dhungel',
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
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Icon(
            Icons.notifications_none,
            color: Color(0xFF4E46D9),
            size: 20,
          ),
        ),
      ],
    );
  }
}

class _DetailsCard extends StatelessWidget {
  const _DetailsCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Color(0x1A000000),
            blurRadius: 10,
            offset: Offset(0, 6),
          ),
        ],
      ),
      padding: const EdgeInsets.fromLTRB(14, 12, 14, 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Details',
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF2E2E2E),
                  fontWeight: FontWeight.w700,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFF2AD673),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text(
                  'Pay Now',
                  style: TextStyle(
                    fontSize: 11,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          const _DetailRow(label: 'Device', value: 'iPhone 14 Pro Max'),
          const _DetailRow(label: 'Store', value: 'MG Enterprises'),
          const _DetailRow(label: 'Loan Detail', value: '3 Months Loan'),
          const _DetailRow(label: 'Granted Amount', value: '1,50,000'),
          const _DetailRow(label: 'Disburse Date', value: '12/12/2025'),
          const _DetailRow(label: 'Outstanding', value: '5,00,000'),
        ],
      ),
    );
  }
}

class _DetailRow extends StatelessWidget {
  final String label;
  final String value;

  const _DetailRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 11,
              color: Color(0xFF5B5B5B),
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 11,
              color: Color(0xFF5B5B5B),
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class _InstallmentCard extends StatelessWidget {
  final _Installment installment;

  const _InstallmentCard({required this.installment});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: installment.gradient,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Color(0x26000000),
            blurRadius: 10,
            offset: Offset(0, 6),
          ),
        ],
      ),
      padding: const EdgeInsets.fromLTRB(14, 14, 14, 14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                installment.title,
                style: const TextStyle(
                  fontSize: 13,
                  color: Color(0xFF2E2E2E),
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Paid on ${installment.paidOn}',
                style: const TextStyle(
                  fontSize: 11,
                  color: Color(0xFF7A7A7A),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                installment.amount,
                style: TextStyle(
                  fontSize: 13,
                  color: installment.statusColor,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                installment.total,
                style: const TextStyle(
                  fontSize: 13,
                  color: Color(0xFFDD2A2A),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _Installment {
  final String title;
  final String paidOn;
  final String amount;
  final String total;
  final LinearGradient gradient;
  final Color statusColor;

  const _Installment({
    required this.title,
    required this.paidOn,
    required this.amount,
    required this.total,
    required this.gradient,
    required this.statusColor,
  });
}
