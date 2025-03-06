// import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stock_price_tracker/services/service.dart';
import 'package:fl_chart/fl_chart.dart';

// Simulated Stream......

// final stockPriceProvider = StreamProvider<double>((ref) {
//   return Stream.periodic(
//     const Duration(seconds: 2),
//     (count) => 100 + Random().nextDouble() * 50,
//   );
// });


class StockPriceScreen extends ConsumerWidget {
  const StockPriceScreen({super.key});
  @override
   Widget build(BuildContext context, WidgetRef ref) {
    final stockPrices = ref.watch(stockPriceProvider);
    final selectedStock = ref.watch(selectedStockProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Live Stock Price Tracker')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            DropdownButton<String>(
              value: selectedStock,
              items:
                  ["AAPL", "TSLA", "AMZN", "GOOGL"].map((symbol) {
                    return DropdownMenuItem(value: symbol, child: Text(symbol));
                  }).toList(),
              onChanged:
                  (value) =>
                      ref.read(selectedStockProvider.notifier).state = value!,
            ),
            Expanded(
              child: stockPrices.when(
                data:
                    (prices) =>
                        prices.isEmpty
                            ? const Center(child: Text("No data yet"))
                            : LineChart(
                              LineChartData(
                                titlesData: FlTitlesData(show: true),
                                borderData: FlBorderData(show: false),
                                lineBarsData: [
                                  LineChartBarData(
                                    spots:
                                        prices
                                            .asMap()
                                            .entries
                                            .map(
                                              (e) => FlSpot(
                                                e.key.toDouble(),
                                                e.value,
                                              ),
                                            )
                                            .toList(),
                                    isCurved: true,
                                    color: Colors.blue,
                                    dotData: FlDotData(show: true),
                                  ),
                                ],
                              ),
                            ),
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (err, stack) => Center(child: Text("Error: $err")),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
