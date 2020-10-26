import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:expandable/expandable.dart';

class AirQualityLegend extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 10.0, right: 10.0),
          child: ExpandableNotifier(
            child: Column(
              children: [
                ScrollOnExpand(
                  child: Expandable(
                    collapsed: ExpandableButton(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        // ignore: missing_required_param
                        child: FlatButton.icon(
                            //disabledColor: Colors.grey[100],
                            disabledTextColor: Colors.black,
                            icon: Icon(Ionicons.ios_arrow_down),
                            label: Container(
                                width: MediaQuery.of(context).size.width - 100,
                                child: Text("Unde este instalat aparatul?"))),
                      ),
                    ),
                    expanded: ExpandableButton(
                      child: Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            // ignore: missing_required_param
                            child: FlatButton.icon(
                              disabledColor: Colors.grey[200],
                              disabledTextColor: Colors.black,
                              icon: Icon(Ionicons.ios_arrow_up),
                              label: Container(
                                  width:
                                      MediaQuery.of(context).size.width - 100,
                                  child: Text("Unde este instalat aparatul?")),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width - 20,
                            child: Text(
                              'Aparatul este instalat în centrul Municipiului Rădăuți, în Piața Garoafelor',
                              textAlign: TextAlign.start,
                              softWrap: true,
                              maxLines: 20,
                            ),
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
        Container(
          margin: const EdgeInsets.only(left: 10.0, right: 10.0),
          child: ExpandableNotifier(
            child: Column(
              children: [
                ScrollOnExpand(
                  child: Expandable(
                    collapsed: ExpandableButton(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        // ignore: missing_required_param
                        child: FlatButton.icon(
                          disabledTextColor: Colors.black,
                          icon: Icon(Ionicons.ios_arrow_down),
                          label: Container(
                              width: MediaQuery.of(context).size.width - 100,
                              child: Text("Ce sunt particulele PM2.5?")),
                        ),
                      ),
                    ),
                    expanded: ExpandableButton(
                      child: Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            // ignore: missing_required_param
                            child: FlatButton.icon(
                              disabledColor: Colors.grey[200],
                              disabledTextColor: Colors.black,
                              icon: Icon(Ionicons.ios_arrow_up),
                              label: Container(
                                  width:
                                      MediaQuery.of(context).size.width - 100,
                                  child: Text("Ce sunt particulele PM2.5?")),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width - 20,
                            child: Text(
                              'Particulele PM2.5 sunt particule cu diametrul de sub 2.5 micrometri (aproximativ 100 de ori mai mici decât firul de păr uman) produse de către procesul de ardere a diferiților combustibili (în special Diesel la mașini sau cărbune la firmele de utilități) sau de către elemente naturale precum erupții vulcanice etc.\n\nParticulele PM2.5 sunt cele mai periculoase pentru sănătate, în special în mediul urban. Se estimează că anual, în Uniunea Europeană, peste 400.000 de oameni mor prematur din cauza expunerii la o concentrație mare de particule PM2.5.\n\nÎn România, numărul estimativ ajunge la aproximativ 25.000. Aceste particule sunt atât de mici încât pătrund cu ușurință în sistemul respirator și în sistemul circulator, cauzând probleme cardiace sau pulmonare precum astm bronșitic.\n\nLimita maximă medie anuală stabilită de către Uniunea Europeană este de 25 μg/m3 iar în SUA de 12 μg/m3. Valori de peste 25 μg/m3 vor fi observate din când în când pe aparat, ceea ce ar putea însemna un incendiu în zonă, trafic intens, sărbători în care se generază fum sau pur și simplu efecte meteorologice uzuale în care presiunea atmosferă este mare iar particulele rămân la nivelul solului.\n\n Este foarte important ca valorile să nu crească foarte mult iar expunerea să nu fie de lungă durată.',
                              textAlign: TextAlign.start,
                              softWrap: true,
                              maxLines: 20,
                            ),
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
        Container(
          child: ExpandableNotifier(
            child: Column(
              children: [
                ScrollOnExpand(
                  child: Expandable(
                    collapsed: ExpandableButton(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        // ignore: missing_required_param
                        child: FlatButton.icon(
                          //disabledColor: Colors.grey[100],
                          disabledTextColor: Colors.black,
                          icon: Icon(Ionicons.ios_arrow_down),
                          label: Container(
                              width: MediaQuery.of(context).size.width - 100,
                              child: Text("Ce înseamnă culoarea fundalului?")),
                        ),
                      ),
                    ),
                    expanded: ExpandableButton(
                      child: Column(
                        children: [
                          Container(
                            margin:
                                const EdgeInsets.only(left: 10.0, right: 10.0),
                            width: MediaQuery.of(context).size.width,
                            // ignore: missing_required_param
                            child: FlatButton.icon(
                              disabledColor: Colors.grey[200],
                              disabledTextColor: Colors.black,
                              icon: Icon(Ionicons.ios_arrow_up),
                              label: Container(
                                  width:
                                      MediaQuery.of(context).size.width - 100,
                                  child:
                                      Text("Ce înseamnă culoarea fundalului?")),
                            ),
                          ),
                          Row(
                            children: [
                              Container(
                                width: 40,
                                child: FlatButton(
                                  child: Icon(
                                    Ionicons.ios_square,
                                    color: Colors.green,
                                    //You also have to change the color in value_adapter.dart
                                    //in case you change the colors
                                  ),
                                  onPressed: null,
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width - 60,
                                child: Text(
                                  'Nivelul de PM2.5 este bun',
                                  textAlign: TextAlign.start,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 5,
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                width: 40,
                                child: FlatButton(
                                  child: Icon(
                                    Ionicons.ios_square,
                                    color: Colors.yellow,
                                    //You also have to change the color in value_adapter.dart
                                    //in case you change the colors
                                  ),
                                  onPressed: null,
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width - 60,
                                child: Text(
                                  'Nivelul de PM2.5 este moderat',
                                  textAlign: TextAlign.start,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 5,
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                width: 40,
                                child: FlatButton(
                                  child: Icon(
                                    Ionicons.ios_square,
                                    color: Colors.orange,
                                    //You also have to change the color in value_adapter.dart
                                    //in case you change the colors
                                  ),
                                  onPressed: null,
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width - 60,
                                child: Text(
                                  'Nivelul de PM2.5 este daunator pentru persoanele sensibile',
                                  textAlign: TextAlign.start,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 5,
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                width: 40,
                                child: FlatButton(
                                  onPressed: null,
                                  child: Icon(
                                    Ionicons.ios_square,
                                    color: Colors.red,
                                    //You also have to change the color in value_adapter.dart
                                    //in case you change the colors
                                  ),
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width - 60,
                                child: Text(
                                  'Nivelul de PM2.5 este daunator pentru toate persoanele',
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 5,
                                ),
                              ),
                            ],
                          )
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
