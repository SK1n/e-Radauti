import 'package:flutter/material.dart';
import 'package:flutterapperadauti/app/models/local_administration/decision_model.dart';
import 'package:flutterapperadauti/app/pages/local_administration/page_preview_pdf.dart';
import 'package:fluttericon/font_awesome5_icons.dart';

class ItemLocalDecision extends StatelessWidget {
  final DecisionModel item;
  const ItemLocalDecision({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: Colors.black12, width: 1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '[${item.year}] ${item.title}',
                softWrap: true,
              ),
            ),
            InkWell(
              onTap: () => Navigator.of(context).push(
                PagePreviewPdf.route(
                  item.url,
                ),
              ),
              child: Center(
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: 'Vizualizeaza pdf-ul',
                            style: TextStyle(
                              color: Colors.blue,
                            ),
                          ),
                          WidgetSpan(
                            child: Padding(
                              padding: EdgeInsets.only(left: 8.0),
                              child: Icon(
                                FontAwesome5.file_download,
                                color: Colors.blue,
                                size: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
