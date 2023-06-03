import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:flutterapperadauti/data/models/local_meetings/local_meetings_item_model.dart';
import 'package:flutterapperadauti/utils/helpers/launch_url_helper.dart';
import 'package:get/get.dart';

class LocalMeetingsItem extends StatefulWidget {
  final LocalMeetingsItemModel data;
  final bool isFirst;
  const LocalMeetingsItem({
    Key? key,
    required this.data,
    required this.isFirst,
  }) : super(key: key);

  @override
  State<LocalMeetingsItem> createState() => _LocalMeetingsItemState();
}

class _LocalMeetingsItemState extends State<LocalMeetingsItem>
    with UrlLauncher {
  ExpandableController expandableController = ExpandableController();
  @override
  void dispose() {
    super.dispose();
    expandableController.dispose();
  }

  @override
  void initState() {
    expandableController.value = widget.isFirst;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ExpandableNotifier(
      controller: expandableController,
      child: Expandable(
        expanded: InkWell(
          onTap: () {
            setState(() {
              expandableController.value = true;
              expandableController.toggle();
              debugPrint(widget.data.toString());
            });
          },
          child: Card(
            child: Column(
              children: [
                ListTile(
                  title: Text('${"order".tr}: ${widget.data.date}'),
                  trailing: expandableController.expanded
                      ? const Icon(Icons.arrow_upward)
                      : const Icon(Icons.arrow_downward),
                ),
                videoWidget(widget.data.fbLink!),
                TextButton(
                  onPressed: () async {
                    debugPrint(widget.data.pdfLink!);
                    await launchUrlS(widget.data.pdfLink!);
                  },
                  child: Text('see-order'.tr),
                ),
              ],
            ),
          ),
        ),
        collapsed: InkWell(
          onTap: () {
            setState(() {
              expandableController.value = false;
              expandableController.toggle();
            });
          },
          child: Card(
            child: ListTile(
                title: Text('${"order".tr}: ${widget.data.date}'),
                trailing: Icon(expandableController.expanded
                    ? Icons.arrow_upward
                    : Icons.arrow_downward)),
          ),
        ),
      ),
    );
  }

  HtmlWidget videoWidget(String url) {
    return HtmlWidget(
      '''
           <iframe width="200"
            src="https://www.facebook.com/v2.3/plugins/video.php?
            allowfullscreen=false&autoplay=true&href=$url" </iframe>
     ''',
      // ignore: deprecated_member_use
      webViewJs: true,
      factoryBuilder: () => WidgetFactory(),
    );
  }
}
