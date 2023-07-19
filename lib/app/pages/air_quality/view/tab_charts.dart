import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutterapperadauti/app/utils/app_constants.dart';

class TabCharts extends StatelessWidget {
  const TabCharts({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      hasScrollBody: true,
      child: InAppWebView(
        initialUrlRequest: URLRequest(
          url: Uri.parse(
            AppConstants.airQualityChartsLink,
          ),
        ),
      ),
    );
  }
}
