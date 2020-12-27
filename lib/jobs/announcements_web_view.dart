import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutterapperadauti/widgets/src/appBarModel.dart';
import 'package:flutterapperadauti/widgets/src/nav_drawer.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AnnouncementWebView extends StatefulWidget {
  final String slug;
  AnnouncementWebView({Key key, @required this.slug}) : super(key: key);

  @override
  _AnnouncementWebViewState createState() => _AnnouncementWebViewState();
}

class _AnnouncementWebViewState extends State<AnnouncementWebView> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  num _stackToView = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBarModel()
          .loadAppBar(context, 'Anunțuri', Icons.announcement, _scaffoldKey),
      drawer: NavDrawer(),
      body: IndexedStack(
        index: _stackToView,
        children: [
          Container(
            child: WebView(
              javascriptMode: JavascriptMode.unrestricted,
              initialUrl: widget.slug,
              onPageFinished: (String url) async {
                setState(() {
                  _stackToView = 0;
                });
              },
              onWebViewCreated: (WebViewController c) {
                debugPrint("webView created");
              },
            ),
          ),
          Container(child: Center(child: CupertinoActivityIndicator())),
        ],
      ),
    );
  }
}
