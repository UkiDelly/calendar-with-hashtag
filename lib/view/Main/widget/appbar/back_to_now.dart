import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:math' as math;

import '../../../../provider/dates.dart';

// ignore: must_be_immutable
class BackToNow extends StatefulWidget {
  const BackToNow({
    Key? key,
  }) : super(key: key);

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
        child: Consumer(
          builder: ((context, ref, child) => CupertinoButton(
                padding: const EdgeInsets.all(0),
                onPressed: () {
                  // go back to today
                  ref
                      .watch(selectedDateProvider.notifier)
                      .update((state) => DateTime.now());
                },
                child: Container(
                  height: 25,
                  padding: const EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                      border:
                          Border.all(color: const Color(0xff313131), width: 3),
                      borderRadius: BorderRadius.circular(25)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Icon
                      Center(
                        child: Consumer(
                          builder: (context, ref, child) {
                            if (ref.watch(goBackTodayProvider) == 1) {
                              // go back icon
                              return SvgPicture.asset('assets/icon/undo.svg');
                            } else if (ref.watch(goBackTodayProvider) == -1) {
                              // go forward icon
                              return Transform(
                                  alignment: Alignment.center,
                                  transform: Matrix4.rotationY(math.pi),
                                  child:
                                      SvgPicture.asset('assets/icon/undo.svg'));
                            }
                            return const SizedBox();
                          },
                        ),
                      ),

                      // Today
                      const Text(
                        "TODAY",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                    ],
                  ),
                ),
              )),
        ));
  }
}
