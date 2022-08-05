import 'package:flutter/material.dart';

import '../../../model/account.dart';

class AccountWidget extends StatelessWidget {
  final Account account;
  const AccountWidget({Key? key, required this.account}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Icon
        const Icon(Icons.calendar_month_rounded),

        const SizedBox(
          width: 10,
        ),

        //
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: const Color(0xfff4f4f4),
              borderRadius: BorderRadius.circular(25)),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              //* account color
              Container(
                width: 5,
                height: 5,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: account.color),
              ),

              const SizedBox(width: 10),

              //* account name
              const Text("개인")
            ],
          ),
        ),
      ],
    );
  }
}
