import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LocationWidget extends StatefulWidget {
  final String? location;
  final Function(String? location) getLocation;
  const LocationWidget(
      {Key? key, required this.location, required this.getLocation})
      : super(key: key);

  @override
  State<LocationWidget> createState() => _LocationWidgetState();
}

class _LocationWidgetState extends State<LocationWidget> {
  String? location;
  TextEditingController locationController = TextEditingController();

  @override
  void initState() {
    super.initState();

    // if the location is not null
    if (widget.location != null) locationController.text = widget.location!;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.location_on_outlined),
        //
        const SizedBox(
          width: 10,
        ),
        Expanded(
            child: CupertinoTextField(
          controller: locationController,
          decoration: const BoxDecoration(color: Colors.transparent),
          placeholder: "위치",
          onEditingComplete: () => widget.getLocation(locationController.text),
        )),
        CupertinoButton(
          onPressed: () {},
          child: const Icon(
            CupertinoIcons.search,
            color: Colors.black,
          ),
        )
      ],
    );
  }
}
