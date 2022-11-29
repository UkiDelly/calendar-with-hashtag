import 'package:care_square_assignment/model/calendar_event.dart';
import 'package:flutter/material.dart';

import '../../../../../constant/themes.dart';

class SelectedCell extends StatefulWidget {
  final DateTime day;
  final List<CalendarEvent>? events;
  const SelectedCell({Key? key, required this.day, this.events}) : super(key: key);

  @override
  State<SelectedCell> createState() => _SelectedCellState();
}

class _SelectedCellState extends State<SelectedCell> with TickerProviderStateMixin {
  //
  late AnimationController _animationController;
  late Animation _opacity;

  @override
  void initState() {
    // 애니메이션 컨트롤러
    _animationController =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 500))
          ..forward()
          ..addListener(() {
            setState(() {});
          });

    // 투명도 애니메이션
    _opacity = Tween<double>(begin: 0, end: 1).animate(_animationController);

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Brightness brightness = MediaQuery.of(context).platformBrightness;

    return Opacity(
      opacity: _opacity.value,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: brightness == Brightness.light
                ? AppColor.selectedCellLight
                : AppColor.selectedCellDark),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            //
            const SizedBox(
              height: 5,
            ),
            //* 날짜
            Text(
              widget.day.day.toString(),
              style: Theme.of(context).textTheme.bodyText2?.copyWith(
                  color: brightness == Brightness.light
                      ? AppColor.selectedCellTextLight
                      : AppColor.selectedCellTextDark,
                  fontWeight: FontWeight.w700),
            ),

            //
            const Spacer(),

            //* 이벤트 표시
            if (widget.events!.isNotEmpty)
              Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: widget.events?.first.account.color),
              ),

            const Spacer()
          ],
        ),
      ),
    );
  }
}
