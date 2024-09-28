import 'package:flutter/material.dart';

class InputCustom extends StatelessWidget {
  const InputCustom({
    super.key,
    required this.onChanged,
  });

  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      maxLength: 8,
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
        labelText: 'Digite o CEP',
      ),
    );
  }
}
