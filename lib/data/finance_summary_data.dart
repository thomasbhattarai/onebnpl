import 'package:onebnpl/models/finance_summary.dart';

class FinanceSummaryRepository {
  static Future<FinanceSummary> fetchSummary() async {
    return const FinanceSummary(
      balance: '00,000',
      loan: '00,000',
      emiCount: '00',
      nearestEmi: '6/12/2026',
    );
  }
}
