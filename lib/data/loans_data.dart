import 'package:onebnpl/models/loan.dart';

const List<Loan> demoLoans = [
  Loan(
    id: '1',
    title: 'Lenovo Laptop',
    merchant: 'IT mart',
    outstanding: '12,500',
    nextEmi: '2,500 / 12-03-2026',
    daysToEmi: 7,
    progress: 0.75,
  ),
  Loan(
    id: '2',
    title: 'iPhone 15',
    merchant: 'Mobile hub',
    outstanding: '45,000',
    nextEmi: '7,500 / 02-04-2026',
    daysToEmi: 18,
    progress: 0.6,
  ),
  Loan(
    id: '3',
    title: 'Motorbike',
    merchant: 'City Motors',
    outstanding: '85,000',
    nextEmi: '9,000 / 07-04-2026',
    daysToEmi: 23,
    progress: 0.45,
  ),
];
