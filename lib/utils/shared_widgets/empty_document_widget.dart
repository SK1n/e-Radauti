import 'package:flutter/material.dart';

class EmptyDocumentWidget extends StatefulWidget {
  const EmptyDocumentWidget({super.key});

  @override
  State<EmptyDocumentWidget> createState() => _EmptyDocumentWidgetState();
}

class _EmptyDocumentWidgetState extends State<EmptyDocumentWidget> {
  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: () {}, child: const Text('empty'));
  }
}
