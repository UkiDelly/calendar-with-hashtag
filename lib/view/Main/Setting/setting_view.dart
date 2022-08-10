
import 'package:flutter/material.dart';

import 'appbar_setting.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  // height of the sliver appbar
  final double maxHeight = 100, minHeight = 50;

  // ScrollController
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    //
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        scrollBehavior: NoGlow(),

        slivers: [
          // Custom App bar
          SliverPersistentHeader(pinned: true, delegate: AppSliverDelegate()),

          // body
          SliverList(
              delegate: SliverChildListDelegate(List.generate(
                  1,
                  (index) => Column(
                        children: const [
                          SizedBox(
                            height: 10000,
                          )
                        ],
                      ))))
        ],
        // body: <Widget>[

        //     centerTitle: false,
        //     titleTextStyle: TextStyle(
        //         fontSize: 30,
        //         fontWeight: FontWeight.bold,
        //         color: Theme.of(context).primaryColor),

        //     // while scroll setting
        //     expandedHeight: maxHeight,
        //     collapsedHeight: minHeight,
        //     toolbarHeight: minHeight,
        //     pinned: true,
        //     floating: true,
        //   ),

        //   // body
        //   SliverList(
        //       delegate: SliverChildListDelegate(List.generate(
        //           1,
        //           (index) => Column(
        //                 children: const [
        //                   SizedBox(
        //                     height: 10000,
        //                   )
        //                 ],
        //               ))))
        // ],
      ),
    );
  }
}

class NoGlow extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
