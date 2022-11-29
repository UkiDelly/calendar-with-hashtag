import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../../../provider/dates.dart';
import '../../Search/search_page.dart';

class CalendarAppBar extends ConsumerWidget {
  const CalendarAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PreferredSize(
      preferredSize: const Size(double.infinity, 75),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          //
          //* 월 표시
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 15, 10, 0),
            child: Text(ref.watch(currentMonthProvider).month.toString(),
                style: Theme.of(context).appBarTheme.titleTextStyle?.copyWith(fontSize: 50)),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(0, 15, 0, 10),
            child: Text(
              ref.watch(currentMonthProvider).year.toString(),
              style: Theme.of(context).appBarTheme.titleTextStyle,
            ),
          ),

          //
          const Spacer(),

          //* 오늘로 돌아가기 버튼
          // AnimatedContainer(
          //   duration: const Duration(milliseconds: 300),
          //   child: ref.watch(currentMonthProvider) != DateTime.now().month
          //       ? const Padding(
          //           padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
          //           child: BackToNow(),
          //         )
          //       : null,
          // ),

          //* 검색 버튼
          CupertinoButton(
              padding: const EdgeInsets.all(0),
              onPressed: () => showCupertinoModalBottomSheet(
                    context: context,
                    builder: (context) => const SearchPage(),
                  ),
              child: Icon(
                CupertinoIcons.search,
                size: 25,
                color: Theme.of(context).iconTheme.color,
              )),

          //* 계정 선택 버튼
          CupertinoButton(
              padding: const EdgeInsets.all(0),
              onPressed: null,
              // () => showCupertinoModalBottomSheet(
              //     context: context, builder: (context) => const AccountPage()),
              child: Icon(
                CupertinoIcons.calendar,
                color: Theme.of(context).iconTheme.color,
                size: 25,
              )),

          //* 설정 버튼
          CupertinoButton(
            padding: const EdgeInsets.all(0),
            onPressed: null,
            // () => showCupertinoModalBottomSheet(
            //     useRootNavigator: true,
            //     context: context,
            //     builder: (context) => const SettingPage()),
            child: Icon(
              Icons.settings,
              color: Theme.of(context).iconTheme.color,
              size: 25,
            ),
          )
        ],
      ),
    );
  }
}
