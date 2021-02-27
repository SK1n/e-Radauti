import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutterapperadauti/widgets/src/appBarModel.dart';
import 'package:flutterapperadauti/widgets/src/nav_drawer.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;
import 'package:expandable/expandable.dart';

class LocalLegislation extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBarModel().loadAppBar(
          context, 'Administrație locală', Icons.location_city, _scaffoldKey),
      drawer: NavDrawer(),
      body: ExpandableTheme(
        data: const ExpandableThemeData(
          iconColor: Color(0xAA38A49C), //Colors.blue
          useInkWell: true,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                padding:
                    EdgeInsets.only(left: 25, right: 25, bottom: 10, top: 15),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                          height: 30,
                          width: 30,
                          child: SvgPicture.asset(
                              "assets/images/circle_EB7D16.svg"),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width - 90,
                          padding: EdgeInsets.only(
                            left: 10,
                          ),
                          child: Text(
                            "Hotărâri de Consiliu Local",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 10),
                      width: MediaQuery.of(context).size.width - 50,
                      child: Text(
                        "Descoperă hotărârile de consiliu local adoptate și proiectele acestora.",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 5,
                        style: TextStyle(
                          color: Color(0xFF38A49C),
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: Container(
                  height: 1.0,
                  color: Color.fromRGBO(0, 0, 0, 0.1),
                ),
              ),
              Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(
                      top: 15.0,
                      left: 20,
                    ),
                    child: Text(
                      "Hotărâri locale", //"ExpandablePanel",
                      // ignore: deprecated_member_use
                      style: Theme.of(context).textTheme.body2,
                    ),
                  ),
                ],
              ),
              ExpandableNotifier(
                child: Container(
                  padding: const EdgeInsets.only(
                    left: 15,
                    right: 15,
                  ),
                  width: MediaQuery.of(context).size.width,
                  child: Card(
                    margin:
                        const EdgeInsets.only(right: 0, left: 0, bottom: 15.0),
//elevation: 4,
//color: Colors.white,
//childAspectRatio: (MediaQuery.of(context).size.width/2 - 22.5) / (MediaQuery.of(context).size.height/5 - 60),
/*shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(2)),
            ),*/
                    clipBehavior: Clip.antiAlias,
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(
                              5), //const EdgeInsets.all(20),
                          child: Row(
                            children: <Widget>[
                              Column(
                                children: <Widget>[],
                              ),
                              Column(
                                children: <Widget>[],
                              ),
                            ],
                          ),
                        ),
                        ScrollOnExpand(
                          scrollOnExpand: true,
                          scrollOnCollapse: false,
                          child: ExpandablePanel(
                            theme: const ExpandableThemeData(
                              headerAlignment:
                                  ExpandablePanelHeaderAlignment.center,
                              tapBodyToCollapse: true,
                            ),
                            header: Padding(
                                padding: EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      "2020", //"ExpandablePanel",
                                      // ignore: deprecated_member_use
                                      style: Theme.of(context).textTheme.body2,
                                    ),
                                  ],
                                )),
                            collapsed: Text(
                              '2020',
                              softWrap: true,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            expanded: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                /*Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Text(
                                    'Descriere',//
                                    softWrap: true,
                                    overflow: TextOverflow.fade,
                                  ),
                                ),*/
                                //1
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 1 privind aprobarea organigramei şi a statului de funcţii pentru Spitalul Municipal „SF. Dr. COSMA si DAMIAN” Rădăuţi", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2020/02/HCL-nr.-1-din-30.01.2020.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 2 privind aprobarea tarifelor pentru serviciile medicale cu plată prestate de către Spitalul Municipal „SF. Dr. COSMA si DAMIAN” Rădăuţi", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2020/02/HCL-nr.-2-din-30.01.2020.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 3 privind aprobarea Planului anual de acţiune privind serviciile sociale administrate şi finanţate din bugetul local, pentru anul 2020", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2020/02/HCL-nr.-3-din-30.01.2020.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 4 privind aprobarea preţului pentru colectarea, transportul şi depozitarea deşeurilor în municipiul Rădăuţi", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2020/02/HCL-nr.-4-din-30.01.2020.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 5 privind aprobarea pentru anul 2020 a Planului de acţiuni sau lucrări de interes local, pentru repartizarea orelor de muncă pentru persoanele beneficiare de prevederile Legii nr. 416/2001 privind venitul minim garantat şi ai Legii nr. 208/1997 privind cantinele de ajutor social, care prestează acţiuni ori lucrări de interes local", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2020/02/HCL-nr.-5-din-30.01.2020.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 6 privind realizarea parteneriatului între UAT Rădăuţi şi Asociaţia „Călător prin România ”", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2020/02/HCL-nr.-6-din-30.01.2020.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 7 pentru modificarea şi completarea HCL nr. 5/30.01.2014 privind încadrarea terenurilor pe zone în intravilanul Municipiului Rădăuţi", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2020/02/HCL-nr.-7-din-30.01.2020.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 8 pentru modificarea şi completarea HCL nr. 273/2018 privind stabilirea impozitelor şi taxelor locale pentru anul 2019", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2020/02/HCL-nr.-8-din-30.01.2020.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 10 privind aprobarea organizării Târgului “Mărţişor 2020”", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2020/02/HCL-nr.-10-din-30.01.2020.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 11 Privind actualizarea Amenajamentului pastoral aprobat prin HCL nr. 55 din 31.03.2016", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2020/02/HCL-nr.-11-din-30.01.2020.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 18 privind aprobarea Devizului general actualizat ulterior încheierii contractelor de achiziţie publică şi aprobarea cofinanţării costurilor neeligibile pentru obiectivul de investiţii “Continuare de lucrări de realizare şi dotare începute în baza autorizaţiei de construire nr. 328/2007 pentru obiectivul Şcoala Generală cu clasele I-IV şi Sala de sport situată în Municipiul Rădăuţi, str. Oborului, nr. 14A, jud. Suceava ”", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2020/02/HCL-nr.-18-din-30.01.2020.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 19 privind aprobarea creditelor de angajament pentru acţiuni multianuale la obiectivul de investiţii “Reabilitare străzi în Municipiul Rădăuţi, Judeţul Suceava”", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2020/02/HCL-nr.-19-din-30.01.2020.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 20 privind modificarea statului de funcţii al aparatului de specialitate al primarului Municipiului Rădăuţi, în vederea transformării unei funcţii publice de execuţie ca urmare a finalizării perioadei de stagiu, de către un funcţionar public din cadrul Serviciului de impozite şi taxe", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2020/02/HCL-nr.-20-din-30.01.2020.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 22 privind aprobarea contului de execuție la 31.12.2019", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2020/03/HCL-nr.-22-din-20.02.2020.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 23 privind aprobarea documentației tehnico-economice și a indicatorilor tehnico-economici, pentru obiectivul de investiții «Reabilitare clădire în cadrul proiectului «VENUS împreună pentru o viaţă în siguranţă», situată în municipiul Rădăuţi, str. Volovăţului, nr. 51»", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2020/03/HCL-nr.-23-din-20.02.2020.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 24 privind aprobarea documentației tehnico-economice și a indicatorilor tehnico-economici, pentru obiectivul de investiții «Schimbare destinaţie, reamenajare şi extindere construcţie nefinalizată în vederea realizării unui sediu pentru direcţiile Primăriei Municipiului Rădăuţi (S.P.C.L.E.P., D.A.S., Poliţia Locală), arhiva şi centrala termică, racord utilităţi, lucrări sistematizare pe verticală, situată în municipiul Rădăuţi, Judeţul Suceava»", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2020/03/HCL-nr.-24-din-20.02.2020.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 25 privind aprobarea documentației tehnico-economice și a indicatorilor tehnico-economici, pentru obiectivul de investiții «Trotuar str. Daciei, partea dreaptă (int. Str. M. Kogălniceanu – int. Str. Gh. Lazăr), municipiul Rădăuţi, judeţul Suceava »", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2020/03/HCL-nr.-25-din-20.02.2020.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 26 privind aprobarea documentației tehnico-economice și a indicatorilor tehnico-economici, pentru obiectivul de investiții «Trotuar str. Daciei, partea stângă (int. Str. M. Kogălniceanu – int. Str. Gh. Lazăr), municipiul Rădăuţi, judeţul Suceava", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2020/03/HCL-nr.-26-din-20.02.2020.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 27 privind aprobarea documentației tehnico-economice și a indicatorilor tehnico-economici, pentru obiectivul de investiții «Trotuar str. Dragoș Vodă, partea dreaptă (int. str. 22 Decembrie – int. str. Grănicerului), municipiul Rădăuţi, judeţul Suceava»", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2020/03/HCL-nr.-27-din-20.02.2020.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 28 privind aprobarea documentației tehnico-economice și a indicatorilor tehnico-economici, pentru obiectivul de investiții «Trotuar str. Dragoș Vodă, partea stângă (int. Str. 22 Decembrie – int. Str. Grănicerului), municipiul Rădăuţi, judeţul Suceava»", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2020/03/HCL-nr.-28-din-20.02.2020.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 29 privind aprobarea documentației tehnico-economice și a indicatorilor tehnico-economici, pentru obiectivul de investiții «Trotuar Calea Cernăuţi partea stângă (int. str. Sfântul Dumitru – int. str. C.D. Gherea), municipiul Rădăuţi, judeţul Suceava»", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2020/03/HCL-nr.-29-din-20.02.2020.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 30 privind aprobarea documentației tehnico-economice și a indicatorilor tehnico-economici, pentru obiectivul de investiții «Trotuar Mihai Viteazul partea dreaptă (bloc 22 – magazin ABC), municipiul Rădăuţi, judeţul Suceava»", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2020/03/HCL-nr.-30-din-20.02.2020.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 31 privind aprobarea documentației tehnico-economice și a indicatorilor tehnico-economici, pentru obiectivul de investiții «Trotuar Bogdan Vodă partea stângă (int. Str. Mihai Viteazul – loc de joacă bloc 89), municipiul Rădăuţi, judeţul Suceava»", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2020/03/HCL-nr.-31-din-20.02.2020.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 32 privind aprobarea documentației tehnico-economice și a indicatorilor tehnico-economici, pentru obiectivul de investiții «Trotuar Iacob Zadik partea dreaptă (int. Olint – int. cale ferată Calea Cernăuţi), municipiul Rădăuţi, judeţul Suceava»", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2020/03/HCL-nr.-32-din-20.02.2020.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 33 privind aprobarea documentației tehnico-economice și a indicatorilor tehnico-economici, pentru obiectivul de investiții «Reabilitare termică la Grădinița cu program prelungit ,,Micul Prinț“ Rădăuți » municipiul Rădăuţi, judeţul Suceava", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2020/03/HCL-nr.-33-din-20.02.2020.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 34 privind aprobarea creditelor de angajament pentru acțiuni multianuale la obiectivul de investiții “Reabilitare termică la Grădinița cu Program Prelungit Micul Prinț Rădăuți”", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2020/03/HCL-nr.-34-din-20.02.2020.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 35 privind aprobarea documentației tenico-economice și indicatorilor tehnico-economici pentru obiectivul de investiții ,,Reabilitare, extindere gard, Școala Gimnazială nr. 1 Gheorghe Popadiuc”, municipiul Rădăuți, județul Suceava", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2020/03/HCL-nr.-35-din-20.02.2020.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 36 privind aprobarea creditelor de angajament pentru acțiuni multianuale la obiectivul de investiții ,,Reabilitare, extindere gard, Școala Gimnazială nr. 1 Gheorghe Popadiuc”, municipiul Rădăuți, județul Suceava", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2020/03/HCL-nr.-36-din-20.02.2020.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 37 privind aprobarea documentației tehnico-economice și a indicatorilor tehnico-economici, pentru obiectivul de investiții «Extindere reţea alimentare cu apă – strada Tolocii (buclă)» municipiul Rădăuţi, judeţul Suceava", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2020/03/HCL-nr.-37-din-20.02.2020.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 38 privind aprobarea documentației tehnico-economice și a indicatorilor tehnico-economici, pentru obiectivul de investiții «Extindere reţea alimentare cu apă – strada Fundătura Cuza Vodă» municipiul Rădăuţi, judeţul Suceava", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2020/03/HCL-nr.-38-din-20.02.2020.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 39 privind aprobarea documentației tehnico-economice și a indicatorilor tehnico-economici, pentru obiectivul de investiții «Extindere reţea canalizare – strada Fundătura Cuza Vodă» municipiul Rădăuţi, judeţul Suceava", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2020/03/HCL-nr.-39-din-20.02.2020.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 40 privind aprobarea bugetului propriu al municipiului Rădăuți și al unităților subordonate Consiliului Local al municipiului Rădăuți pentru anul 2020", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2020/03/HCL-nr.-40-din-20.02.2020.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 41 privind modificarea statului de funcții al aparatului de specialitate al primarului Municipiului Rădăuți, în vederea transformării unei funcții publice de execuție ca urmare a finalizării perioadei de stagiu, de către un funcționar public din cadrul Compartimentului Autoritate locală de transport și autorizare comercială", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2020/03/HCL-nr.-41-din-20.02.2020.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 42 privind aprobarea modului de completare al Registrului agricol pentru perioada 2020-2024", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2020/03/HCL-nr.-42-din-20.02.2020.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 45 privind aprobarea documentației tehnico-economice și a indicatorilor tehnico-economici, pentru obiectivul de investiții «Creșterea eficienței energetice a clădirii C1 Spital Vechi din cadrul Spitalului Municipal ,,Sf Doctori Cosma și Damian “» municipiul Rădăuţi, judeţul Suceava", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2020/03/HCL-nr.-45-din-20.02.2020.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 46 privind modificarea si completarea HCL nr. 126/2016 privind aprobarea Regulamentului de organizare si functionare a Consiliului Local al municipiului Radauti, judetul Suceava", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2020/04/hcl-46-din-26.03.2020-1.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 47 privind aprobarea documentației tehnico-economice și a indicatorilor tehnico-economici, pentru obiectivul de investiții << Trotuar Mihai Viteazu, partea stângă bloc 15), municipiul Rădăuți, județul Suceava >>", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2020/04/HCL-nr.-47-din-01.04.2020.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 48 privind aprobarea creditelor de angajament pentru acţiuni multianuale la obiectivul de investiţii “ Modernizare cu asfalt strada 9 mai, strada Tineretului, strada Plugarilor, strada Pepenăriei, strada Papetăriei, strada Mănăstirii, strada C.D. Gherea, strada Merilor, strada berăriei, strada Colibaba, strada Recoltei, strada Sitarilor, strada Parcului, strada Fagilor, în municipiul Rădăuți, județul Suceava“", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2020/04/HCL-nr.-48-din-01.04.2020.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 49 privind rectificarea bugetului local de venituri şi cheltuieli pentru anul 2020", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2020/04/HCL-nr.-49-din-01.04.2020.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 50 privind aprobarea Planului de Ordine şi Siguranţă Publică al Poliţiei Locale Rădăuţi", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2020/05/HCL-nr.-50-din-30.04.2020.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 51 privind aprobarea Regulamentului pentru înregistrarea, evidenţa şi radierea vehiculelor pentru care există obligativitatea înregistrării, pe raza administrativ teritorială a Municipiului Rădăuţi", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2020/05/HCL-nr.-51-din-30.04.2020.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 52 pentru modificarea art. 6 din HCL nr. 13/2004 privind organizarea şi desfăşurarea activităţii de transport în regim de taxi în municipiul Rădăuţi", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2020/05/HCL-nr.-52-din-30.04.2020.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 53 privind aprobarea ”Planului de asigurare cu resurse umane, materiale si financiare pentru gestionarea situațiilor de urgență pe teritoriul administrativ al municipiului Rădăuți in anul 2020", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2020/05/HCL-nr.-53-din-30.04.2020.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 54 privind exploatarea cantităţii de 83.993 mc volum brut masă lemnoasă, în regie proprie", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2020/05/HCL-nr.-54-din-30.04.2020.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 55 privind atestarea apartenenţei la domeniul privat al municipiului Rădăuţi, judeţul Suceava a 36 parcele de teren", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2020/05/HCL-nr.-55-din-30.04.2020.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 56 privind atestarea apartenenţei la domeniul privat al municipiului Rădăuţi, judeţul Suceava a 22 parcele de teren", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2020/05/HCL-nr.-56-din-30.04.2020.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 57 privind aprobarea dezmembrării terenului situat în municipiul Rădăuţi, str. Comandor Dan Ghica Cucerca f.n identic cu imobilul cu nr-le. cadastrale: 44145; 44128; 44126; 44163; 44157", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2020/05/HCL-nr.-57-din-30.04.2020.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 58 pentru modificarea si completarea HCL nr. 273/2018 privind stabilirea impozitelor şi taxelor locale pentru anul 2019", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2020/05/HCL-nr.-58-din-30.04.2020.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 59 privind aprobarea documentației tehnico-economice și a indicatorilor tehnico-economici, pentru obiectivul de investiții «Modernizarea sistemului de iluminat public stradal în municipiul Rădăuţi, judeţul Suceava", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2020/05/HCL-nr.-59-din-30.04.2020.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 60 privind aprobarea documentației tehnico-economice și a indicatorilor tehnico-economici, pentru obiectivul de investiții «Construire locuințe sociale regim înălțime P+1E- 2 ansambluri de clădire (16 apartamente) – CF 54324 (Corp 1 și Corp 2), situat pe str. Tolocii, municipiul Rădăuţi, judeţul Suceava", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2020/05/HCL-nr.-60-din-30.04.2020.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 61 privind aprobarea documentației tehnico-economice și a indicatorilor tehnico-economici, pentru obiectivul de investiții «Construire locuințe sociale regim înălțime P+1E- 1 ansamblu de clădire (8 apartamente) – CF 54318 (Corp 3), situat pe str. George Grigorovici f.n., municipiul Rădăuţi, judeţul Suceava»", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2020/05/HCL-nr.-61-din-30.04.2020.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 62 privind aprobarea documentației tehnico-economice și a indicatorilor tehnico-economici, pentru obiectivul de investiții «Construire locuințe sociale regim înălțime P+1E- 2 ansambluri de clădire (16 apartamente) – CF 54319 (Corp 4 și Corp 5), situat pe str. Recoltei, municipiul Rădăuţi, judeţul Suceava»", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2020/05/HCL-nr.-62-din-30.04.2020.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 63 privind aprobarea documentației tehnico-economice și a indicatorilor tehnico-economici, pentru obiectivul de investiții «Construire Centru Comunitar de Resurse, situat pe str. Ștefan cel Mare f.n, municipiul Rădăuţi, judeţul Suceava»", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2020/05/HCL-nr.-63-din-30.04.2020.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 64 privind rectificarea bugetului local de venituri și cheltuieli pentru anul 2020", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2020/05/HCL-nr.-64-din-30.04.2020.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 65 privind aprobarea Listei de priorităţi pentru anul 2020 în vederea repartizării, prin închiriere, a locuinţelor construite prin ANL", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2020/05/HCL-nr.-65-din-30.04.2020.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 66 privind aprobarea Planului Urbanistic Zonal (P.U.Z) şi Regulamentul Local de Urbanism pentru ,, Modificare indicatori urbanistici (P.O.T., C.U.T.) în vederea extinderii construcției autorizate prin autorizația de construire nr. 167/25.04.2019, cu păstrarea destinației”, din strada Ștefan cel Mare nr. 110, municipiul Rădăuți, județul Suceava", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2020/05/HCL-nr.-66-din-30.04.2020.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 67 de modificare și completarea HCL nr. 6/25.01.2018 privind aprobarea declanșării procedurii de selecție a membrilor consiliului de administrație al societății S.C. Servicii Comunale S.A. Rădăuți în conformitate cu legislația privind guvernanța corporativă", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2020/05/HCL-nr.-67-din-30.04.2020.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 82 privind aprobarea documentației tehnico-economice și a indicatorilor tehnico-economici, pentru obiectivul de investiții «Demolare construcții existente C1, C2 (Pavilion administrativ C1, Gheretă santinelă C5) și Construire Grădiniță cu program normal, branșare la utilități, situată pe str. 1 Mai, nr. 103, municipiul Rădăuţi, judeţul Suceava»", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2020/05/HCL-nr.-82-din-13.05.2020.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 83 privind aprobarea documentației tehnico-economice și a indicatorilor tehnico-economici, pentru obiectivul de investiții «Demolare construcție existentă C1 (Depozit C3) și Amplasare loc de joacă pentru copii, situat pe str. 1 Mai , nr. 103, municipiul Rădăuţi, judeţul Suceava»", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2020/05/HCL-nr.-83-din-13.05.2020.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 84 privind aprobarea documentației tehnico-economice și a indicatorilor tehnico-economici, pentru obiectivul de investiții «Proiect cu mai multe acțiuni de investiții privind înființarea mai multor puncte cu toalete, dușuri și mașini de spălat în puncte termice 3, 4, 7 și 8, situate în strada Grănicerului nr. 6, str. Mihai Viteazu nr. 10, str. General Iacob Zadik nr. 25 și str. Stadionului nr. 4»", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2020/05/HCL-nr.-84-din-13.05.2020.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 85 privind aprobarea documentației tehnico-economice și a indicatorilor tehnico-economici, pentru obiectivul de investiții «Modernizare locuință socială prin schimbare destinație, termoizolație, reparare acoperiș, refacere instalații interioare sanitare, situată în strada Salcîmilor nr. 3»", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2020/05/HCL-nr.-85-din-13.05.2020.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 86 privind predarea către Ministerul Dezvoltării Regionale, Administrației Publice prin Compania Naţională de Investiţii “C.N.I.” S.A., a amplasamentului şi asigurarea condiţiilor în vederea executării obiectivului de investiţii Proiect tip – „Construire bază sportivă de tip 2 din municipiul Rădăuți, str. Ștefan cel Mare, judeţul Suceava” in cadrul subprogramului ”Complexuri sportive”", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2020/05/HCL-nr.-86-din-13.05.2020.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 87 privind aprobarea Regulamentului privind protectia datelor cu caracter personal in cadrul UAT Radauti", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2020/06/Hcl-nr.-87-din-27.05.2020.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 88 privind rectificarea bugetului local de venituri si cheltuieli pentru anul 2020", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2020/06/Hcl-nr.-88-din-27.05.2020.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 89 privind modificarea statului de functii al Spitalului Municipal Sf. Dr. Cosma si Damian Radauti, prin transformarea unor posturi si suplimentarea cu un post", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2020/06/Hcl-nr.-89-din-27.05.2020.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 90 privind aprobarea Planului Urbanistic Zonal (P.U.Z.) sI Regulamentul Local de Urbanism pentru “Construire locuinte colective cu regim de inaltime P+3E-16 corpuri pe strada Valea Seaca f.nr., in municipiul Radauti, judetul Suceava””", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2020/06/Hcl-nr.-90-din-27.05.2020.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 91 pentru aprobarea dezmembrari terenului situat in municipiul Radauti, str. Podurilor f.n., identic cu imobilul cu nr. cadastral:54598", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2020/06/Hcl-nr.-91-din-27.05.2020.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 92 privind aprobarea dezmembrarii terenului situat in municipiul Radauti, str. Calarasi f.n. identic cu imobilul cu nr. cadastral:51750, inscris in Cartea Funciara nr. 51750 Radauti", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2020/06/Hcl-nr.-92-din-27.05.2020.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 93 privind acordarea unor facilitati fiscale", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2020/06/HCL-nr.-93-din-27.05.2020.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 94 privind alegerea presedintilor de sedinta a Consiliului Local al municipiului Radauti pentru perioada iunie-octombrie 2020", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2020/07/HCL-nr.-94-din-17.06.2020.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 95 privind rectificarea bugetului local de venituri si cheltuieli pentru anul 2020", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2020/07/HCL-nr.-95-din-17.06.2020.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 96 privind aprobarea tarifelor pentru serviciile medicale cu plata prestate de catre Spitalul Municipal “Sf. Dr. Cosma si Damian” Radauti", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2020/07/HCL-nr.-96-din-17.06.2020.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 97 privind aprobarea contului de execuţie la 31.03.2020", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2020/07/HCL-nr.-97-din-23.06.2020.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 98 privind aprobarea documentației tehnico-economice și a indicatorilor tehnico-economici, pentru obiectivul de investiții «Amplasare tribună la terenul de sport al Colegiului Tehnic Rădăuţi», municipiul Rădăuţi, judeţul Suceava", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2020/07/HCL-nr.-98-din-23.06.2020.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 99 privind aprobarea documentației tehnico-economice și a indicatorilor tehnico-economici, pentru obiectivul de investiții «Reabilitare acoperiş clădire liceu Colegiul Andronic Motrescu din municipiul Rădăuţi»", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2020/07/HCL-nr.-99-din-23.06.2020.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 100 privind aprobarea documentației tehnico-economice și a indicatorilor tehnico-economici, pentru obiectivul de investiții «Amenajare curte interioară cu pavaj Colegiul Andronic Motrescu din municipiul Rădăuţi»»", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2020/07/HCL-nr.-100-din-23.06.2020.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 101 privind aprobarea documentației tehnico-economice și a indicatorilor tehnico-economici, pentru obiectivul de investiții «Reparaţii şi reabilitare în vederea obţinerii autorizaţiei ISU la Şcoala Gimnazială Mihai Eminescu»,municipiul Rădăuţi»", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2020/07/HCL-nr.-101-din-23.06.2020.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 102 privind aprobarea creditelor de angajament pentru acţiuni multianuale la obiectivul de investiţii ̎ Reabilitare acoperiş clădire liceu Colegiul Andronic Motrescu din municipiul Rădăuţi ̎", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2020/07/HCL-nr.-102-din-23.06.2020-1.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 103 privind aprobarea creditelor de angajament pentru acţiuni multianuale la obiectivul de investiţii ̎ Pavare curte interioară Colegiul Andronic Motrescu din municipiul Rădăuţi ̎", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2020/07/HCL-nr.-103-din-23.06.2020.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 104 privind neasumarea responsabilităţii organizării şi derulării procedurilor de atribuire a contractelor-acordurilor-cadru pentru achiziţia produselor aferente Programului pentru Şcoli al României şi a contractelor /acordurilor-cadru de prestare a serviciilor pentru derularea măsurilor educative, la nivelul Municipiului Rădăuţi", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2020/07/HCL-nr.-104-din-23.06.2020.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 105 privind aprobarea creditelor de angajament pentru acţiuni multianuale la obiectivul de investiţii ̎ Intocmit registru spaţii verzi în Municipul Rădăuţi ̎ şi ̎ Actualizare Plan Urbanistic General şi Regulament Local de Urbanism ̎", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2020/07/HCL-nr.-105-din-23.06.2020.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 106 privind aprobarea Planului Urbanistic Zonal (P.U.Z) şi Regulamentul Local de Urbanism pentru ,, Schimbare destinaţie din locuinţă unifamilială P+1E+M în locuinţe colective P+1E+M şi apartamentare, din strada Putnei nr. 129, municipiul Rădăuţi, judeţul Suceava”", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2020/07/HCL-nr.-106-din-23.06.2020.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 107 privind aprobarea Planului Urbanistic Zonal (P.U.Z) şi Regulamentul Local de Urbanism pentru ,, Construire ansamblu de locuinţe colective – 4 blocuri cu regim de înălţime D+P+4E – cu spaţii comerciale la parter, pe str. Calea Bucovinei, f.n. în municipiul Rădăuţi, judeţul Suceava”", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2020/07/HCL-nr.-107-din-23.06.2020.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 108 privind modificarea şi completarea HCL nr. 243/31.10.2019privind închirierea prin licitaţie publică, a unor spaţii cu altă destinaţie decât cea de locuinţă, situate în Municipiului Rădăuţi, str. Ştefan cel Mare nr. 25, spaţii aflate în domeniul privat al municipiului", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2020/07/HCL-nr.-108-din-23.06.2020.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 109 privind aprobarea înscrierii în Cartea Funciară a terenului curţi-construcţii în suprafaţă de 20,00 mp aparţinând domeniului public al municipiului Rădăuţi, situat în Municipiul Rădăuţi, str. Mihai Viteazu nr. 1B, în vederea trecerii în domeniul privat şi concesionării", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2020/07/HCL-nr.-109-din-23.06.2020.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 110 privind atestarea apartenenţei la domeniul privat al municipiului Rădăuţi, judeţul Suceava a imobilului cu nr. cadastral:55214", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2020/07/HCL-nr.-110-din-23.06.2020-1.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 111 privind atestarea apartenenţei la domeniul privat al municipiului Rădăuţi, judeţul Suceava a 3 parcele de teren", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2020/07/HCL-nr.-111-din-23.06.2020.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 112 privind desemnarea consilierilor locali care să facă parte din comisia de vânzare prin licitaţie publică a imobilelor aparţinând domeniului privat al Municipiului Rădăuţi şi aprobarea modelului cadru a Caietului de sarcini pentru procedura vânzării prin licitaţie publică", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2020/07/HCL-nr.-112-din-23.06.2020.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 113 privind aprobarea vânzarii prin licitaţie publică a unui număr de 51 imobile, terenuri, aparţinând domeniului privat al municipiului Rădăuţi", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2020/07/HCL-nr.-113-din-23.06.2020-partea-1-1.pdf")),
                                  ),
                                ),
                              ],
                            ),
                            builder: (_, collapsed, expanded) {
                              return Padding(
                                padding: EdgeInsets.only(
                                    left: 10, right: 10, bottom: 0),
                                child: Expandable(
                                  //collapsed: collapsed,
                                  expanded: expanded,
                                  theme: const ExpandableThemeData(
                                      crossFadePoint: 0),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              ExpandableNotifier(
                child: Container(
                  padding: const EdgeInsets.only(
                    left: 15,
                    right: 15,
                  ),
                  width: MediaQuery.of(context).size.width,
                  child: Card(
                    margin:
                        const EdgeInsets.only(right: 0, left: 0, bottom: 15.0),
//elevation: 4,
//color: Colors.white,
//childAspectRatio: (MediaQuery.of(context).size.width/2 - 22.5) / (MediaQuery.of(context).size.height/5 - 60),
/*shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(2)),
            ),*/
                    clipBehavior: Clip.antiAlias,
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(
                              5), //const EdgeInsets.all(20),
                          child: Row(
                            children: <Widget>[
                              Column(
                                children: <Widget>[],
                              ),
                              Column(
                                children: <Widget>[],
                              ),
                            ],
                          ),
                        ),
                        ScrollOnExpand(
                          scrollOnExpand: true,
                          scrollOnCollapse: false,
                          child: ExpandablePanel(
                            theme: const ExpandableThemeData(
                              headerAlignment:
                                  ExpandablePanelHeaderAlignment.center,
                              tapBodyToCollapse: true,
                            ),
                            header: Padding(
                                padding: EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      "2019", //"ExpandablePanel",
                                      // ignore: deprecated_member_use
                                      style: Theme.of(context).textTheme.body2,
                                    ),
                                  ],
                                )),
                            collapsed: Text(
                              '2019',
                              softWrap: true,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            expanded: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                /*Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Text(
                                    'Descriere',//
                                    softWrap: true,
                                    overflow: TextOverflow.fade,
                                  ),
                                ),*/
                                //1
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 4 privind aprobarea Devizului general reactualizat ulterior încheierii contractelor de achiziție publică și aprobarea cofinanţării costurilor neeligibile pentru obiectivul de investiții „Extindere și modernizare Grădinița cu program normal ”Sfânta Treime” Rădăuți”", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/02/HCL-4-din-23.01.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 5 privind aprobarea Devizului general reactualizat ulterior încheierii contractelor de achiziție publică și aprobarea cofinanţării costurilor neeligibile pentru obiectivul de investiții „Reabilitare și modernizare Grădinița cu program normal nr. 6 Rădăuți”", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/02/HCL-5-din-23.01.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 6 privind aprobarea Devizului general reactualizat ulterior încheierii contractelor de achiziție publică și aprobarea cofinanţării costurilor neeligibile pentru obiectivul de investiții „Extindere Școala Gimnazială ”Mihai Eminescu” Rădăuți cu un corp de clădire nou (P+2E)”", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/02/HCL-6-din-23.01.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 7 privind aprobarea Devizului general reactualizat ulterior încheierii contractelor de achiziție publică și aprobarea cofinanţării costurilor neeligibile pentru obiectivul de investiții „Termoizolare față de pentru Grădinița cu program prelungit ”Prichindelul” Rădăuți”", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/02/HCL-7-din-23.01.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 8 privind aprobarea pentru anul 2019 a Planului de acţiuni sau lucrări de interes local, pentru repartizarea orelor de muncă pentru persoanele beneficiare de prevederile Legii nr.416/2001 privind venitul minim garantat, care prestează acţiuni ori lucrări de interes local", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/02/HCL-8-din-23.01.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 9 privind exprimarea acceptului de înfiinţare a ,,Consorţiului Şcolar Rădăuţi”", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/02/HCL-9-din-23.01.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 11 privind aprobarea dezmembrării terenului situat în Comuna Frătăuţii Vechi, sat Măneuţi, judeţul Suceava, identic cu imobilul cu nr. cadastral:30782", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/02/HCL-11-din-23.01.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 12 privind aprobarea înscrierii în Cartea funciară a terenului curţi-construcţii în suprafaţă de 35,00 mp aparţinând domeniului public al Municipiului Rădăuţi, situate în Municipiul Rădăuţi, str. Mihai Viteazu f. nr., în vederea trecerii în domeniul privat şi concesionării", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/02/HCL-12-din-23.01.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 13 privind completarea inventarului bunurilor care fac parte din domeniul privat al municipiului Rădăuţi, judeţul Suceava cu o suprafaţă de 300 mp teren curţi –construcţii situat în intravilanul municipiului Rădăuţi, str. Tolocii nr. 97", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/08/HCL-13-din-23.01.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 14 privind desemnarea consilierilor locali care să facă parte din comisia de vânzare prin licitaţie publică a imobilelor aparţinând domeniului privat al municipiului Rădăuţi şi aprobarea modelului cadru al Caietului de sarcini pentru procedura vânzării prin licitaţie publică", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/02/HCL-14-din-23.01.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 15 privind aprobarea vânzării prin licitaţie publică a două imobile, aparţinând domeniului privat al municipiului Rădăuţi, situate în str. ing. Andronic Motrescu f.nr. respectiv, str. Jalcău f.nr.", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/02/HCL-15-din-23.01.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 16 privind aprobarea vânzării prin licitaţie publică a cinci imobile, aparţinând domeniului privat al municipiului Rădăuţi, situate în str. Tolocii f.n, str. Gheorghe Tofan f.n, str. Mihail Kogalniceanu nr. 19 şi str. Sfantul Dumitru f.n", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/02/HCL-16-din-23.01.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 25 privind aprobarea înscrierii în Cartea Funciară a terenului curţi-construcţii în suprafaţă de 18,20 mp aparţinând domeniului public al Municipiului Rădăuţi, situate în Municipiul Rădăuţi, str. Mihai Viteazu, nr. 3D, în vederea trecerii în domeniul privat şi concesionării", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/02/HCL-25-din-23.01.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 26 privind stabilirea salariilor pentru funcțiile publice și contractuale din cadrul aparatului de specialitate al primarului, sectoarelor subordonate și serviciilor publice din subordinea Consiliului Local Rădăuți", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/02/HCL-nr.-26-din-30.01.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 27 privind modificarea statului de funcții al Spitalului Municipal Sf. Dr. Cosma și Damian Rădăuți, prin transformarea unor posturi și suplimentarea cu un post de îngrijitoare în CPU", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/02/HCL-nr.-27-din-30.01.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 31 privind aprobarea organizării Târgului ,,Mărţişor 2019”", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/03/HCL-nr.-31-din-28.02.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 32 privind aprobarea modificării statului de funcţii, ca urmare a promovării în grad professional imediat superior, a auditorului public intern din cadrul aparatului propriu de specialitate al primarului Municipiului Rădăuţi", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/03/HCL-nr.-32-din-28.02.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 33 privind aprobarea unor acte de autoritate pentru apărarea împotriva incendiilor", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/03/HCL-nr.-33-din-28.02.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 34 pentru aprobarea Regulamentului privind atestarea/autorizarea administratorilor de condominii", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/03/HCL-nr.-34-din-28.02.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 35 pentru aprobarea ,,Regulamentului compartimentului specializat din cadrul Primăriei Municipiului Rădăuţi, privind sprijinirea, îndrumarea şi controlul asociaţilor de proprietari” din Municipiul Rădăuţi", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/03/HCL-nr.-35-din-28.02.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 36 privind aprobarea contului de execuţie la 31.12.2018", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/03/HCL-nr.-36-din-28.02.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 37 privind aprobarea documentației tehnico-economice și a indicatorilor tehnico-economici, pentru obiectivul de investiții «Modernizare trotuar prin pavare, strada Bogdan Vodă (din faţa imobilului nr. 36 până la intersecţie str. Mihai Viteazu – partea dreaptă), Rădăuţi, judeţul Suceava»", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/03/HCL-nr.-37-din-28.02.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 38 privind aprobarea documentației tehnico-economice și a indicatorilor tehnico-economici, pentru obiectivul de investiții «Modernizare trotuar prin pavare, strada str. Simion Bărnuțiu (intersecție str. Tudor Vladimirescu cu str. Gheorghe Lazăr- partea dreaptă), Rădăuţi, judeţul Suceava»", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/03/HCL-nr.-38-din-28.02.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 39 privind aprobarea documentației tehnico-economice și a indicatorilor tehnico-economici, pentru obiectivul de investiții «Modernizare trotuar prin pavare, strada Aron Pumnul (intersecție str. Simion Bărnuțiu – intersecție str. Oborului – partea dreaptă și partea stângă), Rădăuţi, judeţul Suceava»", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/03/HCL-nr.-39-din-28.02.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 40 privind aprobarea documentației tehnico-economice și a indicatorilor tehnico-economici, pentru obiectivul de investiții «Modernizare trotuar prin pavare, strada Volovăţului, partea dreaptă ( intersecţie Baia Comunală – Alee Bloc RCS&RDS Volovăţului şi alee acces spaţiu verde din faţa parcării din str. Călăraşi), municipiul Rădăuţi, judeţul Suceava»", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/03/HCL-nr.-40-din-28.02.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 41 privind aprobarea documentației tehnico-economice și a indicatorilor tehnico-economici pentru obiectivul de investiții «Reparaţii acoperiș (şarpantă şi învelitoare) la clădirea din str. Piaţa Unirii, nr. 67 (latura sud)» municipiul Rădăuţi, judeţul Suceava", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/03/HCL-nr.-41-din-28.02.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 42 privind aprobarea documentațiilor tehnico-economice și a indicatorilor tehnico-economici, pentru obiectivele de investiții «Modernizări cu asfalt» str. 9 Mai, str. Tineretului, str. Plugarilor, str. Pepenăriei, str. Papetăriei, str. Mănăstirii, str. Mică, str. C. Dobrogeanu Gherea, str. Merilor, str. Berăriei, str. C.Colibaba, str. Recoltei, str. Sitarilor, municipiul Rădăuți, județul Suceava", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/03/HCL-nr.-42-din-28.02.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 43 privind aprobarea documentației tehnico-economice și a indicatorilor tehnico-economici, pentru obiectivul de investiții «Modernizare pistă de atletism, stadion municipal Rădăuţi» municipiul Rădăuţi, judeţul Suceava", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/03/HCL-nr.-43-din-28.02.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 44 privind stabilirea componenţei echipe mobile pentru intervenţia de urgenţă în cazurile de violenţă domestică la nivelul municipiului Rădăuţi", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/03/HCL-nr.-44-din-28.02.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 45 privind includerea în domeniul privat al municipiului Rădăuţi, judeţul Suceava, a două parcele de teren", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/03/HCL-nr.-45-din-28.02.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 46 privind includerea în domeniul privat al municipiului Rădăuţi, judeţul Suceava, a două parcele de teren", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/03/HCL-nr.-46-din-28.02.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 47 privind includerea în domeniul privat al municipiului Rădăuţi, judeţul Suceava, al unui nr. de 22 parcele de teren", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/03/HCL-nr.-47-din-28.02.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 48 privind includerea în domeniul privat al municipiului Rădăuți, judeţul Suceava a suprafeţei de 428,25 mp reprezentând cotă indiviză de ¾ din terenul identificat cadastral sub nr. 34307, înscris în C.F. 34307, situat în str. Volovăţului nr. 39, municipiul Rădăuţi", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/03/HCL-nr.-48-din-28.02.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 49 privind aprobarea înscrierii în Cartea Funciară a terenului curţi-construcţii în suprafaţă de 5,00 mp aparţinând domeniului public al Municipiului Rădăuţi, situat în str. Gen. Iacob Zadik nr. 18, în vederea trecerii în domeniul privat şi concesionării", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/03/HCL-nr.-49-din-28.02.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 50 privind închirierea prin licitaţie publică deschisă, organizată în condiţiile legii, a unor terenuri aflate în domeniul privat al Municipiului Rădăuţi", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/03/HCL-nr.-50-din-28.02.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 51 privind închirierea prin licitaţie publică deschisă, organizată în condiţiile legii, a unui teren în suprafaţă de 14 mp aflat în domeniul public al Municipiului Rădăuţi, situat în Municipiul Rădăuţi, str. Piaţa Unirii f. nr", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/03/HCL-nr.-51-din-28.02.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 52 privind închirierea prin licitaţie publică deschisă, organizată în condiţiile legii, a unui teren în suprafaţă de 4 mp aflat în domeniul public al Municipiului Rădăuţi, situat în Municipiul Rădăuţi, str. Piaţa Unirii f. nr.", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/03/HCL-nr.-52-din-28.02.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 53 pentru modificarea H.C.L. nr. 16/23.01.2019 privind aprobarea vânzării prin licitaţie publică a cinci imobile, aparţinând domeniului privat al municipiului Rădăuţi, situate în str. Tolocii f.n, str. Gheorghe Tofan f.n, str. Mihail Kogalniceanu nr. 19 şi str. Sfântul Dumitru f.n.", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/03/HCL-nr.-53-din-28.02.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 54 privind aprobarea vânzării prin licitaţie publică a imobilului, aparţinând domeniului privat al municipiului Rădăuţi, situate în str. Plugarilor f.n", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/03/HCL-nr.-54-din-28.02.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 55 privind aprobarea vânzării prin licitaţie publică a imobilului, aparţinând domeniului privat al municipiului Rădăuţi, situat în str. Mihai Bodnar nr. 43", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/03/HCL-nr.-55-din-28.02.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 56 privind aprobarea vânzării prin licitaţie publică a imobilului aparţinând domeniului privat al municipiului Rădăuţi, situat în str. Jalcău f.n", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/03/HCL-nr.-56-din-28.02.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 57 privind aprobarea vânzării prin licitaţie publică a imobilului, aparţinând domeniului privat al municipiului Rădăuţi, situat în str. ing. Andronic Motrescu f.n", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/03/HCL-nr.-57-din-28.02.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 58 privind aprobarea vânzării prin licitaţie publică a imobilului aparţinând domeniului privat al municipiului Rădăuţi, situat în str. Jalcău f.n", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/03/HCL-nr.-58-din-28.02.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 59 privind aprobarea vânzării prin licitaţie publică a două imobile, aparţinând domeniului privat al municipiului Rădăuţi, situate în str. Jalcău nr. 28", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/03/HCL-nr.-59-din-28.02.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 60 privind aprobarea vânzării prin licitaţie publică a două imobile, aparţinând domeniului privat al municipiului Rădăuţi, situate în str. Jalcău nr. 26", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/03/HCL-nr.-60-din-28.02.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 61 privind aprobarea vânzării prin licitaţie publică a imobilului, aparţinând domeniului privat al municipiului Rădăuţi, situat în str. Rozelor f.n", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/03/HCL-nr.-61-din-28.02.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 75 privind aprobarea tarifelor pentru serviciile medicale cu plată prestate de către Spitalul ,,Sf. Dr. Coşma şi Damian”Rădăuţi", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/04/HCL-75-din-28.03.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 76 privind modificarea statului de funcţii al Spitalului Municipal Sf. Dr. Cosma şi Damian Rădăuţi, prin transformarea unor posturi", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/04/HCL-76-din-28.03.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 77 privind aprobarea Planului de Ordine şi Siguranţă Publică al Poliţiei Locale Rădăuţi", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/04/HCL-77-din-28.03.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 78 cuprinzând norme stabilite de consiliul local Rădăuţi pentru instituţiile publice, agenţii economici, persoanele juridice şi cetăţeni (persoane fizice) cu privire la: gospodărirea, asigurarea igienei publice, salubrizării, întreţinerea spaţiilor verzi, protecţia mediului înconjurător, întreţinerea şi folosirea construcţiilor şi utilizarea drumurilor publice, buna convieţuire, ordinea şi liniştea publică, utilizarea domeniului public şi privat şi afişarea materialelor publicitare", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/04/HCL-78-din-28.03.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 79 privind aprobarea prelungirii, pe o perioadă de 2 ani, a contractului privind activitatea de iluminat public în Municipiul Rădăuţi nr. 3575/13.04.2007 încheiat între Municipiul Rădăuţi şi S.C. Servicii Comunale S.A. Rădăuţi", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/04/HCL-79-din-28.03.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 80 privind aprobarea Strategiei de Dezvoltare a Serviciilor Sociale la nivelul municipiului Rădăuţi pentru perioada 2019-2029", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/04/HCL-80-din-28.03.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 81 privind aprobarea Planului anual de acțiune privind serviciile sociale administrate și finanțate din bugetul local, pentru anul 2019", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/04/HCL-81-din-28.03.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 82 privind modificarea inventarului bunurilor care fac parte din domeniul public al municipiului Rădăuţi, judeţul Suceava, înscris în Anexa la Hotărarea Consiliului Local nr. 82/26.08.1999, cu modificările şi completările ulterioare", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/04/HCL-82-din-28.03.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 83 privind aprobarea radierii dreptului de prorietate, înscris pentru municipiul Rădăuţi – domeniul public, în baza H.C.L. nr. 126/23.07.2009 din C.F. nr. 30668 Frătăuţii Noi, pentru imobilul cu nr. cadastral 30668 Frătăuţii Noi, în suprafaţă de 90.463 mp şi aprobarea rectificării C.F. în sensul radierii dreptului de proprietate înscris pentru municipiul Rădăuţi – domeniul public, în baza Actului notarial. nr. 29/07.02.2019 din C.F. 35152 Frătăuţii Vechi pentru imobilul cu nr. cadastral 35152, în suprafaţă de 4.324 mp şi C.F. 35153 Frătăuţii Vechi, pentru imobilul cu nr. cadastral 35153, în suprafaţă de 137.600 mp, provenite din dezmembrarea imobilului cu nr. cadastral 30782", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/04/HCL-83-din-28.03.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 84 privind includerea unui bun imobil în domeniul public al municipiului Rădăuţi, judeţul Suceava", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/04/HCL-84-din-28.03.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 85 privind includerea în domeniul privat al municipiului Rădăuţi, judeţul Suceava, a trei parcele de teren", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/04/HCL-85-din-28.03.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 86 privind includerea în domeniul privat al municipiului Rădăuţi, judeţul Suceava a patru parcele de teren", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/04/HCL-86-din-28.03.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 87 privind includerea în domeniul privat al municipiului Rădăuţi, judeţul Suceava a terenului curţi – construcţii în suprafaţă de 14.199 mp, situat în intravilanul municipiului Rădăuţi", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/04/HCL-87-din-28.03.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 88 privind includerea în domeniul privat al municipiului Rădăuţi, judeţul Suceava a terenului arabil în suprafaţă de 200 mp situat în intravilanul municipiului Rădăuţi, str. Vladimir Trebici f.n", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/04/HCL-88-din-28.03.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 89 privind aprobarea vânzării prin licitaţie publică a imobilului, aparţinând domeniului privat al municipiului Rădăuţi, situat în str. Dimitrie Onciul nr. 35 A", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/04/HCL-89-din-28.03.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 90 privind concesionarea, prin licitaţie publică, a terenului în suprafaţă de 64,00 mp teren, situat în intravilanul Municipiului Rădăuţi, str. Grănicerului f.nr., în vederea construirii unui spaţiu comercial pentru produse alimentare şi industriale", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/04/HCL-90-din-28.03.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 91 privind actualizarea devizului general pentru obiectivul de investiţii << Mordenizare cu asfalt str. Hipodromului, str. Cucului, str. Mihai Pitei, str. Valea Seacă, str. Şerpuită, str. Uzinei, str. Cărămidăriei şi str. Tirului, municipiul Rădăuţi, judeţul Suceava", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/04/HCL-91-din-28.03.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 92 privind alegerea președintilor de ședință a Consiliului Local al municipiului Rădăuți pentru perioada aprilie 2019 – iunie 2020", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/04/HCL-92-din-28.03.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 93 privind trecerea din domeniul public în domeniul privat al Municipiului Rădăuţi a terenului în suprafaţă de 35,00 mp, situat în intravilanul Municipiului Rădăuţi, str. Mihai Viteazu f. Nr., şi concesionarea acestuia către Firma Davalmar Com S.R.L. fără licitaţie publică, în vederea extinderii construcţiei", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/04/HCL-93-din-28.03.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 97 privind aprobarea Devizului general reactualizat în baza OUG nr. 114/2018 şi aprobarea cofinanţării pentru obiectivul de investiţii ..Termoizolare faţade pentru Grădiniţa cu program prelungit ,, Prichindelul” Rădăuţi”", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/04/HCL-97-din-28.03.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 98 privind aprobarea Proiectului ,,VENUS – Împreună pentru o viaţă în siguranţă”, şi a contribuţiei proprii în proiect, a Municipiului Rădăuţi, în vederea finanţării în cadrul Programului Operaţional Capital Uman 2017-2020", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/04/HCL-98-din-28.03.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 99 privind aprobarea implementării de către Municipiul Rădăuţi a acţiunii/proiectului << WiFi4U Promovarea conectivităţii la internet în comunităţile locale>> conform Acordului de Grant încheiat prin Mecanismul pentru interconectarea Europei (MIE) WiFi4EU nr. INEA/CEF/WiFi4EU/1-2019/009493 – 012519 şi stabilirea locaţiilor de amplasare a punctelor de acces a reţelei Wi-Fi", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/04/HCL-99-din-28.03.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 100 privind aprobarea documentației tehnico-economice și a indicatorilor tehnico-economici, pentru obiectivul de investiții «Modernizare cu asfalt str. Parcului, municipiul Rădăuţi, judeţul Suceava»", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/05/HCL-100-din-17.04.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 101 privind aprobarea documentației tehnico-economice și a indicatorilor tehnico-economici, pentru obiectivul de investiții «Parcare şi trotuar dreapta ( int. Calea Bucovinei cu Piaţa Mică – Bogdan Vodă) str. Grănicerului, municipiul Rădăuţi, judeţul Suceava, modernizare cu asfalt »", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/05/HCL-101-din-17.04.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 102 privind aprobarea documentației tehnico-economice și a indicatorilor tehnico-economici, pentru obiectivul de investiții «Modernizare cu asfalt str. Fagilor, municipiul Rădăuţi, judeţul Suceava»", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/05/HCL-102-din-17.04.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 103 privind stabilirea costului mediu lunar de întreţinere pentru o persoană vârstnică şi a contribuţiei lunare de întreţinere datorate de persoanele vârstnice sau de către susţinătorii legali ai persoanelor vârstnice asistate în Căminul pentru Persoane Vârstnice Rădăuţi", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/05/HCL-103-din-17.04.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 104 privind aprobarea creditelor de angajament pentru acţiuni multianuale la obiectivul de investiţii ,,Proiectare şi execuţie lucrări – Modernizare cu asfalt str. 9 Mai, str. Tineretului, str. Plugarilor, str. Pepenăriei, str. Papetăriei, str. Mănăstirii, str. Mică, str. Constantin Dobrogeanu Gherea, str. Merilor, str. Berăriei, str. Constantin Colibaba, str. Recoltei, str. Sitarilor, str. Parcului, str. Fagilor în Municipiul Rădăuţi – diriginţie şantier, comisioane ISC”", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/05/HCL-104-din-17.04.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 105 privind aprobarea bugetului propriu al Municipiului Rădăuţi şi al unităţilor subordonate Consiliului Local al Municipiului Rădăuţi, pentru anul 2019", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/05/HCL-105-din-17.04.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 106 privind aprobarea actului adiţional nr. 1 la contractul de dare în administrare al serviciului de transport, distribuţie şi furnizare a energiei termice în sistem centralizat în Municipiul Rădăuţi nr. 17021/22.11.2018, înregistrat la S.C. Servicii Comunale S.A. cu nr. 3081/28.11.2018", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/05/HCL-106-din-24.04.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 107 privind aprobarea modificării statului de funcţii, pentru personalul contractual din cadrul Direcţiei de Asistenţă Socială, Aparatul de specialitate al primarului şi Aparatul de lucru al Consiliului Local, care a susţinut examenul de promovare în grad profesional", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/05/HCL-107-din-24.04.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 108 privind aprobarea modificării statului de funcţii pentru o funcţie publică vacantă din cadrul aparatului propriu de specialitate al primarului municipiului Rădăuţi – Direcţia Poliţiei Locale", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/05/HCL-108-din-24.04.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 109 pentru modificarea şi completarea H.C.L. nr. 75/16.04.2009, H.C.L. nr. 189/18.12.2014 şi H.C.L. nr. 8/23.01.2019", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/05/HCL-109-din-24.04.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 110 privind includerea în domeniul privat al Municipiului Rădăuţi, judeţul Suceava, a şase parcele de teren", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/05/HCL-110-din-24.04.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 111 privind aprobarea vânzării prin licitaţie publică a imobilului, aparţinând domeniului privat al municipiului Rădăuţi, situat în str. Unirea Principatelor f.n.", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/05/HCL-111-din-24.04.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 112 privind aprobarea vânzării prin licitaţie publică a imobilului, aparţinând domeniului privat al municipiului Rădăuţi, situat în str. Porumbelului nr. 1", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/05/HCL-112-din-24.04.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 113 privind aprobarea vânzării prin licitaţie publică a imobilului, aparţinând domeniului privat al municipiului Rădăuţi, situat în str. Jalcău nr. 42", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/05/HCL-113-din-24.04.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 114 privind aprobarea vânzării prin licitaţie publică a imobilului, aparţinând domeniului privat al municipiului Rădăuţi, situat în str. Putnei f.n.", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/05/HCL-114-din-24.04.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 116 privind indexarea impozitelor şi taxelor locale, care constau într-o anumită sumă în lei sau care sunt stabilite pe baza unei anumite sume în lei", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/05/HCL-116-din-24.04.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 117 privind aprobarea Regulamentului pentru ocuparea domeniului public/privat al municipiului Rădăuţi, în vederea desfăşurării de activităţi sezoniere şi ocazionale", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/05/HCL-117-din-24.04.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 118 pentru modificarea H.C.L. nr. 108/29.05.2018 privind însuşirea unor bunuri ca aparţinând domeniului privat al Municipiului Rădăuţi, prelungirea termenului contractului de concesiune f. nr. Din 08.06.1993 şi schimbarea titularului contractului de concesiune nr. 16/7747 din 19.11.2002", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/05/HCL-118-din-24.04.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 119 cuprinzând norme stabilite de consiliul local Rădăuţi pentru instituţiile publice, agenţii economici, persoanele juridice şi cetăţeni (persoane fizice) cu privire la: gospodărirea, asigurarea igienei publice, salubrizării, întreţinerea spaţiilor verzi, protecţia mediului înconjurător, întreţinerea şi folosirea construcţiilor şi utilizarea drumurilor publice, buna convieţuire, ordinea şi liniştea publică, utilizarea domeniului public şi privat şi afişarea materialelor publicitare", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/05/HCL-119-din-24.04.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 120 privind aprobarea transmiterii în folosinţă gratuită a unor suprafeţe de teren şi/sau a dreptului de uz şi servitute cu titlu gratuit de trecere subterană pentru anumite suprafaţe de teren de până la 20 ml pe durata existenţei acestor racorduri/branşamente/capacităţi energetice din domeniul public sau privat al municipiului Rădăuţi, judeţul Suceava către operatorii de utilităţi pentru apă şi canalizare, gaze naturale şi energie electrică", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/05/HCL-120-din-24.04.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 121 privind aprobarea Listei de priorităţi pentru anul 2019 în vederea repartizării, prin închiriere, a locuinţelor construite prin ANL", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/05/HCL-121-din-24.04.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 122 privind aprobarea Regulamentului de Organizare şi Funcţionare al Serviciului Public Comunitar Local de Evidenţă a Persoanelor al municipiului Rădăuţi", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/05/HCL-122-din-24.04.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 123 privind aprobarea ”Planului de asigurare cu resurse umane, materiale şi financiare pentru gestionarea situaţiilor de urgenţă de pe teritoriul administrativ al municipiului Rădăuţi pentru anul 2018”", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/05/HCL-123-din-24.04.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 128 privind aprobarea vânzării prin licitaţie publică a două imobile, aparţinând domeniului privat al municipiului Rădăuţi, situat în str. Volovăţului f.n", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/05/HCL-128-din-24.04.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 130 privind aprobarea documentației tehnico-economice și a indicatorilor tehnico-economici, pentru obiectivul de investiții «Modernizare cu asfalt str. Spitalului (int. Cale ferată – int. Str. Volovăţului), str. Volovăţului (int. Str. Spitalului – int. Str. Tudor Vladimirescu), municipiul Rădăuţi, judeţul Suceava»", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/05/HCL-130-din-24.04.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 131 privind aprobarea documentațiilor tehnico-economice și a indicatorilor tehnico-economici, pentru obiectivele de investiții «Reabilitare străzi, municipiul Rădăuţi, jud. Suceava» str. Bogdan Vodă, str. Gării, str. Spitalului, str. Teiului, str. Ieraclie Porumbescu, str. Volovăţului, str. Ion Nistor, str. Constantin Dobrogeanu Gherea, str. Dimitre Dan, str. Şcolii Noi, str. Piaţa Unirii, str. Mărţişor, str. Măcelarilor, str. Topliţei, str. Horia, str. Grănicerului, str. Sf. Dumitru, str. Pictor Grigorescu, municipiul Rădăuți, județul Suceava", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/05/HCL-131-din-15.05.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 132 privind rectificarea bugetului local de venituri şi cheltuieli pentru anul 2019", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/05/HCL-132-din-15.05.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 133 pentru modificarea şi completarea Hotărârii Consiliului Local Rădăuţi nr. 104/17.04.2019 privind aprobarea creditelor de angajament pentru acţiuni multianuale la obiectivul de investiţii ,,Proiectare şi execuţie lucrări – Modernizare cu asfalt str. 9 Mai, str. Tineretului, str. Plugarilor, str. Pepenăriei, str. Papetăriei, str. Mănăstirii, str. Mică, str. Constantin Dobrogeanu Gherea, str. Merilor, str. Berăriei, str. Constantin Colibaba, str. Recoltei, str. Sitarilor, str. Parcului, str. Fagilor în Municipiul Rădăuţi – diriginţie şantier, comisioane ISC”", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/05/HCL-133-din-15.05.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 134 privind aprobarea bugetului de venituri şi cheltuieli al S.C. Servicii Comunale S.A. Rădăuţi, pentru anul 2019", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/06/HCL-134-din-23.05.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 135 privind aprobarea modificării statului de funcţii pentru o funcţie contractuală vacantă din cadrul aparatului propriu de specialitate al primarului municipiului Rădăuţi, Direcţia Tehnică", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/06/HCL-135-din-23.05.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 136 de modificare şi completare a HCL nr. 108/29.04.2019 privind aprobarea modificării statului de funcţii pentru o funcţie publică vacantă din cadrul aparatului propriu de specialitate al primarului municipiului Rădăuţi – Direcţia Poliţiei Locale", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/06/HCL-136-din-23.05.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 137 privind transformarea unei funcţii publice de execuţie ca urmare a susţinerii examenului de promovare în grad profesional de către un funcţionar public în cadrul Direcţiei de Asistenţă Socială din subordinea Consiliului Local al municipiului Rădăuţi, judeţul Suceava", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/06/HCL-137-din-23.05.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 138 privind includerea în domeniului privat al municipiului Rădăuţi, judeţul Suceava a terenului curţi — construcţii în suprafaţă de 750 mp situat în intravilanul municipiului Rădăuţi, str. Gării şi aprobarea dezmembrării acestuia în două imobile identificate cadastral cu nr. 54463, în suprafaţă de 285 mp, respectiv nr. cadastral 54464, în suprafaţă de 465 mp", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/06/HCL-138-din-23.05.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 139 privind includerea în domeniului privat al municipiului Rădăuţi, judeţul Suceava a terenului curţi-construcţii în suprafaţă de 234,77 mp situat în intravilanul municipiului Rădăuţi, str. Ion Nistor nr. 22, identificat cadastral cu nr. 771/2 înscris în C.F. nr. 54549 Rădăuţi", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/06/HCL-139-din-23.05.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 140 privind includerea în domeniul privat al municipiului Rădăuţi, judeţul Suceava a trei parcele de teren", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/06/HCL-140-din-23.05.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 141 privind includerea în domeniul privat al municipiului Rădăuţi, judeţul Suceava a patru parcele de teren", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/06/HCL-141-din-23.05.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 142 privind includerea în domeniul privat al Municipiului Rădăuţi cu terenul în suprafaţă de 32 mp situat în Municipiul Rădăuţi, str. Putnei, bloc nr. 11, în vederea concesionării", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/06/HCL-142-din-23.05.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 143 privind aprobarea înscrierii în C.F. a terenului curţi-construcţii în suprafaţă de 39,00 mp aparţinând domeniului public al Municipiului Rădăuţi, situat în Municipiul Rădăuţi, str. Calea Bucovinei nr. 3C, în vederea trecerii în domeniul privat şi concesionării", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/06/HCL-143-din-23.05.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 144 privind aprobarea vânzării prin licitaţie publică a imobilului, aparţinând domeniului privat al municipiului Rădăuţi, situat în str. ing. Andronic Motrescu nr. 2H", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/07/HCL-144-din-23.05.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 145 privind aprobarea vânzării prin licitaţie publică a imobilului, aparţinând domeniului privat al municipiului Rădăuţi, situat în str. Horea 61A.", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/06/HCL-145-din-23.05.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 146 privind aprobarea vânzării prin licitaţie publică a imobilului aparţinând domeniului privat al municipiului Rădăuţi, situat în str. Calea Cernăuţi nr. 81.", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/06/HCL-146-din-23.05.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 147 privind aprobarea vânzării prin licitaţie publică a imobilului, aparţinând domeniului privat al municipiului Rădăuţi, situat în str. Horodnicului f.n.", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/06/HCL-147-din-23.05.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 148 privind aprobarea vânzării prin licitaţie publică a imobilului, aparţinând domeniului privat al municipiului Rădăuţi, situat în str. Vasile Bumbac f.nr.", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/06/HCL-148-din-23.05.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 149 privind aprobarea vânzării prin licitaţie publică a imobilului, aparţinând domeniului privat al municipiului Rădăuţi, situat în str. Dorobanţului nr. 9", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/06/HCL-149-din-23.05.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 157 privind modificarea statului de funcţii al Spitalului Municipal Sf. Dr. Cosma şi Damian Rădăuţi, prin transformarea unor posturi în nivele superioare", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/07/HCL-157-din-25.06.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 158 privind aprobarea tarifelor pentru serviciile medicale cu plată prestate de către Spitalul ,,Sf. Dr. Cosma şi Damian” Rădăuţi", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/07/HCL-158-din-25.06.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 159 privind aprobarea Regulamentului de acordare a sumelor reprezentând stimulente financiare lunare acordate medicilor din Spitalul Municipal ,,Sf. Doctori Cosma şi Damian” Rădăuţi", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/07/HCL-159-din-25.06.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 160 privind aprobarea contractării unui credit în valoare de 285.000 euro (fătă TVA) pe o perioadă de maxim 5 ani, de către S.C. Servicii Comunale S.A. Rădăuţi, în vederea achiziţionării unei staţii de preparat mixturi asfaltice, tip SMAV 50", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/07/HCL-160-din-25.06.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 161 privind modificarea inventarului bunurilor care fac parte din domeniul public al municipiului Rădăuţi, judeţul Suceava, înscris în Anexa la Hotărarea Consiliului Local nr. 82/26.08.1999, cu modificările şi completările ulterioare", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/07/HCL-161-din-25.06.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 162 privind completarea inventarului bunurilor care fac parte din domeniul public al municipiului Rădăuţi, judeţul Suceava, înscris în Anexă la Hotărârea Consiliului Local nr. 82/26.08.1999, cu modificările şi completările ulterioare", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/07/HCL-162-din-25.06.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 163 privind aprobarea înscrierii în Cartea Funciară a terenului curţi-construcţii în suprafaţă de 27,00 mp aparţinând domeniului public al Municipiului Rădăuţi, situate în Municipiul Rădăuţi, str. Mihai Viteazu nr. 3D, în vederea trecerii în domeniul privat şi concesionării", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/07/HCL-163-din-25.06.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 164 privind aprobarea dezmembrării terenului situat în municipiul Rădăuţi, str. Horodnicului nr. 32, identic cu nr. Cadastral :52746", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/07/HCL-164-din-25.06.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 165 privind aprobarea vănzării prin licitaţie publică a imobilului aparţinând domeniului privat al municipiului Rădăuţi, situat în str. ing. Andronic Motrescu f.nr", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/07/HCL-165-din-25.06.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 166 privind aprobarea vănzării prin licitaţie publică a imobilului aparţinând domeniului privat al municipiului Rădăuţi, situat în str. Tineretului", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/07/HCL-166-din-25.06.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 167 privind aprobarea vânzării prin licitaţie publică a imobilului, aparţinând domeniului privat al municipiului Rădăuţi, situat în str. Mihai Pitei f.nr.", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/07/HCL-167-din-25.06.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 168 privind aprobarea vănzării prin licitaţie publică a imobilului aparţinând domeniului privat al municipiului Rădăuţi, situat în str. Mihai Pitei nr. 70", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/07/HCL-168-din-25.06.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 177 privind aprobarea modificării statului de funcţii pentru o funcţie publică vacantă din cadrul aparatului propriu de specialitate al primarului municipiului Rădăuţi – Direcţia Poliţiei Locale", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/07/HCL-177-din-25.06.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 178 privind acordarea ,,Diplomei de Aur“ şi a unui premiu, cuplurilor din municipiul Rădăuţi care au împlinit/împlinesc 50 de ani de căsătorie neîntreruptă în cursul anului 2019", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/07/HCL-178-din-25.06.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 179 privind aprobarea contului de execuţie la 31.03.2019", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/08/HCL-179-din-24.07.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 180 privind aprobarea tarifelor pentru serviciul public de producere, transport şi distribuţie a energiei termice începând cu 01.07.2019, prestate de către S.C. SERVICII COMUNALE S.A. Rădăuţi", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/08/HCL-180-din-24.07.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 181 privind actualizarea devizului general pentru obiectivul de investiții «Modernizare cu asfalt str. Hipodromului, str. Cucului, str. Mihai Pitei, str. Valea Seacă, str. Şerpuită, str. Uzinei, str. Caramidăriei şi str.Tirului, municipiul Rădăuți, județul Suceava»", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/08/HCL-181-din-24.07.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 182 privind aprobarea înscrierii în cartea funciară a unor unităţi individuale din imobilul construcţiei situat în strada Ştefan cel Mare nr. 25, a cotelor părţi comune din imobilul şi a cotelor din terenul aferent, aflate în proprietatea privată a municipiului Rădăuţi, judeţul Suceava", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/08/HCL-182-din-24.07.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 183 privind trecerea din domeniul public în domeniul privat al municipiului Rădăuţi a terenului în suprafaţă de 124 mp identificat cadastral sub nr. 52698 înscris în C.F. nr. 52698 a municipiului Rădăuţi", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/08/HCL-183-din-24.07.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 190 privind rectificarea bugetului local de venituri şi cheltuieli pentru anul 2019", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/08/HCL-190-din-24.07.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 191 privind aprobarea preţului pentru colectarea, transportul şi depozitarea deşeurilor în municipiul Rădăuţi", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/08/HCL-191-din-24.07.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 192 privind amplasarea bustului căpitanului aviator Vasile Niculescu în municipiul Rădăuți- parcul situat pe strada Calea Bucovinei – spațiul verde zona Stadionului", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/08/HCL-192-din-24.07.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 193 privind rectificarea bugetului de venituri şi cheltuieli pentru anul 2019", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/08/HCL-193-din-07.08.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 194 privind rectificarea bugetului local de venituri şi cheltuieli pentru anul 2019", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/09/HCL-194-din-29.08.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 195 privind aprobarea creditelor de angajament pentru acţiuni multianuale la obiectivul de investiţii “Întocmit registru spaţii verzi în Municipiul Rădăuţi “şi “Actualizare Plan Urbanistic General şi Regulament Local de Urbanism“", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/09/HCL-195-din-29.08.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 197 privind aprobarea modificării organigramei şi a statului de funcţii ale consiliului local şi ale aparatului de specialitate al primarului municipiului Rădăuţi", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/09/HCL-197-din-29.08.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 198 privind aprobarea documentației tehnico-economice și a indicatorilor tehnico-economici, pentru obiectivul de investiții «Amenajare parcare partea stângă str. Grănicerului şi reparaţii reţea electrică de iluminat public pe partea stângă str. Grănicerului, municipiul Rădăuţi, judeţul Suceava»", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/09/HCL-198-din-29.08.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 199 privind aprobarea documentației tehnico-economice și a indicatorilor tehnico-economici, pentru obiectivul de investiții «Amenajare trotuare partea dreaptă str. Grănicerului, municipiul Rădăuţi, judeţul Suceava»", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/09/HCL-199-din-29.08.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 200 privind aprobarea documentației tehnico-economice și a indicatorilor tehnico-economici, pentru obiectivul de investiții «Amenajări parcări şi alee str. Stadionului, municipiul Rădăuţi, judeţul Suceava»", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/09/HCL-200-din-29.08.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 201 privind aprobarea documentației tehnico-economice și a indicatorilor tehnico-economici, pentru obiectivul de investiții «Amenajări parcări şi alee str. Mihai Viteazul (lângă loc joacă), municipiul Rădăuţi, judeţul Suceava »", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/09/HCL-201-din-29.08.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 202 privind aprobarea documentației tehnico-economice și a indicatorilor tehnico-economici, pentru obiectivul de investiții «Amenajare grupuri sanitare corp B, strada Calea Bucovinei, nr. 9 (Corp C1) din cadrul Colegiului Naţional ,,Eudoxiu Hurmuzachi“ Rădăuţi, în vederea obţinerii autorizaţiei de funcţionare de la DSP Suceava»", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/09/HCL-202-din-29.08.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 203 privind aprobarea Devizului general actualizat în baza OUG nr. 114/2018 și aprobarea indicatorilor tehnico-economici actualizați pentru obiectivul de investiții „Modernizare pistă de atletism, stadion municipiul Rădăuți”", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/09/HCL-203-din-29.08.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 204 privind aprobarea înscrierii în Cartea Funciară a terenului curţi-construcţii în suprafaţă de 1,20 mp aparţinând domeniului public al Municipiului Rădăuţi, situat în Municipiul Rădăuţi, str. 22 Decembrie nr. 17, sc. A, în vederea trecerii în domeniul privat şi concesionării", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/09/HCL-204-din-29.08.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 211 privind aprobarea documentației tehnico-economice și a indicatorilor tehnico-economici, pentru obiectivul de investiții «Împrejmuire şi drum acces Piaţa Obor» municipiul Rădăuţi, judeţul Suceava", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/09/HCL-211-din-29.08.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 212 privind modificarea H.C.L. nr. 191/24.07.2019 privind aprobarea preţului pentru colectarea, transportul şi depozitarea deşeurilor în municipiul Rădăuţi.", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/09/HCL-212-din-29.08.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 213 privind aprobarea cooperarii cu EGGER ROMANIA SRL în vederea amplasării de către aceasta în municipiul Rădăuți – Parcul I, a unui ecran cu led-uri care să afşseze valorile emisiilor de formaldehida înregistrate de fabrica acesteia din municipiul Rădăuţi", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/09/HCL-nr.-213-din-10.09.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 214 privind aprobarea documentației tehnico-economice și a indicatorilor tehnico-economici, pentru obiectivul de investiții «Extindere reţea de iluminat public pe str. Andronic Motrescu şi str. Merilor» municipiul Rădăuţi, judeţul Suceava", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/09/HCL-nr.-214-din-10.09.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 215 pentru modificarea şi completarea H.C.L. nr. 273/2018 privind stabilirea impozitelor şi taxelor locale pentru anul 2019", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/10/HCL-nr.-215-din-26.09.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 217 privind aprobarea documentației tehnico-economice și a indicatorilor tehnico-economici, pentru obiectivul de investiții «Amenajare parcări resedintastr.Mihai Viteazu bloc nr.23, municipiul Radauti, judetul Suceava»", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/10/HCL-nr.-217-din-26.09.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 218 privind aprobarea documentației tehnico-economice și a indicatorilor tehnico-economici, pentru obiectivul de investiții «Amenajare parcări resedinta str. Mihai Viteazu bloc 22, municipiul Radauti, judetul Suceava»", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/10/HCL-nr.-218-din-26.09.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 219 privind aprobarea documentației tehnico-economice și a indicatorilor tehnico-economici, pentru obiectivul de investiții «Extindere retea alimentare cu apa pe str.Grivitei, str.Vladimir Trebici, str.Plevnei, str.Pompierilor (partial) si extindere retea canalizare str.Vladimir Trebici, str.Pompierilor (partial) in municipiul Radauti, jud.Suceava»", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/10/HCL-nr.-219-din-26.09.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 220 privind aprobarea documentației tehnico-economice și a indicatorilor tehnico-economici, pentru obiectivul de investiții «Amenajare trotuar str.Piata Unirii (int. str. Dimitrie Onciu – int. str. Ion Nistor partea dreapta), municipiul Radauti, judetul Suceava»", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/10/HCL-nr.-220-din-26.09.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 221 privind aprobarea amenajării şi sistematizării unui acces rutier şi pietonal din DN 2H – Calea Bucovinei, municipiul Rădăuţi, la spaţiul commercial ce se va construi pe parcela cu nr. cadastral 53582 Rădăuţi", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/10/HCL-nr.-221-din-26.09.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 222 pentru modificarea Hotărârii nr. 222 din 24.11.2016 privind aprobarea asocierii dintre Municipiul Rădăuţi şi o persoană juridică, în vederea derulării activităţii de capturare şi predare a câinilor comunitari fără stăpân în Municipiul Rădăuţi", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/10/HCL-nr.-222-din-26.09.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 223 privind trecerea din domeniul privat al municipiului Rădăuţi în domeniul public al municipiului Rădăuţi a terenului în suprafaţă de 19 mp, situate pe strada Libertăţii nr. 49-51, identificat cadastral sub nr. 54267 înscris în C.F. nr. 54267 a municipiului Rădăuţi", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/10/HCL-nr.-223-din-26.09.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 229 privind rectificarea bugetului local de venituri şi cheltuieli pentru anul 2019", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/10/HCL-nr.-229-din-26.09.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 230 privind aprobarea documentaţiei tehnico-economice şi a indicatorilor tehnico-economici pentru obiectivul de investiţii ,,Amenajare loc joacă pentru copii, construire copertină şi împrejmuire“ la Grădiniţa cu Program Prelungit Pinochio Rădăuţi", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/11/HCL-230-din-21.10.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 231 privind aprobarea documentaţiei tehnico-economice şi a indicatorilor tehnico-economici pentru obiectivul de investiţii ,,Amenajare spaţiu activităţi în aer liber“ la Şcoala Gimnazială Mihai Eminescu Rădăuţi", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/11/HCL-231-din-21.10.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 232 privind aprobarea creditelor de angajament pentru acţiuni multianuale la obiectivul de investiţii ,,Amenajare loc joacă pentru copii, construire copertină şi împrejmuire“ la Grădiniţa cu Program Prelungit Pinochio Rădăuţi", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/11/HCL-232-din-21.10.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 233 privind aprobarea creditelor de angajament pentru acţiuni multianuale la obiectivul de investiţii ,,Extindere reţea alimentară cu apă pe str. Griviţei, str. Vladimir Trebici, str. Plevnei, str. Pompierilor (parţial) şi extindere reţea canalizare str. Vladimir Trebici, str. Pompierilor (parţial) în municipiul Rădăuţi, judeţul Suceava“", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/11/HCL-233-din-21.10.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 234 pentru aprobarea Programului privind acordarea de finanţări nerambursabile în anul 2019 din bugetul propriu al municipiului Rădăuţi, pentru activităţi nonprofit de interes local", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/11/HCL-234-din-21.10.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 235 privind schimbarea destinaţiei din stradă cu sens unic, în parcare, a tronsonului din strada Piaţa Unirii, Municipiul Rădăuţi, judeţul Suceava şi montarea a trei bariere", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/11/HCL-235-din-21.10.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 236 privind rectificarea bugetului local de venituri si cheltuieli pentru anul 2019", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/12/HCL-236-din-25.10.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 237 pentru aprobarea Regulamentului privind procedura de vânzare a bunurilor imobile din domeniul privat al municipiului Rădăuţi, judeţul Suceava", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/11/HCL-237-din-31.10.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 238 pentru aprobarea Regulamentului privind procedura de închiriere a bunurilor imobile din domeniul public al municipiului Rădăuţi", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/11/HCL-238-din-31.10.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 239 privind atestarea apartenenței la domeniul privat al Municipiului Rădăuți a imobilului cu nr. cadastral 31294 Rădăuți, nr. topo 4040/316 din strada Obor f.n Municipiul Rădăuți și radierea dreptului de folosință înscris pentru Agenția Națională pentru Locuințe, pentru imobilul cu nr. cadastral 31294 Rădăuți, nr. topo 4040/316 din str. Obor f.n Municipiul Rădăuți", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/11/HCL-239-din-31.10.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 240 pentru modificarea Hotărârii nr. 222 din 24.11.2016 privind aprobarea asocierii dintre Municipiul Rădăuţi şi o persoana juridică, în vederea derulării activităţii de capturare, transport şi predare a câinilor comunitari fără stăpân în Municipiul Rădăuţi, cu modificările şi completările ulterioare", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/11/HCL-240-din-31.10.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 241 privind modificarea statului de funcţii al Spitalului Municipal Sf. Dr. Cosma şi Damian Rădăuţi, prin transformarea şi suplimentarea unor posturi", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/11/HCL-241-din-31.10.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 242 privind aprobarea dezmembrării terenului situat în municipiul Rădăuţi, str. Pandurilor f.nr., identic cu imobilul cu nr. cadastral:54516", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/11/HCL-242-din-31.10.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 243 privind închirierea prin licitaţie publică, a unor spaţii cu altă destinaţie decât cea de locuinţă, situate în Municipiului Rădăuţi, str. Ştefan cel Mare nr. 25, spaţii aflate în domeniul privat al municipiului", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/11/HCL-243-din-31.10.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 244 privind aprobarea amenajării şi sistematizării unui acces rutier şi pietonal din DN 2H – Calea Bucovinei, municipiul Rădăuţi, la spaţiul comercial ce se va construi pe parcela cu nr. cadastral 53582 Rădăuţi", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/11/HCL-244-din-31.10.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 245 privind conferirea titlului de ,,Cetăţean de Onoare al Municipiului Rădăuţi”", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/11/HCL-245-din-31.10.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 246 privind acordarea unor facilităţi fiscale", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/11/HCL-246-din-31.10.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 254 privind asocierea Municipiului Rădăuţi cu Creţu Manole – Întreprindere Familială, în vederea amenajării unui patinoar artificial, în Parcarea centrală, perioada 18.11.2019 – 15.02.2020", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/12/HCL-254-din-18.11.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 257 privind validarea mandatului de consilier local al domnului Hacman Mircea Cozma", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/12/HCL-257-din-27.11.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 258 privind rectificarea bugetului local de venituri şi cheltuieli pentru anul 2019", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/12/HCL-258-din-27.11.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 259 privind aprobarea organizării Sărbătorilor de iarnă în Municipiul Rădăuţi", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/12/HCL-259-din-27.11.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 260 privind aprobarea documentației tehnico-economice și a indicatorilor tehnico-economici, pentru obiectivul de investiții «Amenajare esplanadă, trepte CEC BANK, municipiul Rădăuţi, judeţul Suceava»", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/12/HCL-260-din-27.11.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 261 pentru modificarea H.C.L. nr. 216/26.09.2019 şi H.C.L. nr. 196/29.08.2019 privind aprobarea acordării unui sprijin financiar pentru zece medici din cadrul Spitalului Municipal Sf. Doctori Cosma şi Damian", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/12/HCL-261-din-27.11.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 262 privind transformarea unei funcții publice de execuție ca urmare a finalizării perioadei de stagiu de către un funcționar public cadrul Direcţiei de Asistenţă Socială din subordinea Consiliului Local al municipiului Rădăuţi, judeţul Suceava", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/12/HCL-262-din-27.11.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 263 privind aprobarea prelungirii duratei contractului de dare în administrare a serviciului public de transport distribuţie şi furnizare a energiei termice în sistem centralizat nr. 17021/22.11.2018, înregistrat la S.C. Servicii Comunale cu nr. 3081/28.11.2018, până la încheierea contractului sectorial pentru serviciul public de alimentare cu energie termică în Municipiul Rădăuţi", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/12/HCL-263-din-27.11.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 268 privind predarea către Ministerul Dezvoltării Regionale, Administrației Publice prin Compania Naţională de Investiţii “C.N.I.” S.A., a amplasamentului şi asigurarea condiţiilor în vederea executării obiectivului de investiţii , „Construire baza sportivă TIP 1” municipiul Rădăuți, judeţul Suceava", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/12/HCL-268-din-27.11.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 270 privind aprobarea modificării Contractului de Delegare al Gestiunii și mandatarea AJAC Suceava să semneze Actul Adițional nr. 5 în numele și pe seama UAT municipiul Rădăuți", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/12/HCL-270-din-09.12.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 271 privind aprobarea STUDIULUI DE FEZABILITATE și a indicatorilor tehnico-economici ai proiectului regional ”Dezvoltarea infrastructurii de apă și apă uzată din județul Suceava, în perioada 2014 – 2020”", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/12/HCL-271-din-09.12.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 272 privind aprobarea valorii investițiilor aferente UAT municipiul Rădăuṭi și a participării Consiliului Local al UAT municipiul Rădăuṭi la cofinanțareaProiectului regional ”Dezvoltarea infrastructurii de apă și apă uzată din județul Suceava în perioada 2014 – 2020”;", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/12/HCL-272-din-09.12.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 273 privind aprobarea Planului anual de evoluție a tarifelor conform rezultatelor Analizei Cost-Beneficiu pentru Proiectul regional ”Dezvoltarea infrastructurii de apă și apă uzată din județul Suceava în perioada 2014 – 2020”și mandatarea reprezentantului UAT municipiul Rădăuți să susțină și să voteze în Adunarea Generală a Asociaţiei Judeţene pentru Apă şi Canalizare Suceava(AJAC Suceava) aprobarea Planului anual de evoluție a tarifelor", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/12/HCL-273-din-09.12.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 274 privind punerea la dispoziția Societății ACET S.A. Suceava a terenurilor aferente investițiilor din cadrul Proiectului regional ”Dezvoltarea infrastructurii de apă și apă uzată din județul Suceava, în perioada 2014 – 2020", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/12/HCL-274-din-09.12.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 275 privind aprobarea tarifelor pentru serviciul public de producere, transport şi distribuţie a energiei termice începând cu 01.11.2019, prestate de către S.C. SERVICII COMUNALE S.A. Rădăuţi", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/12/HCL-275-din-09.12.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 276 privind rectificarea bugetului local de venituri si cheltuieli pentru anul 2019", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/12/HCL-276-din-09.12.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 277 privind aprobarea cuantumului burselor şcolare pentru elevii din învăţământul preuniversitar de stat din municipiul Rădăuţi", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2019/12/HCL-277-din-09.12.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 278 privind rectificarea bugetului local de venituri si cheltuieli pentru anul 2019", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2020/01/HCL-nr.-278-din-23.12.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 279 privind aprobarea documentaţiei tehnico – economice şi a indicatorilor tehnico – economici pentru obiectivul de investiţii ,,Lucrări de construire grupuri sanitare la Şcoala Gimnazială Regina Elisabeta (Sala de Sport) din municipiul Rădăuţi”", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2020/01/HCL-nr.-279-din-23.12.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 280 privind aprobarea creditelor de angajament pentru acţiuni multianuale la obiectivul de investiţii ,,Lucrări de construire grupuri sanitare la Şcoala Gimnazială Regina Elisabeta (Sala de Sport) din municipiul Rădăuţi”", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2020/01/HCL-nr.-280-din-23.12.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 281 privind aprobarea documentației tehnico-economice și a indicatorilor tehnico-economici, pentru obiectivul de investiții «Amplasare ascensor transport bolnavi pentru exterior la clădire – C1 Spital vechi» municipiul Rădăuţi, judeţul Suceava", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2020/01/HCL-nr.-281-din-23.12.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 282 privind aprobarea transformării unor posturi de natură contractuală în funcţii publice şi modificarea statului de funcţii al aparatului de specialitate al primarului municipiului Rădăuţi", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2020/01/HCL-nr.-282-din-23.12.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 283 pentru modificarea şi completarea HCL 160 din 24.09.2009 pentru aprobarea Regulamentului de Organizare şi funcţionarea a parcărilor de reşedinţă aflate pe raza municipiului Rădăuţi, a listei locurilor de parcare, a preţului de închiriere precum şi a modelului acordului de rezervare", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2020/01/HCL-nr.-283-din-23.12.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 284 privind menţinerea reţelei şcolare a unităţilor de învăţământ preuniversitar de stat şi particular din municipiul Rădăuţi, pentru anul şcolar 2020-2021", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2020/01/HCL-nr.-284-din.-23.12.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 285 privind aprobarea dezmembrării terenului situat în municipiul Rădăuţi, str. Mihai Pitei f.n. identic cu imobilul cu nr. cadastral:54093", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2020/01/HCL-nr.-285-din-23.12.2019.pdf")),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: new InkWell(
                                        child: new Text(
                                          "Hotarare nr. 287 privind aprobarea Planului Urbanistic Zonal (P.U.Z) şi Regulamentul Local de Urbanism pentru ,,Construire locuinţă unifamilială cu regim de înălţime P+M şi împrejmuire, pe strada Frâncei f. nr., în municipiul Rădăuţi, judeţul Suceava”", //
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                          ),
                                        ),
                                        onTap: () => UrlLauncher.launch(
                                            "https://primariaradauti.ro/wp-content/uploads/2020/01/HCL-nr.-287-din-23.12.2019.pdf")),
                                  ),
                                ),
                              ],
                            ),
                            builder: (_, collapsed, expanded) {
                              return Padding(
                                padding: EdgeInsets.only(
                                    left: 10, right: 10, bottom: 0),
                                child: Expandable(
                                  //collapsed: collapsed,
                                  expanded: expanded,
                                  theme: const ExpandableThemeData(
                                      crossFadePoint: 0),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/*class NewEventWidget extends StatelessWidget {
  final Event event;
  const NewEventWidget({Key key, this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpandableNotifier(
        child: Container(
          padding: const EdgeInsets.all(0),
          //width: 900,
          child: Card(
            margin: const EdgeInsets.only( right: 0, left: 0, bottom: 15.0 ),
            //elevation: 4,
            //color: Colors.white,
            //childAspectRatio: (MediaQuery.of(context).size.width/2 - 22.5) / (MediaQuery.of(context).size.height/5 - 60),
            /*shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(2)),
            ),*/
            clipBehavior: Clip.antiAlias,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(5),//const EdgeInsets.all(20),
                  child: Row(
                    children: <Widget>[
                      Column(
                        children: <Widget>[

                        ],
                      ),
                      Column(
                        children: <Widget>[

                        ],
                      ),

                    ],
                  ),
                ),

                ScrollOnExpand(
                  scrollOnExpand: true,
                  scrollOnCollapse: false,
                  child: ExpandablePanel(
                    theme: const ExpandableThemeData(
                      headerAlignment: ExpandablePanelHeaderAlignment.center,
                      tapBodyToCollapse: true,
                    ),
                    header: Padding(
                        padding: EdgeInsets.all(0),
                        child: Text(
                          "",//"ExpandablePanel",
                          style: Theme.of(context).textTheme.body2,
                        )),
                    collapsed: Text(
                      '',
                      softWrap: true,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    expanded: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(bottom: 10),
                          child: Text(
                            event.description,//
                            softWrap: true,
                            overflow: TextOverflow.fade,
                          ),
                        ),
                      ],
                    ),
                    builder: (_, collapsed, expanded) {
                      return Padding(
                        padding: EdgeInsets.only(left: 10, right: 10, bottom: 0),
                        child: Expandable(
                          //collapsed: collapsed,
                          expanded: expanded,
                          theme: const ExpandableThemeData(crossFadePoint: 0),
                        ),
                      );
                    },
                  ),
                ),

              ],
            ),

          ),
        ),
    );
  }
}*/
