import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:expandable/expandable.dart';

class AirQualityLegend extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          // margin: const EdgeInsets.only(left: 10.0, right: 10.0),
          child: ExpandableNotifier(
            child: Column(
              children: [
                ScrollOnExpand(
                  child: Expandable(
                    collapsed: ExpandableButton(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        // ignore: missing_required_param
                        child: TextButton.icon(
                            //disabledColor: Colors.grey[100],
                            //onPressed: () {},
                            //onPressed: null ,
                            icon: Icon(Ionicons.ios_arrow_down, color: Colors.blue,),
                            label: Container(
                                width: MediaQuery.of(context).size.width - 100,
                                child: Text("Unde este instalat aparatul?", style: TextStyle(color: Colors.blue),))),
                      ),
                    ),
                    expanded: ExpandableButton(
                      child: Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            // ignore: missing_required_param
                            child: TextButton.icon(
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
                              'Aparatul de monitorizare a calității aerului este instalat în centrul Municipiului Rădăuți, în Piața Garoafelor și măsoară concentrația de PM2,5, de CO2, temperatura și Umiditatea Relativă. Stația Meteo din Rădăuți este cea oficială instalată de autoritățile române. Stația se află pe Str. Ștefan cel Mare, Nr. 132 și măsoară temperatura, umiditatea relativă, viteza vântului, direcția vântului și presiunea atmosferică.',
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
                        child: TextButton.icon(
                          icon: Icon(Ionicons.ios_arrow_down, color: Colors.blue,),
                          label: Container(
                              width: MediaQuery.of(context).size.width - 100,
                              child: Text("Ce sunt particulele PM2,5?", style: TextStyle(color: Colors.blue),)),
                        ),
                      ),
                    ),
                    expanded: ExpandableButton(
                      child: Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            // ignore: missing_required_param
                            child: TextButton.icon(
                              icon: Icon(Ionicons.ios_arrow_up),
                              label: Container(
                                  width:
                                      MediaQuery.of(context).size.width - 100,
                                  child: Text("Ce sunt particulele PM2,5?")),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width - 20,
                            child: Text(
                              'Particulele PM2,5 sunt particule cu diametrul de sub 2.5 micrometri (aproximativ 100 de ori mai mici decât firul de păr uman) produse de către procesul de ardere a diferiților combustibili precum Diesel, biomasă, cărbune, deșeuri etc.\n\nFiind atât de mici și pătrunzând cu ușurină în plămâni, particulele PM2,5 sunt cele mai periculoase pentru sănătate, în special în mediul urban. Se estimează că anual, în Uniunea Europeană, peste 400.000 de oameni mor prematur din cauza expunerii la o concentrație mare de particule PM2,5.\n\nÎn România, numărul estimativ ajunge la aproximativ 25.000. Aceste particule sunt atât de mici încât pătrund cu ușurință în sistemul respirator și în sistemul circulator, cauzând probleme cardiace sau pulmonare precum astm bronșitic.\n\nLimita maximă medie anuală stabilită de către Uniunea Europeană este de 25 μg/m\u00B3 iar în SUA de 12 μg/m\u00B3. Valori de peste 25 μg/m\u00B3 vor fi observate mereu pe aparat, în special atunci când sunt inversiuni termice.\n\n Este foarte important ca valorile să nu crească foarte mult iar expunerea să nu fie de lungă durată.',
                              textAlign: TextAlign.start,
                              softWrap: true,
                              maxLines: 50,
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
                        child: TextButton.icon(
                          icon: Icon(Ionicons.ios_arrow_down, color: Colors.blue,),
                          label: Container(
                              width: MediaQuery.of(context).size.width - 100,
                              child: Text("Ce înseamnă culoarea fundalului?", style: TextStyle(color: Colors.blue),)),
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
                            child: TextButton.icon(
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
                                child: TextButton(
                                  child: Icon(
                                    Ionicons.ios_square,
                                    color: Color.fromRGBO(80, 240, 230, 1),
                                    //You also have to change the color in value_adapter.dart
                                    //in case you change the colors
                                  ),
                                  onPressed: null,
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width - 60,
                                child: Text(
                                  'Nivelul de PM2,5 este bun (0 - 10 \u03BCg/m\u00B3)',
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
                                child: TextButton(
                                  child: Icon(
                                    Ionicons.ios_square,
                                    color: Color.fromRGBO(80, 204, 170, 1),
                                    //You also have to change the color in value_adapter.dart
                                    //in case you change the colors
                                  ),
                                  onPressed: null,
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width - 60,
                                child: Text(
                                  'Nivelul de PM2,5 este acceptabil (10 - 20 \u03BCg/m\u00B3)',
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
                                child: TextButton(
                                  child: Icon(
                                    Ionicons.ios_square,
                                    color: Color.fromRGBO(240, 230, 65, 1),
                                    //You also have to change the color in value_adapter.dart
                                    //in case you change the colors
                                  ),
                                  onPressed: null,
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width - 60,
                                child: Text(
                                  'Nivelul de PM2,5 este moderat (20 - 25 \u03BCg/m\u00B3)',
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
                                child: TextButton(
                                  onPressed: null,
                                  child: Icon(
                                    Ionicons.ios_square,
                                    color: Color.fromRGBO(255, 80, 80, 1),
                                    //You also have to change the color in value_adapter.dart
                                    //in case you change the colors
                                  ),
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width - 60,
                                child: Text(
                                  'Nivelul de PM2,5 este rău (25 - 50 \u03BCg/m\u00B3)',
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 5,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                width: 40,
                                child: TextButton(
                                  onPressed: null,
                                  child: Icon(
                                    Ionicons.ios_square,
                                    color: Color.fromRGBO(150, 0, 50, 1),
                                    //You also have to change the color in value_adapter.dart
                                    //in case you change the colors
                                  ),
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width - 60,
                                child: Text(
                                  'Nivelul de PM2,5 este foarte rău (50 - 75 \u03BCg/m\u00B3)',
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 5,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                width: 40,
                                child: TextButton(
                                  onPressed: null,
                                  child: Icon(
                                    Ionicons.ios_square,
                                    color: Color.fromRGBO(125, 33, 129, 1),
                                    //You also have to change the color in value_adapter.dart
                                    //in case you change the colors
                                  ),
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width - 60,
                                child: Text(
                                  'Nivelul de PM2,5 este extrem de rău (75 - 800 \u03BCg/m\u00B3)',
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 5,
                                ),
                              ),
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
                        child: TextButton.icon(
                          icon: Icon(Ionicons.ios_arrow_down, color: Colors.blue,),
                          label: Container(
                              width: MediaQuery.of(context).size.width - 100,
                              child: Text(
                                  "Ce spune legea legat de calitatea aerului?", style: TextStyle(color: Colors.blue),)),
                        ),
                      ),
                    ),
                    expanded: ExpandableButton(
                      child: Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            // ignore: missing_required_param
                            child: TextButton.icon(
                              icon: Icon(Ionicons.ios_arrow_up),
                              label: Container(
                                  width:
                                      MediaQuery.of(context).size.width - 100,
                                  child: Text(
                                      "Ce spune legea legat de calitatea aerului?")),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width - 20,
                            child: Text(
                              'În România, legea principală care oferă informații substanțiale despre subiectul calitatea aerului este Legea Nr. 104 din 2011. Culorile și scara de concentrații din această aplicație sunt aliniate cu Ordinul nr. 1.818 din 2 octombrie 2020 și ia în considerare prevederile art. 87 alin. (2) din Legea nr. 104/2011 privind calitatea aerului înconjurător, cu modificările ulterioare în temeiul art. 57 alin. (1), (4) și (5) din Ordonanța de urgență a Guvernului nr. 57/2019 privind Codul administrativ, cu modificările și completările ulterioare, și al art. 13 alin. (4) din Hotărârea Guvernului nr. 43/2020 privind organizarea și funcționarea Ministerului Mediului, Apelor și Pădurilor',
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
                        child: TextButton.icon(
                          icon: Icon(Ionicons.ios_arrow_down, color: Colors.blue,),
                          label: Container(
                              width: MediaQuery.of(context).size.width - 100,
                              child: Text("Unde găsesc mai multe informații?", style: TextStyle(color: Colors.blue),)),
                        ),
                      ),
                    ),
                    expanded: ExpandableButton(
                      child: Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            // ignore: missing_required_param
                            child: TextButton.icon(
                              icon: Icon(Ionicons.ios_arrow_up),
                              label: Container(
                                  width:
                                      MediaQuery.of(context).size.width - 100,
                                  child: Text(
                                      "Unde găsesc mai multe informații?")),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width - 20,
                            child: Text(
                              'Echipa Rădăuțiul Civic a construit o pagină specială pentru o descriere în detaliu a parametrilor de calitatea aerului (http://calitateaer.radautiulcivic.ro). Pagina conține grafice care arată cum evoluează în timp concentrația de PM2,5, CO2, Umiditatea Relativă, Viteza și Direcția Vântului, Temperatura și Presiunea Atmosferică. Pagina poate fi accesată pe www.radautiulcivic.ro/calitatea-aerului',
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
      ],
    );
  }
}
//