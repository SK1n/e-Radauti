import 'package:flutter/material.dart';
import 'package:flutterapperadauti/jobs/announcements_web_view.dart';

class AnnouncementListItem extends StatelessWidget {
  AnnouncementListItem({Key key, @required this.title, @required this.slug})
      : super(key: key);
  final String title;
  final String slug;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 10),
        child: Column(
          children: [
            Container(
              constraints: BoxConstraints(
                minHeight: 50,
                maxHeight: 60,
              ),
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
              child: TextButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.blue[300]),
                    padding: MaterialStateProperty.all(EdgeInsets.all(10))),
                child: Text(
                  '${title.toString().toUpperCase()}',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                onPressed: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AnnouncementWebView(
                        slug: '$slug',
                      ),
                    ),
                  ),
                },
              ),
            )
          ],
        ));
  }
}
