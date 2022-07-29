import 'package:flutter/material.dart';

class BackToNow extends StatefulWidget {
  const BackToNow({Key? key}) : super(key: key);

  @override
  State<BackToNow> createState() => _BackToNowState();
}

class _BackToNowState extends State<BackToNow> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _opacityController;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(duration: const Duration(seconds: 1), vsync: this)
          ..forward();
    _opacityController =
        Tween<double>(begin: 0, end: 1).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.reverse();
    _animationController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: _opacityController.value,
      curve: Curves.ease,
      duration: const Duration(seconds: 1),
      child: Container(
        height: 20,
        width: 20,
        color: Colors.red,
      ),
    );
  }
}
