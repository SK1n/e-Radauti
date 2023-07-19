import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import '../../utils/widgets/loading_widget.dart';
import '../../utils/scaffolds/app_scaffold.dart';

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
      scrollPhysics: const NeverScrollableScrollPhysics(),
      slivers: [
        SizedBox(
          height: MediaQuery.of(context).size.height,
          child: const PDF(
            fitPolicy: FitPolicy.BOTH,
            preventLinkNavigation: true,
            swipeHorizontal: true,
            enableSwipe: true,
            fitEachPage: true,
          ).fromUrl(
            url,
            placeholder: (progress) => const LoadingWidget(),
          ),
        ),
      ],
    );
  }
}
