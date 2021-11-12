import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapperadauti/state/loading_state.dart';
import 'package:flutterapperadauti/widgets/src/appBarModelNew.dart';
import 'package:flutterapperadauti/widgets/src/loading_screen_ui.dart';
import 'package:flutterapperadauti/widgets/src/nav_drawer.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AnnouncementWebView extends StatefulWidget {
  final String slug;
  AnnouncementWebView({Key key, @required this.slug}) : super(key: key);

  @override
  _AnnouncementWebViewState createState() => _AnnouncementWebViewState();
}

class _AnnouncementWebViewState extends State<AnnouncementWebView> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    IsLoading isLoading = Provider.of<IsLoading>(context);
    return Scaffold(
      key: _scaffoldKey,
      drawer: NavDrawer(),
      appBar: PreferredSize(
        child: AppBarUi(
          content: 'Anunțuri',
          scaffoldKey: _scaffoldKey,
          leading: Icons.announcement,
        ),
        preferredSize: Size(MediaQuery.of(context).size.width, 50),
      ),
      body: WebView(
        javascriptMode: JavascriptMode.unrestricted,
        initialUrl: widget.slug,
      ),
    );
  }
}
