import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

final hello = Provider<String>((ref) => 'Hello Flutter');
final number = Provider<int>((ref) => 26);
final dateFormat = Provider<DateFormat>((ref) {
  return DateFormat.MMMEd();
});

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final res = ref.watch(hello);
    final value = ref.watch(number);
    final formattedDate = ref.watch(dateFormat);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Riverpod Provider'),
      ),
      body: Stack(
        children: [
          Column(
            mainAxisAlignment:
                MainAxisAlignment.start, // Center content vertically
            children: [
              Center(
                child: Text(
                  "$res \n $value",
                  style: const TextStyle(
                    color: Colors.blueAccent,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center, // Aligns text properly
                ),
              ),
              const SizedBox(height: 20), // Adds spacing
              Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(10),
                ),
                margin: const EdgeInsets.only(left: 2),
                child: Center(
                  // Centers text inside the container
                  child: Text(
                    formattedDate.format(DateTime.now()),
                    style: const TextStyle(color: Colors.black, fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
