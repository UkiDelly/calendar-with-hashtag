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
              Text(
                '메모',
                style: Theme.of(context).primaryTextTheme.labelMedium,
              ),

              // ok button
              const Spacer(),
              CupertinoButton(
                child: Text(
                  '완료',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                onPressed: () => Navigator.of(context).pop(memoController.text),
              ),
            ],
          ),

          // input
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CupertinoTextField(
                maxLines: null,
                controller: memoController,
                decoration: const BoxDecoration(color: Colors.transparent),
              ),
            ),
          )
        ],
      ),
    );
  }
}
