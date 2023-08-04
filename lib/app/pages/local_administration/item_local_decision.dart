import 'package:flutter/material.dart';
import 'package:flutterapperadauti/app/utils/app_constants.dart';
import 'package:flutterapperadauti/gen/strings.g.dart';
import '../../models/local_administration/decision_model.dart';
import 'page_preview_pdf.dart';
import 'package:fluttericon/font_awesome5_icons.dart';

class ItemLocalDecision extends StatelessWidget {
  final DecisionModel item;
  const ItemLocalDecision({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: AppConstants.innerCardPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '[${item.year}] ${item.title}',
              softWrap: true,
            ),
            Padding(
              padding: AppConstants.topDelimiter,
              child: Center(
                child: OutlinedButton.icon(
                  onPressed: () => Navigator.of(context).push(
                    PagePreviewPdf.route(
                      item.url,
                    ),
                  ),
                  icon: const Icon(FontAwesome5.file_download),
                  label: Text(t.localAdministration.seePdf),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
