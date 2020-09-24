import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:expandable/expandable.dart';

class AirQualityLegend extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //
        // CO2 Expandable container
        //
        Container(
          child: ExpandableNotifier(
            child: Column(
              children: [
                ScrollOnExpand(
                  child: Expandable(
                    collapsed: ExpandableButton(
                      child: Container(
                        width: MediaQuery.of(context).size.width - 30,
                        // ignore: missing_required_param
                        child: FlatButton.icon(
                          disabledColor: Colors.orange[200],
                          disabledTextColor: Colors.black,
                          icon: Icon(Ionicons.ios_arrow_down),
                          label: Text(
                            'Legenda de culori pentru nivelul de CO2',
                          ),
                        ),
                      ),
                    ),
                    expanded: ExpandableButton(
                      child: Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width - 30,
                            // ignore: missing_required_param
                            child: FlatButton.icon(
                              disabledColor: Colors.orange[200],
                              disabledTextColor: Colors.black,
                              icon: Icon(Ionicons.ios_arrow_up),
                              label: Text(
                                'Legenda de culori pentru nivelul de CO2',
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              FlatButton(
                                child: Icon(
                                  Ionicons.ios_square,
                                  color: Colors.green[300],
                                ),
                                onPressed: null,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width - 100,
                                child: Text(
                                  'Concentrație normală în aerul exterior',
                                  textAlign: TextAlign.start,
                                  softWrap: true,
                                  maxLines: 20,
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              FlatButton(
                                child: Icon(
                                  Ionicons.ios_square,
                                  color: Colors.green[200],
                                ),
                                onPressed: null,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width - 100,
                                child: Text(
                                  'Concentrații tipice spațiilor interioare ocupate',
                                  textAlign: TextAlign.start,
                                  softWrap: true,
                                  maxLines: 20,
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              FlatButton(
                                child: Icon(
                                  Ionicons.ios_square,
                                  color: Colors.yellow[200],
                                ),
                                onPressed: null,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width - 100,
                                child: Text(
                                  'Simptome de somnolenta si aer slab',
                                  textAlign: TextAlign.start,
                                  softWrap: true,
                                  maxLines: 20,
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              FlatButton(
                                child: Icon(
                                  Ionicons.ios_square,
                                  color: Colors.red[200],
                                ),
                                onPressed: null,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width - 100,
                                child: Text(
                                  'Dureri de cap, somnolență și aer stagnant, învechit, înfundat. Poate fi prezentă și o concentrație slabă, pierderea atenției, ritm cardiac crescut și ușoară greață.',
                                  textAlign: TextAlign.start,
                                  softWrap: true,
                                  maxLines: 20,
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              FlatButton(
                                child: Icon(
                                  Ionicons.ios_square,
                                  color: Colors.red[300],
                                ),
                                onPressed: null,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width - 100,
                                child: Text(
                                  'Limita de expunere la locul de muncă (8 ore) în majoritatea jurisdicțiilor.',
                                  textAlign: TextAlign.start,
                                  softWrap: true,
                                  maxLines: 20,
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              FlatButton(
                                child: Icon(
                                  Ionicons.ios_square,
                                  color: Colors.red[500],
                                ),
                                onPressed: null,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width - 100,
                                child: Text(
                                  'Expunerea poate duce la lipsa gravă de oxigen, rezultând leziuni permanente ale creierului, comă, chiar moarte.',
                                  textAlign: TextAlign.start,
                                  softWrap: true,
                                  maxLines: 20,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        //
        // Humidity Expandable container
        //
        Container(
          child: ExpandableNotifier(
            child: Column(
              children: [
                ScrollOnExpand(
                  child: Expandable(
                    collapsed: ExpandableButton(
                      child: Container(
                        width: MediaQuery.of(context).size.width - 30,
                        // ignore: missing_required_param
                        child: FlatButton.icon(
                          disabledColor: Colors.orange[200],
                          disabledTextColor: Colors.black,
                          icon: Icon(Ionicons.ios_arrow_down),
                          label: Text(
                            'Legenda de culori pentru nivelul de Umiditate',
                          ),
                        ),
                      ),
                    ),
                    expanded: ExpandableButton(
                      child: Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width - 30,
                            // ignore: missing_required_param
                            child: FlatButton.icon(
                              disabledColor: Colors.orange[200],
                              disabledTextColor: Colors.black,
                              icon: Icon(Ionicons.ios_arrow_up),
                              label: Text(
                                'Legenda de culori pentru nivelul de Umiditate',
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              FlatButton(
                                child: Icon(
                                  Ionicons.ios_square,
                                  color: Colors.blue[100],
                                ),
                                onPressed: null,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width - 100,
                                child: Text(
                                  'Umiditatea din aer este scazuta',
                                  textAlign: TextAlign.start,
                                  softWrap: true,
                                  maxLines: 20,
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              FlatButton(
                                child: Icon(
                                  Ionicons.ios_square,
                                  color: Colors.blue[200],
                                ),
                                onPressed: null,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width - 100,
                                child: Text(
                                  'Umiditatea aerului e normala',
                                  textAlign: TextAlign.start,
                                  softWrap: true,
                                  maxLines: 20,
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              FlatButton(
                                child: Icon(
                                  Ionicons.ios_square,
                                  color: Colors.blue[300],
                                ),
                                onPressed: null,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width - 100,
                                child: Text(
                                  'Umiditatea aerului este ridicata',
                                  textAlign: TextAlign.start,
                                  softWrap: true,
                                  maxLines: 20,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        //
        // PM2.5 Expandable container
        //
        Container(
          child: ExpandableNotifier(
            child: Column(
              children: [
                ScrollOnExpand(
                  child: Expandable(
                    collapsed: ExpandableButton(
                      child: Container(
                        width: MediaQuery.of(context).size.width - 30,
                        // ignore: missing_required_param
                        child: FlatButton.icon(
                          disabledColor: Colors.orange[200],
                          disabledTextColor: Colors.black,
                          icon: Icon(Ionicons.ios_arrow_down),
                          label: Text(
                            'Legenda de culori pentru nivelul de PM2.5',
                          ),
                        ),
                      ),
                    ),
                    expanded: ExpandableButton(
                      child: Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width - 30,
                            // ignore: missing_required_param
                            child: FlatButton.icon(
                              disabledColor: Colors.orange[200],
                              disabledTextColor: Colors.black,
                              icon: Icon(Ionicons.ios_arrow_up),
                              label: Text(
                                'Legenda de culori pentru nivelul de PM2.5',
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              FlatButton(
                                child: Icon(
                                  Ionicons.ios_square,
                                  color: Colors.pink[50],
                                ),
                                onPressed: null,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width - 100,
                                child: Text(
                                  'Nivelul de PM2.5 este bun',
                                  textAlign: TextAlign.start,
                                  softWrap: true,
                                  maxLines: 20,
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              FlatButton(
                                child: Icon(
                                  Ionicons.ios_square,
                                  color: Colors.pink[100],
                                ),
                                onPressed: null,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width - 100,
                                child: Text(
                                  'Nivelul de PM2.5 este moderat',
                                  textAlign: TextAlign.start,
                                  softWrap: true,
                                  maxLines: 20,
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              FlatButton(
                                child: Icon(
                                  Ionicons.ios_square,
                                  color: Colors.pink[200],
                                ),
                                onPressed: null,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width - 100,
                                child: Text(
                                  'Nivelul de PM2.5 este daunator pentru persoanele sensibile',
                                  textAlign: TextAlign.start,
                                  softWrap: true,
                                  maxLines: 20,
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              FlatButton(
                                child: Icon(
                                  Ionicons.ios_square,
                                  color: Colors.pink[300],
                                ),
                                onPressed: null,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width - 100,
                                child: Text(
                                  'Nivelul de PM2.5 este daunator pentru toate persoanele',
                                  textAlign: TextAlign.start,
                                  softWrap: true,
                                  maxLines: 20,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
