import 'package:flutter/material.dart';

class AccountWidget extends StatelessWidget {
  const AccountWidget({Key? key}) : super(key: key);

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
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.red),
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
