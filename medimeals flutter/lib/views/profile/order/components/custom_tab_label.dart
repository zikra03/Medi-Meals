import 'package:flutter/material.dart';

class CustomTabLabel extends StatelessWidget {
  const CustomTabLabel({
    super.key,
    required this.label,
    required this.value,
  });

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'label ',
        ),
        Text(
          value,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(),
        ),
      ],
    );
  }
}
