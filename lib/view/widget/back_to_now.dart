import 'package:care_square_assignment/provider/go_back_today.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
    _animationController = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this)
      ..forward()
      ..addListener(() {
        setState(() {});
      });
    _opacityController =
        Tween<double>(begin: 0, end: 1).animate(_animationController);
  }

  @override
  void dispose() {
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
        height: 15,
        decoration: BoxDecoration(
            border: Border.all(color: const Color(0xff313131), width: 3),
            borderRadius: BorderRadius.circular(25)),
        child: Row(
          children: [
            // Icon
            Consumer(
              builder: (context, ref, child) {
                if (ref.watch(goBackTodayProvider) == 1) {
                  // go back icon
                  return const Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  );
                } else if (ref.watch(goBackTodayProvider) == -1) {
                  // go forward icon
                  return const Icon(
                    Icons.arrow_forward,
                    color: Colors.black,
                  );
                }
                return const SizedBox();
              },
            ),

            //
            const SizedBox(
              width: 10,
            ),

            // Today
            const Text(
              "TODAY",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),

            //
            const SizedBox(
              width: 10,
            )
          ],
        ),
      ),
    );
  }
}
