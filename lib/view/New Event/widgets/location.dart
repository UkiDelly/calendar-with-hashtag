import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LocationWidget extends StatefulWidget {
  const LocationWidget({Key? key}) : super(key: key);

  @override
  State<LocationWidget> createState() => _LocationWidgetState();
}

class _LocationWidgetState extends State<LocationWidget> {
  TextEditingController locationController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.location_on_outlined),
        //
        const SizedBox(
          width: 10,
        ),
        const Expanded(
            child: CupertinoTextField(
          //
          decoration: BoxDecoration(color: Colors.transparent),

          //
          placeholder: "위치",
        )),
        CupertinoButton(
          onPressed: () {},
          child: const Icon(CupertinoIcons.search),
        )
      ],
    );
  }
}
