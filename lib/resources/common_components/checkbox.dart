import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CheckBoxComponent extends StatefulWidget {
  final String? label;
  bool? value;
  final void Function(bool?)? onchanged;
  CheckBoxComponent(
      {super.key, this.label, this.onchanged, this.value = false});

  @override
  State<CheckBoxComponent> createState() => _CheckBoxComponentState();
}

class _CheckBoxComponentState extends State<CheckBoxComponent> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: widget.value,
          onChanged: (bool? value) {
            setState(() {
              widget.value = value!;
            });
            widget.onchanged?.call(widget.value); // Notify the parent widget
          },
        ),
        Text(widget.label ?? ""),
      ],
    );
  }
}
