import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UrlWidget extends StatelessWidget {
  const UrlWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Icon(CupertinoIcons.link),
        //
        SizedBox(
          width: 10,
        ),
        Expanded(
            child: CupertinoTextField(
          //
          decoration: BoxDecoration(color: Colors.transparent),

          //
          placeholder: "URL",
        )),
      ],
    );
  }
}
