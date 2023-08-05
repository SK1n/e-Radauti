import 'package:flutter/material.dart';

class PageOnboarding extends StatelessWidget {
  const PageOnboarding({super.key});
  static Page<void> page() =>
      const MaterialPage<void>(child: PageOnboarding(), name: '/onboarding');
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
