import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';

class InfoWindow extends StatefulWidget {
  final Marker marker;

  InfoWindow({Key key, this.marker}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _InfoWindowState(this.marker);
}

class _InfoWindowState extends State<InfoWindow> {
  final Marker _marker;

  _InfoWindowState(this._marker);

  @override
  Widget build(BuildContext context) {
    return Card(child: _cardDescription(context));
  }

  Widget _cardDescription(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        constraints: BoxConstraints(minWidth: 100, maxWidth: 200),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Center(
              child: Text(
                '${_marker.subject}',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 4.0)),
            Text('${_marker.description}'),
            Text('categoria: ${_marker.category}'),
            Text('status: ${_marker.status}'),
          ],
        ),
      ),
    );
  }
}
