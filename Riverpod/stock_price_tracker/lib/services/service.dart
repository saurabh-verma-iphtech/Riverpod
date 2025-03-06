import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

const String apiKey = "cv4nthpr01qn2gab8btgcv4nthpr01qn2gab8bu0";

final selectedStockProvider = StateProvider<String>((ref) => "AAPL");

Future<double> fetchStockPrice(String symbol) async {
  final url = "https://finnhub.io/api/v1/quote?symbol=$symbol&token=$apiKey";
  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    final jsonData = json.decode(response.body);
    return jsonData["c"];
  } else {
    throw Exception("Failed to load stock price");
  }
}

final stockPriceProvider = StreamProvider.autoDispose<List<double>>((
  ref,
) async* {
  List<double> prices = [];

  final symbol = ref.watch(selectedStockProvider);
  while (true) {
    try {
      double newPrice = await fetchStockPrice(symbol);
      prices.add(newPrice);
      if (prices.length > 10) prices.removeAt(0);
      yield List.from(prices);
    } catch (e) {
      throw Exception("Error fetching stock price: $e");
    }
    await Future.delayed(const Duration(seconds: 5));
  }
});
