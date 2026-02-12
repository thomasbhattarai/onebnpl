class Loan {
  final String id;
  final String title;
  final String merchant;
  final String outstanding;
  final String nextEmi;
  final int daysToEmi;
  final double progress;

  const Loan({
    required this.id,
    required this.title,
    required this.merchant,
    required this.outstanding,
    required this.nextEmi,
    required this.daysToEmi,
    required this.progress,
  });

  factory Loan.fromJson(Map<String, dynamic> json) {
    final dynamic progressValue = json['progress'];
    return Loan(
      id: json['id']?.toString() ?? '',
      title: (json['title'] ?? json['product_name'])?.toString() ?? '',
      merchant: json['merchant']?.toString() ?? '',
      outstanding: json['outstanding']?.toString() ?? '',
      nextEmi: json['next_emi']?.toString() ?? '',
      daysToEmi: (json['days_to_emi'] as num?)?.toInt() ?? 0,
      progress: (progressValue as num?)?.toDouble() ?? 0.75,
    );
  }
}
