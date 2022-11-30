import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../Memo/memo_page.dart';

class MemoWidget extends StatefulWidget {
  final String? memo;
  final Function(String memo) getMemo;
  const MemoWidget({Key? key, this.memo, required this.getMemo}) : super(key: key);

  @override
  State<MemoWidget> createState() => _MemoWidgetState();
}

class _MemoWidgetState extends State<MemoWidget> {
  late String? memo;

  @override
  void initState() {
    super.initState();

    // 넘겨 받은 memo로 초기화
    memo = widget.memo;
  }

  @override
  Widget build(BuildContext context) {
    // memo가 비어 있지 않을때,
    if (memo != null && memo != '') {
      return Align(
        alignment: Alignment.centerLeft,
        child: Container(
          margin: const EdgeInsets.only(right: 15),
          padding: const EdgeInsets.fromLTRB(15, 15, 15, 5),
          decoration: BoxDecoration(
            color: const Color(0xfff4f4f4),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // 메모 디스플레이
              Text(memo!),

              // 편집 버튼
              Align(
                alignment: Alignment.bottomRight,
                child: CupertinoButton(
                  padding: const EdgeInsets.all(0),
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 224, 224, 224),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      '편집',
                      style: Theme.of(context).textTheme.labelSmall!,
                    ),
                  ),

                  // 메모 편집 페이지로 이동
                  onPressed: () => showCupertinoModalBottomSheet(
                    context: context,

                    // 편집 페이지에서 돌아올때 넘겨 받은 데이터로 업데이트
                    builder: (context) => MemoInputPage(
                      memo: widget.memo,
                    ),
                  ).then((memo) {
                    // 콜백 함수 호출
                    widget.getMemo(memo);

                    //
                    setState(
                      () {
                        // update the memo
                        this.memo = memo;
                      },
                    );
                  }),
                ),
              )
            ],
          ),
        ),
      );

      // 메모가 비어 있을때
    } else {
      return Row(
        children: [
          Icon(
            CupertinoIcons.doc_text,
            color: Theme.of(context).primaryIconTheme.color,
          ),
          //
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: CupertinoTextField(
              //
              maxLines: null,
              readOnly: true,
              decoration: const BoxDecoration(color: Colors.transparent),
              onTap: () => showCupertinoModalBottomSheet(
                context: context,

                //* 메모 입력 페이지로 이동
                builder: (context) => MemoInputPage(),
              ).then(
                (memo) => setState(
                  () {
                    // 메모 업데이트
                    this.memo = memo;
                  },
                ),
              ),

              //
              placeholder: '메모',
              placeholderStyle: Theme.of(context).textTheme.titleMedium,
            ),
          ),
        ],
      );
    }
  }
}
