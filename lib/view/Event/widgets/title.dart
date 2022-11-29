import 'package:care_square_assignment/model/calendar_event.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../data/accounts.dart';

class TitleWidget extends StatefulWidget {
  final CalendarEvent? event;
  final Function(String) getTitle;
  const TitleWidget({Key? key, this.event, required this.getTitle}) : super(key: key);

  @override
  State<TitleWidget> createState() => _TitleWidgetState();
}

class _TitleWidgetState extends State<TitleWidget> {
  //
  final TextEditingController _titleController = TextEditingController();

  @override
  void initState() {
    super.initState();

    // 이벤트가 존재 할시
    if (widget.event != null) {
      // 텍스트 컨트롤러의 텍스트를 넘겨받은 이벤트의 제목으로 설정
      _titleController.text = widget.event!.title;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // 제목 입력
          Expanded(
              child: CupertinoTextField(
            controller: _titleController,
            padding: const EdgeInsets.all(10),

            // 인디케이터
            prefix: Container(
              height: 40,
              width: 5,
              decoration: BoxDecoration(
                  // 넘겨 받은 이벤트가 존재하지 않을시 색을 기본 계정인 '개인'의 색깔으로 설정
                  // 넘겨 받은 이벤트가 존재하면 해당 이벤트의 계정 색을 가져오기
                  color: widget.event != null ? widget.event!.account.color : accounts[0].color,
                  borderRadius: BorderRadius.circular(25)),
            ),

            //
            decoration: const BoxDecoration(),
            style: Theme.of(context).textTheme.labelLarge,
            placeholder: "제목",
            cursorColor: Theme.of(context).iconTheme.color,

            // 입력이 끝나면 콜백 함수를 호출하여 새로운 제목 데이터를 넘겨주기
            onChanged: (title) => widget.getTitle(title),
          ))
        ],
      ),
    );
  }
}
