import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../data/repeat_enum.dart';

class RepeatSelectPage extends StatefulWidget {
  final Function(Repeat r) getRepeat;
  const RepeatSelectPage(
    this.getRepeat, {
    Key? key,
  }) : super(key: key);

  @override
  State<RepeatSelectPage> createState() => _RepeatSelectPageState();
}

class _RepeatSelectPageState extends State<RepeatSelectPage> {
  //
  Repeat repeat = Repeat.none;

  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //
            //* exit button
            Align(
              alignment: Alignment.centerRight,
              child: CupertinoButton(
                  padding: const EdgeInsets.all(0),
                  child: SizedBox(
                    child: Icon(
                      Icons.highlight_off,
                      color: Colors.grey.shade400,
                      size: 30,
                    ),
                  ),

                  // close the page
                  onPressed: () => Navigator.of(context).pop()),
            ),

            //* Repeat Text
            const Text(
              "반복",
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.w600),
            ),

            ListView(
              shrinkWrap: true,
              children: [for (int i = 0; i < 3; i++) repeatTile(repeat)],
            )
          ],
        ),
      ),
    );
  }

  Widget repeatTile(Repeat r) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
    );
  }
}
