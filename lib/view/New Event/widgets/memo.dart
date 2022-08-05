import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../Memo/memo_page.dart';

class MemoWidget extends StatefulWidget {
  final Function(String memo) getMemo;
  const MemoWidget({Key? key, required this.getMemo}) : super(key: key);

  @override
  State<MemoWidget> createState() => _MemoWidgetState();
}

class _MemoWidgetState extends State<MemoWidget> {
  String? memo;
  @override
  Widget build(BuildContext context) {
    return const SizedBox();
  }
}
