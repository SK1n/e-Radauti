import 'package:flutter/material.dart';

class WidgetWithBorder extends StatelessWidget {
  final String hint;
  final Widget child;
  const WidgetWithBorder({
    super.key,
    required this.hint,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(
              hint,
              style: const TextStyle(fontSize: 14),
            ),
          ),
          child,
        ],
      ),
    );
  }
}
