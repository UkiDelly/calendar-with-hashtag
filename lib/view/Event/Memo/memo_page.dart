import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MemoInputPage extends StatefulWidget {
  String? memo;

  MemoInputPage({
    Key? key,
    this.memo,
  }) : super(key: key);

  @override
  State<MemoInputPage> createState() => _MemoInputPageState();
}

class _MemoInputPageState extends State<MemoInputPage> {
  late TextEditingController memoController = TextEditingController();

  @override
  void initState() {
    super.initState();

    // if there is memo
    if (widget.memo != null) {
      memoController.text = widget.memo!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: (MediaQuery.of(context).size.width / 2) - 10,
              ),

              // Memo
              const Text(
                "메모",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),

              // ok button
              const Spacer(),
              CupertinoButton(
                  child: const Text(
                    "완료",
                    style: TextStyle(color: Colors.blue),
                  ),
                  onPressed: () =>
                      Navigator.of(context).pop(memoController.text)),
            ],
          ),

          // input
          Expanded(
              child: CupertinoTextField(
            maxLines: null,
            controller: memoController,
            decoration: const BoxDecoration(color: Colors.transparent),
          ))
        ],
      ),
    );
  }
}
