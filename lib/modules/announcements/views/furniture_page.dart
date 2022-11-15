import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutterapperadauti/data/models/e_radauti_website/records_model.dart';
import 'package:flutterapperadauti/modules/announcements/controllers/get_e_radauti_data_controller.dart';
import 'package:flutterapperadauti/utils/const.dart';
import 'package:flutterapperadauti/utils/shared_widgets/futuristic.dart';
import 'package:flutterapperadauti/utils/helpers/launch_url_helper.dart';
import 'package:flutterapperadauti/utils/shared_widgets/app_bar_model.dart';
import 'package:flutterapperadauti/utils/shared_widgets/nav_drawer.dart';
import 'package:get/get.dart';

class FurniturePage extends StatelessWidget with UrlLauncher {
  const FurniturePage({super.key});

  @override
  Widget build(BuildContext context) {
    ChromeSafariBrowser browser = ChromeSafariBrowser();
    final GetERadautiDataController controller = Get.find();

    return Scaffold(
      endDrawer: const NavDrawer(),
      body: CustomScrollView(
        slivers: [
          const AppBarUi(
            content: 'Anunțuri',
            leading: Icons.announcement,
          ),
          SliverPadding(
            padding: const EdgeInsets.all(8.0),
            sliver: SliverToBoxAdapter(
              child: Futuristic(
                futureBuilder: () async =>
                    await controller.getData(eRadautiFurnitureLink),
                dataBuilder: (_, snapshot) {
                  List<RecordsModel>? items = snapshot.data;
                  return ListView.builder(
                    itemCount: 9,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      var data = items?[index];
                      return Container(
                        padding: const EdgeInsets.only(top: 5),
                        width: MediaQuery.of(context).size.width,
                        child: FilledButton(
                          child: Text(
                            data?.title ?? '',
                            textAlign: TextAlign.center,
                          ),
                          onPressed: () => {
                            browser.open(
                              url: Uri.parse(
                                  'https://www.eradauti.ro/anunturi/imobiliare-19/${data?.slug ?? ''}-${data?.id ?? ''}'),
                              options: ChromeSafariBrowserClassOptions(
                                android: AndroidChromeCustomTabsOptions(
                                    shareState:
                                        CustomTabsShareState.SHARE_STATE_OFF,
                                    keepAliveEnabled: true),
                                ios: IOSSafariOptions(
                                  dismissButtonStyle:
                                      IOSSafariDismissButtonStyle.CLOSE,
                                  presentationStyle: IOSUIModalPresentationStyle
                                      .OVER_FULL_SCREEN,
                                ),
                              ),
                            ),
                          },
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 10,
        child: const Icon(Icons.add_rounded),
        onPressed: () {
          Get.defaultDialog(
            title: 'Doriti sa deschideti pagina web?',
            content: const Text(''),
            actions: [
              TextButton(
                onPressed: () => Get.back(),
                child: const Text('Nu'),
              ),
              TextButton(
                  onPressed: () async {
                    Get.back();
                    launchUrl('https://www.eradauti.ro/publica-anunt-gratuit');
                  },
                  child: const Text('Da')),
            ],
          );
        },
      ),
    );
  }
}
