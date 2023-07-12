import 'package:flutter/material.dart';
import '../../models/local_administration/local_council_leaders_model.dart';
import 'page_preview_pdf.dart';
import '../../../gen/strings.g.dart';
import '../../utils/scaffolds/app_scaffold.dart';
import '../../utils/widgets/image_widget.dart';
import 'package:google_fonts/google_fonts.dart';
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
                padding: const EdgeInsets.only(left: 20.0),
                child: Text(
                  data.function,
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    color: const Color(0xFF434EA0),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text(
                  '${data.firstName} ${data.surname}',
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    color: const Color(
                      0xFF1F2937,
                    ),
                  ),
                ),
              ),
              data.location.isNotEmpty
                  ? Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Text(
                        data.location,
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          color: const Color(
                            0xFF1F2937,
                          ),
                        ),
                      ),
                    )
                  : Container(),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
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
                      padding: const EdgeInsets.only(left: 20.0, top: 5),
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
                      padding:
                          const EdgeInsets.only(left: 20.0, top: 5, bottom: 5),
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
