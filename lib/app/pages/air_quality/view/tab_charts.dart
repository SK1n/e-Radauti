import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class TabCharts extends StatelessWidget {
  const TabCharts({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      hasScrollBody: true,
      child: InAppWebView(
        initialUrlRequest: URLRequest(
          url: Uri.parse(
              'https://calitateaer.radautiulcivic.ro/wp-content/uploads/2023/06/Calitatea_aerului_e-Radauti_Grafice_App.html'),
        ),
        onWebViewCreated: (controller) {},
      ),
    );
  }
}
