import 'package:care_square_assignment/provider/dates.dart';
import 'package:care_square_assignment/view/Main/main_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
    return Container(
      margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Theme.of(context).textTheme.bodyLarge!.color!,
        ),
      ),
      child: Consumer(
        builder: (ctx, ref, child) {
          // 선택한 날짜 가져오기
          DateTime date = ref.watch(selectedDateProvider);
          return CupertinoButton(
            //
            //* 새로운 이벤트 추가 페이지로 이동
            onPressed: () => showCupertinoModalBottomSheet(
              // enableDrag: false,
              isDismissible: false,
              enableDrag: false,
              context: context,
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Theme.of(context).textTheme.bodyLarge!.color!),
              ),
              builder: (context) => AddNewEventPage(
                date: date,
              ),
            ).then(
              (value) => {eventListKey.currentState!.setState(() {})},
            ),

            //
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //

                // 아이콘

                Icon(
                  CupertinoIcons.add,
                  color: Theme.of(context).primaryIconTheme.color,
                  size: 30,
                ),

                //
                const SizedBox(
                  width: 10,
                ),

                //
                Text(
                  '새로운 이벤트',
                  style: Theme.of(context)
                      .primaryTextTheme
                      .displayMedium!
                      .copyWith(fontWeight: FontWeight.normal),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
