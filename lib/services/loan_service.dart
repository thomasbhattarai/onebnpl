import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:onebnpl/models/loan.dart';

const String _defaultBaseUrl = 'https://api.example.com';

class LoanService {
  final String baseUrl;
  final http.Client _client;

  LoanService({String? baseUrl, http.Client? client})
    : baseUrl = baseUrl ?? _defaultBaseUrl,
      _client = client ?? http.Client();

  Future<List<Loan>> fetchLoans() async {
    final response = await _client.get(Uri.parse('$baseUrl/loans'));
    if (response.statusCode < 200 || response.statusCode >= 300) {
      throw Exception('Failed to load loans');
    }

    final dynamic decoded = jsonDecode(response.body);
    final List<dynamic> items;
    if (decoded is List) {
      items = decoded;
    } else if (decoded is Map<String, dynamic> && decoded['data'] is List) {
      items = decoded['data'] as List<dynamic>;
    } else {
      items = const [];
    }

    return items
        .map((item) {
          if (item is Map<String, dynamic>) {
            return Loan.fromJson(item);
          }
          if (item is Map) {
            return Loan.fromJson(Map<String, dynamic>.from(item));
          }
          return null;
        })
        .whereType<Loan>()
        .toList();
  }
}
