import 'package:flutter/material.dart';

class StaggeredProfileAnimation extends StatefulWidget {
  final Widget image;
  final Widget name;
  final Widget bio;
  final Widget button;

  const StaggeredProfileAnimation({
    Key? key,
    required this.image,
    required this.name,
    required this.bio,
    required this.button,
  }) : super(key: key);

  @override
  State<StaggeredProfileAnimation> createState() =>
      _StaggeredProfileAnimationState();
}

class _StaggeredProfileAnimationState extends State<StaggeredProfileAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnim;
  late Animation<Offset> _imageSlideAnim;
  late Animation<Offset> _nameSlideAnim;
  late Animation<Offset> _bioSlideAnim;
  late Animation<Offset> _buttonSlideAnim;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    _fadeAnim = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));

    _imageSlideAnim = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.4, curve: Curves.easeOut),
      ),
    );

    _nameSlideAnim = Tween<Offset>(
      begin: const Offset(0, 0.5),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.2, 0.6, curve: Curves.easeOut),
      ),
    );

    _bioSlideAnim = Tween<Offset>(
      begin: const Offset(0, 0.6),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.4, 0.8, curve: Curves.easeOut),
      ),
    );

    _buttonSlideAnim = Tween<Offset>(
      begin: const Offset(0, 0.8),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.6, 1.0, curve: Curves.easeOut),
      ),
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
    return FadeTransition(
      opacity: _fadeAnim,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SlideTransition(position: _imageSlideAnim, child: widget.image),
          const SizedBox(height: 20),
          SlideTransition(position: _nameSlideAnim, child: widget.name),
          const SizedBox(height: 10),
          SlideTransition(position: _bioSlideAnim, child: widget.bio),
          const SizedBox(height: 15),
          SlideTransition(position: _buttonSlideAnim, child: widget.button),
        ],
      ),
    );
  }
}
