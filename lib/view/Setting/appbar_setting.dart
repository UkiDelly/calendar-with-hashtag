import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppSliverDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      height: maxExtent,
      color: Colors.transparent,
      child: LayoutBuilder(
        builder: (context, constraints) => Stack(
          children: [
            //
            // exit button
            Positioned(
              right: 10,
              top: 5,
              child: IconButton(
                  icon: const Icon(
                    CupertinoIcons.multiply_circle,
                    size: 30,
                  ),
                  onPressed: (() => Navigator.pop(context))),
            ),

            // 설정
            Align(
              alignment: Alignment.lerp(const Alignment(-.9, 0),
                  const Alignment(0, 0), shrinkOffset / maxExtent)!,
              child: DefaultTextStyle(
                // change the font size if the alignment is changed
                style: (shrinkOffset / maxExtent) <= 0.7
                    ? TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor)
                    : TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor),
                child: const Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: Text(
                    "설정",
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  double get maxExtent => 150;

  @override
  double get minExtent => 50;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;
}
