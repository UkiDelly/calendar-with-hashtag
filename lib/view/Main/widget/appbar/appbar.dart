import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../../../provider/dates.dart';

import '../../Search/search_page.dart';
import 'back_to_now.dart';

class CalendarAppBar extends ConsumerWidget {
  const CalendarAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: 75,
      child: Row(
        children: [
          //
          //* 월 표시
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 15, 10, 0),
            child: Text(
              ref.watch(currentMonthProvider).toString(),
              style: const TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff313131)),
            ),
          ),

          //
          const Spacer(),

          //* 오늘로 돌아가기 버튼
          AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            child: ref.watch(currentMonthProvider) != DateTime.now().month
                ? const Padding(
                    padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                    child: BackToNow(),
                  )
                : null,
          ),

          //* 검색 버튼
          CupertinoButton(
              padding: const EdgeInsets.all(0),
              onPressed: () => showCupertinoModalBottomSheet(
                    context: context,
                    builder: (context) => const SearchPage(),
                  ),
              child: const Icon(
                CupertinoIcons.search,
                color: Color(0xff313131),
                size: 25,
              )),

          //* 계정 선택 버튼
          const CupertinoButton(
              padding: EdgeInsets.all(0),
              onPressed: null,
              // () => showCupertinoModalBottomSheet(
              //     context: context, builder: (context) => const AccountPage()),
              child: Icon(
                CupertinoIcons.calendar,
                color: Color(0xff313131),
                size: 25,
              )),

          //* 설정 버튼
          const CupertinoButton(
            padding: EdgeInsets.all(0),
            onPressed: null,
            // () => showCupertinoModalBottomSheet(
            //     useRootNavigator: true,
            //     context: context,
            //     builder: (context) => const SettingPage()),
            child: Icon(
              Icons.settings,
              color: Color(0xff313131),
              size: 25,
            ),
          )
        ],
      ),
    );
  }
}
