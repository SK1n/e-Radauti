import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutterapperadauti/menu_page.dart';
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
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        title: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Icon(
            Icons.announcement,
            color: Color(0x55FB6340),
            size: 30,
          ),
          Padding(
            padding: EdgeInsets.only(left: 10),
          ),
          Text('Anunturi'),
        ]),
        leading: Container(
          child: FlatButton(
            child: Icon(Ionicons.ios_arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        actions: <Widget>[
          Container(
            alignment: Alignment.topRight,
            margin: EdgeInsets.only(top: 0.0, right: 0.0),
            // EdgeInsets.only(top: 20.0, right: 10.0),
            child: IconButton(
              icon: Icon(
                Icons.menu,
                size: 24,
                color: Colors.black,
              ),
              onPressed: () => _scaffoldKey.currentState.openDrawer(),
            ),
          ),
        ],
      ),
      drawer: NavDrawer2(),
      body: IndexedStack(
        index: _stackToView,
        children: [
          SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              child: WebView(
                javascriptMode: JavascriptMode.unrestricted,
                initialUrl: widget.slug,
                onPageFinished: (String url) {
                  setState(() {
                    _stackToView = 0;
                  });
                },
              ),
            ),
          ),
          Container(child: Center(child: CircularProgressIndicator())),
        ],
      ),
    );
  }
}
