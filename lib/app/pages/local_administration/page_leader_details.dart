import 'package:flutter/material.dart';
import 'package:flutterapperadauti/app/utils/app_constants.dart';
import '../../models/local_administration/local_council_leaders_model.dart';
import 'page_preview_pdf.dart';
import '../../../gen/strings.g.dart';
import '../../utils/scaffolds/app_scaffold.dart';
import '../../utils/widgets/image_widget.dart';

import 'package:url_launcher/url_launcher_string.dart';

class PageLeadersDetails extends StatelessWidget {
  final LocalCouncilLeadersItemModel data;
  const PageLeadersDetails({super.key, required this.data});

  static Route<void> route(LocalCouncilLeadersItemModel data) {
    return MaterialPageRoute<void>(
        builder: (_) => PageLeadersDetails(data: data));
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBarTitle: t.localAdministration.localCouncilLeaders,
      slivers: [
        Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 200,
                child: ImageWidget(
                  link: data.imageUrl,
                  fit: BoxFit.fill,
                  imageBuilder: (context, image) {
                    return AspectRatio(aspectRatio: 3 / 2, child: image);
                  },
                ),
              ),
              Padding(
                padding: AppConstants.leftDelimiter,
                child:
                    Text(data.function, style: AppConstants.smallTextTextStyle),
              ),
              Padding(
                padding: AppConstants.leftDelimiter,
                child: Text('${data.firstName} ${data.surname}',
                    style: AppConstants.titleBigTextStyle),
              ),
              data.location.isNotEmpty
                  ? Padding(
                      padding: AppConstants.leftDelimiter,
                      child: Text(data.location,
                          style: AppConstants.textTextStyle),
                    )
                  : Container(),
              Padding(
                padding: AppConstants.leftDelimiter,
                child: Row(
                  children: [
                    data.fbUrl.isNotEmpty
                        ? IconButton(
                            icon: const Icon(Icons.facebook),
                            onPressed: () async {
                              await launchUrlString(
                                data.fbUrl,
                              );
                            },
                          )
                        : Container(),
                    data.email.isNotEmpty
                        ? IconButton(
                            icon: const Icon(Icons.email),
                            onPressed: () async {
                              await launchUrlString(
                                'mailto:${data.email}',
                              );
                            },
                          )
                        : Container(),
                  ],
                ),
              ),
              data.wealth.isNotEmpty
                  ? Padding(
                      padding: AppConstants.leftDelimiter,
                      child: SizedBox(
                        width: MediaQuery.sizeOf(context).width,
                        child: FilledButton(
                          onPressed: () => Navigator.of(context).push(
                            PagePreviewPdf.route(
                              data.wealth,
                            ),
                          ),
                          child: Text(t.localAdministration.wealth),
                        ),
                      ),
                    )
                  : Container(),
              data.interests.isNotEmpty
                  ? Padding(
                      padding: AppConstants.leftDelimiter,
                      child: SizedBox(
                        width: MediaQuery.sizeOf(context).width,
                        child: FilledButton(
                          onPressed: () => Navigator.of(context).push(
                            PagePreviewPdf.route(
                              data.interests,
                            ),
                          ),
                          child: Text(t.localAdministration.interests),
                        ),
                      ),
                    )
                  : Container(),
            ],
          ),
        )
      ],
    );
  }
}
