import 'package:flutter/material.dart';

class OutlinedDropdownButton<T> extends StatelessWidget {
  final String hint;
  final List<DropdownMenuItem<T>> items;
  final T? value;
  final ValueChanged<T?>? onChanged;

  const OutlinedDropdownButton({
    Key? key,
    required this.hint,
    required this.items,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).primaryColor,
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: DropdownButton<T>(
        isExpanded: true,
        underline: const SizedBox(),
        hint: Text(hint),
        value: value,
        onChanged: onChanged,
        items: items,
      ),
    );
  }
}
