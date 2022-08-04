import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../Memo/memo_page.dart';

class MemoWidget extends StatefulWidget {
  const MemoWidget({Key? key}) : super(key: key);

  @override
  State<MemoWidget> createState() => _MemoWidgetState();
}

class _MemoWidgetState extends State<MemoWidget> {
  String? memo;
  @override
  Widget build(BuildContext context) {
    if (memo != null && memo != "") {
      return Align(
        alignment: Alignment.centerLeft,
        child: Container(
          margin: const EdgeInsets.only(right: 15),
          padding: const EdgeInsets.fromLTRB(15, 15, 15, 5),
          decoration: BoxDecoration(
              color: const Color(0xfff4f4f4),
              borderRadius: BorderRadius.circular(15)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Memo text
              Text(memo!),

              // edit Button
              Align(
                alignment: Alignment.bottomRight,
                child: CupertinoButton(
                    padding: const EdgeInsets.all(0),
                    child: Container(
                        padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 224, 224, 224),
                            borderRadius: BorderRadius.circular(20)),
                        child: const Text(
                          "편집",
                          style: TextStyle(fontSize: 12.5),
                        )),
                    onPressed: () => showCupertinoModalBottomSheet(
                        context: context,
                        builder: (context) => MemoInputPage(
                              memo: memo,
                            )).then((value) => setState(
                          // update the memo
                          () => memo = value,
                        ))),
              )
            ],
          ),
        ),
      );
    } else {
      return Row(
        children: [
          const Icon(CupertinoIcons.doc_text),
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

              //* show the memo input page
              builder: (context) => MemoInputPage(),
            ).then((value) => setState(
                  () {
                    // update the memo
                    memo = value;
                  },
                )),

            //
            placeholder: "메모",
          )),
        ],
      );
    }
  }
}
