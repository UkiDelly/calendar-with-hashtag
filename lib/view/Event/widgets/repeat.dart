import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../../model/repeat_enum.dart';
import '../Repeat/repeat_pick.dart';

class RepeatWidget extends StatefulWidget {
  final Repeat repeat;
  final Function(Repeat) getRepeat;
  const RepeatWidget({Key? key, required this.getRepeat, required this.repeat})
      : super(key: key);

  @override
  State<RepeatWidget> createState() => _RepeatWidgetState();
}

class _RepeatWidgetState extends State<RepeatWidget> {
  late Repeat repeat;

  @override
  void initState() {
    super.initState();
    repeat = widget.repeat;
  }

  //
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // 아이콘
        const Icon(
          CupertinoIcons.refresh_thin,
          size: 20,
        ),

        const SizedBox(
          width: 10,
        ),

        //* 버튼
        CupertinoButton(
          padding: const EdgeInsets.all(0),
          onPressed: () => showCupertinoModalBottomSheet(
            useRootNavigator: true,
            context: context,

            //
            //* 반복 선택 페이지로 이동
            builder: (context) => RepeatSelectPage(
              repeat: widget.repeat,
            ),
          ).then((repeat) {
            // 넘겨받은 데이터로 업데이트
            widget.getRepeat(repeat);
            //
            setState(
              () => this.repeat = repeat,
            );
          }),

          //
          child: SizedBox(
            child: repeat == Repeat.none
                ? Text(
                    // 반복이 없을때
                    convertRepeat(repeat),
                    style: TextStyle(color: Colors.grey.shade500),
                  )
                // 반복이 있을때
                : Container(
                    padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: const Color(0xfff4f4f4)),
                    child: Text(
                      convertRepeat(repeat),
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
          ),
        )
      ],
    );
  }
}
