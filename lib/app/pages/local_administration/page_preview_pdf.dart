import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:flutterapperadauti/utils/loading_widget.dart';
import 'package:flutterapperadauti/utils/shared_widgets/app_scaffold/app_scaffold.dart';

class PagePreviewPdf extends StatelessWidget {
  const PagePreviewPdf({
    super.key,
    required this.url,
  });

  static Route<void> route(String url) {
    return MaterialPageRoute<void>(builder: (_) => PagePreviewPdf(url: url));
  }

  final String url;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBarTitle: '',
      showDrawerButton: false,
      slivers: [
        SizedBox(
          height: MediaQuery.of(context).size.height,
          child: const PDF(
            fitPolicy: FitPolicy.BOTH,
            preventLinkNavigation: true,
            swipeHorizontal: false,
            enableSwipe: false,
            fitEachPage: false,
          ).fromUrl(
            url,
            placeholder: (progress) => const LoadingWidget(),
          ),
        ),
      ],
    );
  }
}
