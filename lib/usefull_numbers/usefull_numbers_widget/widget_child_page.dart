import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

class UsefullNumbersWidget extends StatelessWidget {
  final String title;
  final List<dynamic> phone;
  final List<dynamic> email;
  const UsefullNumbersWidget({
    Key key,
    this.title,
    this.phone,
    this.email,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10.0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '$title',
              style: TextStyle(
                  color: Colors.blueGrey,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            Divider(
              height: 20,
              thickness: 2,
            ),
            phone != null
                ? ListView.builder(
                    itemCount: phone.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int item) {
                      return Column(
                        children: [
                          ListTile(
                            leading: Icon(AntDesign.phone),
                            title: Text('${phone[item]}'),
                            onTap: () {
                              _launchURL('tel:${phone[item]}');
                            },
                          ),
                          Divider(
                            height: 20,
                            thickness: 2,
                          ),
                        ],
                      );
                    })
                : Container(),
            email != null
                ? ListView.builder(
                    itemCount: email.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int item) {
                      return Column(
                        children: [
                          ListTile(
                            leading: Icon(AntDesign.mail),
                            title: Text('${email[item]}'),
                            onTap: () {
                              _launchURL('mailto:${email[item]}');
                            },
                          ),
                          Divider(
                            height: 20,
                            thickness: 2,
                          ),
                        ],
                      );
                    })
                : Container(),
          ],
        ),
      ),
    );
  }

  _launchURL(url) async {
    if (await UrlLauncher.canLaunch(url)) {
      await UrlLauncher.launch(url);
    } else {
      throw 'Nu se poate încărca $url';
    }
  }
}
