import 'package:flutter/material.dart';

class BasicScaffold extends StatelessWidget {
  final Widget body;
  final Widget? floatingActionButton;
  final bool? resizeToAvoidBottomInset;
  final Color? backgroundColor;
  final PreferredSizeWidget? appBar;

  const BasicScaffold({
    super.key,
    required this.body,
    this.floatingActionButton,
    this.resizeToAvoidBottomInset,
    this.appBar,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      extendBody: true,
      body: SafeArea(child: body),
      backgroundColor: backgroundColor ?? Theme.of(context).scaffoldBackgroundColor,
      floatingActionButton: floatingActionButton,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
    );
  }
}
