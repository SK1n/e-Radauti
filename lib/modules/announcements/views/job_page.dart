import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutterapperadauti/data/models/e_radauti_website/records_model.dart';
import 'package:flutterapperadauti/modules/announcements/controllers/get_e_radauti_data_controller.dart';
import 'package:flutterapperadauti/utils/const.dart';
import 'package:flutterapperadauti/utils/helpers/launch_url_helper.dart';
import 'package:flutterapperadauti/utils/shared_widgets/custom_cupertino_page_scaffold.dart';
import 'package:flutterapperadauti/utils/shared_widgets/futuristic.dart';
import 'package:get/get.dart';

class JobPage extends StatelessWidget with UrlLauncher {
  const JobPage({super.key});
  @override
  Widget build(BuildContext context) {
    final GetERadautiDataController controller = Get.find();
    ChromeSafariBrowser browser = ChromeSafariBrowser();
    return CustomCupertinoPageScaffold(
      navBarMiddle: 'announces'.tr,
      slivers: [
        SliverToBoxAdapter(
          child: Futuristic(
            initialBuilder: (_, __) => Container(),
            futureBuilder: () => controller.getData(eRadautiJobsLink),
            dataBuilder: (_, snapshot) {
              List<RecordsModel>? items = snapshot as List<RecordsModel>;
              return ListView.builder(
                shrinkWrap: true,
                itemCount: 9,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  var data = items[index];
                  return Container(
                    padding: const EdgeInsets.only(top: 5),
                    width: MediaQuery.of(context).size.width,
                    child: FilledButton(
                      child: AutoSizeText(
                        data.title.toString().toUpperCase(),
                        textAlign: TextAlign.center,
                      ),
                      onPressed: () => Get.defaultDialog(
                        title: 'redirected-eradauti'.tr,
                        middleText: 'proceed'.tr,
                        textCancel: 'cancel'.tr,
                        textConfirm: 'yes'.tr,
                        onConfirm: () {
                          Get.back();
                          browser.open(
                            url: Uri.parse(
                                'https://www.eradauti.ro/anunturi/locuri-de-munca-20/${data.slug.toString()}-${data.id.toString()}'),
                            options: ChromeSafariBrowserClassOptions(
                              android: AndroidChromeCustomTabsOptions(
                                  shareState:
                                      CustomTabsShareState.SHARE_STATE_OFF,
                                  keepAliveEnabled: true),
                              ios: IOSSafariOptions(
                                  dismissButtonStyle:
                                      IOSSafariDismissButtonStyle.CLOSE,
                                  presentationStyle: IOSUIModalPresentationStyle
                                      .OVER_FULL_SCREEN),
                            ),
                          );
                        },
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
