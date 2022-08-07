import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_loadingindicator/flutter_loadingindicator.dart';
import 'package:flutterapperadauti/controllers/download_data_from_url_controller.dart';

import 'package:flutterapperadauti/widgets/src/appBarModelNew.dart';
import 'package:flutterapperadauti/widgets/src/nav_drawer.dart';
import 'package:futuristic/futuristic.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class FurniturePage extends StatelessWidget {
  const FurniturePage({Key? key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    ChromeSafariBrowser browser = ChromeSafariBrowser();
    final DownloadDataFromUrlController _downloadData = Get.find();

    return Scaffold(
      key: _scaffoldKey,
      drawer: NavDrawer(),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            AppBarUiSliver(
              content: 'Anunțuri',
              leading: Icons.announcement,
              scaffoldKey: _scaffoldKey,
            )
          ];
        },
        body: Futuristic(
          futureBuilder: () => _downloadData.getData(
              'https://www.eradauti.ro/api/context?pathname=/anunturi/imobiliare-19'),
          busyBuilder: (_) {
            if (!EasyLoading.isShow) {
              EasyLoading.show();
            }
            return Container();
          },
          errorBuilder: (_, error, retry) {
            EasyLoading.showError("Eroare");
            return TextButton(
                onPressed: () => retry, child: Text('Incearca din nou!'));
          },
          dataBuilder: (_, snapshot) {
            if (EasyLoading.isShow) {
              EasyLoading.dismiss();
            }
            return ListView.builder(
              itemCount: 9,
              itemBuilder: (BuildContext context, int index) {
                // debugPrint(snapshot.toString());
                var data = snapshot.data['context']['posts']['records'][index];
                return Container(
                    padding: EdgeInsets.only(top: 10),
                    child: Column(
                      children: [
                        Container(
                          constraints: BoxConstraints(
                            minHeight: 50,
                            maxHeight: 70,
                          ),
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.only(left: 10, right: 10),
                          child: TextButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.blue[300]),
                                padding: MaterialStateProperty.all(
                                    EdgeInsets.all(10))),
                            child: Text(
                              '${data['title'].toString().toUpperCase()}',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                            onPressed: () => {
                              browser.open(
                                  url: Uri.parse(
                                      'https://www.eradauti.ro/anunturi/imobiliare-19/${data['slug'].toString()}-${data['id'].toString()}'),
                                  options: ChromeSafariBrowserClassOptions(
                                      android: AndroidChromeCustomTabsOptions(
                                          addDefaultShareMenuItem: false,
                                          keepAliveEnabled: true),
                                      ios: IOSSafariOptions(
                                          dismissButtonStyle:
                                              IOSSafariDismissButtonStyle.CLOSE,
                                          presentationStyle:
                                              IOSUIModalPresentationStyle
                                                  .OVER_FULL_SCREEN))),
                            },
                          ),
                        )
                      ],
                    ));
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 10,
        child: Container(
          child: Icon(Icons.add_rounded),
        ),
        onPressed: () {
          Get.defaultDialog(
            title: 'Doriti sa deschideti pagina web?',
            content: Text(''),
            actions: [
              TextButton(
                onPressed: () => Get.back(),
                child: Text('Nu'),
              ),
              TextButton(
                  onPressed: () async {
                    Get.back();
                    if (await canLaunch(
                        'https://www.eradauti.ro/publica-anunt-gratuit')) {
                      await launch(
                          'https://www.eradauti.ro/publica-anunt-gratuit');
                    } else {
                      throw 'Could not launch https://www.eradauti.ro/publica-anunt-gratuit';
                    }
                  },
                  child: Text('Da')),
            ],
          );
        },
      ),
    );
  }
}
