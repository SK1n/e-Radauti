import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class QualityTab extends StatelessWidget {
  const QualityTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      hasScrollBody: true,
      child: InAppWebView(
        initialUrlRequest: URLRequest(
          url: Uri.parse(
              'https://calitateaer.radautiulcivic.ro/wp-content/uploads/2023/06/Calitatea_aerului_e-Radauti_App.html'),
        ),
        onWebViewCreated: (controller) {},
      ),
    );
  }
}
