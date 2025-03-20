// ✅ Animated FloatingActionButton widget:
import 'package:flutter/material.dart';
import 'package:user_profile/screen/add_user.dart';

class AnimatedFAB extends StatefulWidget {
  const AnimatedFAB({super.key});

  @override
  State<AnimatedFAB> createState() => _AnimatedFABState();
}

class _AnimatedFABState extends State<AnimatedFAB>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutBack,
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _animation,
      child: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const AddUser()),
          );
        },
        backgroundColor: const Color.fromARGB(221, 127, 171, 248),
        child: const Icon(Icons.add, color: Colors.black),
      ),
    );
  }
}
