import 'package:care_square_assignment/provider/dates.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../../Event/new_event_page.dart';

class AddNewEvent extends StatefulWidget {
  const AddNewEvent({
    Key? key,
  }) : super(key: key);

  @override
  State<AddNewEvent> createState() => _AddNewEventState();
}

class _AddNewEventState extends State<AddNewEvent> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        children: [
          //
          //* 새로운 이벤트 추가
          Expanded(
              child: Container(
            margin: const EdgeInsets.fromLTRB(10, 10, 5, 10),
            width: 75,
            height: 60,
            decoration: BoxDecoration(
                color: const Color(0xfff4f4f4),
                borderRadius: BorderRadius.circular(10)),
            child: Consumer(
              builder: (ctx, ref, child) {
                // 선택한 날짜 가져오기
                DateTime date = ref.watch(selectedDateProvider);
                return CupertinoButton(
                  //
                  //* 새로운 이벤트 추가 페이지로 이동
                  onPressed: () => showCupertinoModalBottomSheet(
                    context: context,
                    backgroundColor: Colors.transparent,
                    builder: (context) => AddNewEventPage(
                      date: date,
                    ),
                  ),

                  //
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      //

                      // 아이콘

                      const Icon(
                        CupertinoIcons.add,
                        color: Colors.black,
                        size: 30,
                      ),

                      //
                      const SizedBox(
                        width: 10,
                      ),

                      //
                      Text(
                        "새로운 이벤트",
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(fontWeight: FontWeight.normal),
                      )
                    ],
                  ),
                );
              },
            ),
          )),

          //* 템플렛 목록, 기능 없음..
          Container(
            width: 60,
            height: 60,
            margin: const EdgeInsets.fromLTRB(5, 10, 10, 10),
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
                color: const Color(0xfff4f4f4),
                borderRadius: BorderRadius.circular(10)),
            child: SvgPicture.asset(
              'assets/icon/document.svg',
              height: 10,
            ),
          )
        ],
      ),
    );
  }
}
