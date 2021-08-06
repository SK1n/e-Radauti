import 'package:flutter/material.dart';

class MapLegend extends StatelessWidget {
  const MapLegend({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        margin: EdgeInsets.all(8.0),
        //height: MediaQuery.of(context).size.height - 500,
        child: GridView.count(
          shrinkWrap: true,
          crossAxisCount: 2,
          primary: true,
          physics: ScrollPhysics(parent: NeverScrollableScrollPhysics()),
          childAspectRatio: 2.0,
          children: [
            ListTileLegendMap(icon: 'bin', title: 'Gunoi neridicat'),
            ListTileLegendMap(
                icon: 'car_abandonned', title: 'Masina abandonata'),
            ListTileLegendMap(
                icon: 'ilegal_constructions', title: 'Constructii ilegale'),
            ListTileLegendMap(
                icon: 'deranj_ordinea_publica',
                title: 'Deranjarea ordinii publice'),
            ListTileLegendMap(
                icon: 'lipsa_semn_circulatie',
                title: 'Lipsa a unui semn de circulatie'),
            ListTileLegendMap(
                icon: 'iluminat_public',
                title: 'Probleme la iluminatul public'),
            ListTileLegendMap(
                icon: 'lipsa_loc_handicap',
                title: 'Lipsa facilitati persoane cu dizabilitati'),
            ListTileLegendMap(icon: 'pitfall', title: 'Obstacol pe drum'),
            ListTileLegendMap(
                icon: 'poluare', title: 'Calitatea aerului si poluare'),
            ListTileLegendMap(
                icon: 'probleme_utilitati', title: 'Probleme la utilitati'),
            ListTileLegendMap(icon: 'sanatate', title: 'Sanatate'),
            ListTileLegendMap(icon: 'siguranta', title: 'Siguranta'),
          ],
        ),
      ),
    );
  }
}

class ListTileLegendMap extends StatelessWidget {
  final String title;
  final String content;
  final String icon;
  const ListTileLegendMap({Key key, this.content, this.icon, this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
          visualDensity: VisualDensity.compact,
          leading: icon != null
              ? Image.asset(
                  'assets/images/mapIcons/$icon.png',
                  width: 40,
                  height: 40,
                )
              : null,
          title: title != null
              ? Text(
                  '$title',
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                )
              : null,
          subtitle: content != null ? Text('$content', maxLines: 2) : null),
    );
  }
}
