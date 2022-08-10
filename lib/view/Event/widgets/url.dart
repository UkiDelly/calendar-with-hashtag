import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UrlWidget extends StatefulWidget {
  final String? url;
  final Function(String? url) getUrl;
  const UrlWidget({Key? key, required this.url, required this.getUrl})
      : super(key: key);

  @override
  State<UrlWidget> createState() => _UrlWidgetState();
}

class _UrlWidgetState extends State<UrlWidget> {
  String? url;
  TextEditingController urlController = TextEditingController();

  @override
  void initState() {
    super.initState();

    // 넘겨 받은 데이터가 존재할시 그 데이터로 초기화
    if (widget.url != null) urlController.text = widget.url!;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(CupertinoIcons.link),
        //
        const SizedBox(
          width: 10,
        ),

        //
        Expanded(
            child: CupertinoTextField(
          controller: urlController,
          decoration: const BoxDecoration(color: Colors.transparent),

          // 수정이 끝나면 콜백 함수 호출
          onEditingComplete: () => widget.getUrl(urlController.text),

          //
          placeholder: "URL",
        )),
      ],
    );
  }
}
