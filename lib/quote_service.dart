import 'dart:convert';
import 'package:http/http.dart' as http;

class QuoteService {
  // Use HTTP (since AwardSpace shows "Not secure")
  static const String baseUrl = "http://arkansouki.atwebpages.com";
  static const String key = "password";

  static Future<Map<String, dynamic>> fetchRandomQuote() async {
    final url = Uri.parse("$baseUrl/daily_quotes.php");

    final res = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"key": key}),
    );

    if (res.statusCode != 200) {
      throw Exception("Server error: ${res.statusCode} ${res.body}");
    }

    final data = jsonDecode(res.body);
    if (data is Map<String, dynamic>) return data;

    throw Exception("Invalid response format");
  }

  static Future<Map<String, dynamic>> addQuote({
    required String quote,
    required String author,
  }) async {
    final url = Uri.parse("$baseUrl/add_quote.php");

    final res = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "key": key,
        "quote": quote,
        "author": author,
      }),
    );

    final body = res.body.isNotEmpty ? res.body : "{}";
    final data = jsonDecode(body);

    if (res.statusCode != 200) {
      throw Exception("Add failed: ${res.statusCode} $data");
    }

    if (data is Map<String, dynamic>) return data;
    throw Exception("Invalid response format");
  }
}