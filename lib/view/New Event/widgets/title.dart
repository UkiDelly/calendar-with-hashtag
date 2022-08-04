import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewEventTitle extends StatefulWidget {
  const NewEventTitle({Key? key}) : super(key: key);

  @override
  State<NewEventTitle> createState() => _NewEventTitleState();
}

class _NewEventTitleState extends State<NewEventTitle> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //* text field
          Expanded(
              child: CupertinoTextField(
            controller: _textEditingController,
            padding: const EdgeInsets.all(10),

            // indicator
            prefix: Container(
              height: 40,
              width: 5,
              decoration: BoxDecoration(
                  color: Colors.red, borderRadius: BorderRadius.circular(25)),
            ),

            //
            decoration: const BoxDecoration(),
            style: const TextStyle(fontSize: 50),
            placeholder: "제목",
          ))
        ],
      ),
    );
  }
}
