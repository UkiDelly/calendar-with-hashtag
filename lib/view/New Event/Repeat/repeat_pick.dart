import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../model/repeat_enum.dart';

class RepeatSelectPage extends StatefulWidget {
  final Repeat repeat;
  const RepeatSelectPage({
    required this.repeat,
    Key? key,
  }) : super(key: key);

  @override
  State<RepeatSelectPage> createState() => _RepeatSelectPageState();
}

class _RepeatSelectPageState extends State<RepeatSelectPage> {
  //
  late int select;

  Repeat selectedToRepeat() {
    switch (select) {
      case 1:
        return Repeat.day;
      case 2:
        return Repeat.week;
      case 3:
        return Repeat.twoWeek;
      case 4:
        return Repeat.month;
      case 5:
        return Repeat.year;
      case 6:
        return Repeat.day;
      case 7:
        return Repeat.day;
      case 8:
        return Repeat.day;
      case 9:
        return Repeat.day;
      case 10:
        return Repeat.day;

      default:
        return Repeat.none;
    }
  }

  int repeatToSelect() {
    switch (widget.repeat) {
      case Repeat.day:
        return 1;
      case Repeat.week:
        return 2;
      case Repeat.twoWeek:
        return 3;
      case Repeat.month:
        return 4;
      case Repeat.year:
        return 5;

      default:
        return 0;
    }
  }

  @override
  void initState() {
    super.initState();
    select = repeatToSelect();
  }

  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //
      body: SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //
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
                  onPressed: () =>
                      {Navigator.of(context).pop(selectedToRepeat())}),
            ),

            //* Repeat Text
            const Padding(
              padding: EdgeInsets.fromLTRB(15, 5, 0, 5),
              child: Text(
                "반복",
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.w600),
              ),
            ),

            //
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //
                    const SizedBox(
                      height: 20,
                    ),

                    ListView(
                      physics: const ClampingScrollPhysics(),
                      shrinkWrap: true,
                      children: [
                        //* No repeat
                        repeatTile(Repeat.none, 0),

                        //
                        const SizedBox(height: 20),

                        //* day -> week -> 2 week -> month -> year
                        repeatTile(Repeat.day, 1),
                        repeatTile(Repeat.week, 2),
                        repeatTile(Repeat.twoWeek, 3),
                        repeatTile(Repeat.month, 4),
                        repeatTile(Repeat.year, 5),

                        //
                        const SizedBox(height: 20),

                        //
                        repeatTile(Repeat.none, 6),
                        repeatTile(Repeat.none, 7),
                        repeatTile(Repeat.none, 8),
                        repeatTile(Repeat.none, 9),
                        repeatTile(Repeat.none, 10),

                        //
                        const SizedBox(height: 20),

                        //* End date
                        endTile(),

                        //
                        const SizedBox(
                          height: 100,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget repeatTile(Repeat r, int index) {
    return Container(
      padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
      margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
      decoration: BoxDecoration(
          color: const Color(0xfff4f4f4),
          borderRadius: BorderRadius.circular(10)),
      child: CupertinoButton(
          padding: const EdgeInsets.only(left: 10),

          //
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //* Repeat option
              Text(
                convertRepeat(r),
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: Colors.black),
              ),

              //* Check icon
              if (select == index) const Icon(Icons.check)
            ],
          ),

          // this is the selected
          onPressed: () => setState(() {
                select = index;
              })),
    );
  }

  Widget endTile() {
    return Container(
      padding: const EdgeInsets.fromLTRB(15, 10, 0, 10),
      margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
      decoration: BoxDecoration(
        color: const Color(0xfff4f4f4),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: const [
          Text(
            "종료",
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}
