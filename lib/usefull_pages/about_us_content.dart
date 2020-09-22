import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

class AboutUsContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            //padding: EdgeInsets.only(bottom: 30,),
            width: MediaQuery.of(context).size.width - 30,
            child: Image.asset(
              "assets/images/CoverAboutPage.png",
              fit: BoxFit.cover,
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width - 30,
            //padding: EdgeInsets.only(left: 10,),
            child: Text(
              "Rdăuțiul Civic",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          //1
          Container(
            padding: EdgeInsets.only(top: 10,),
            width: MediaQuery.of(context).size.width - 30,
            child: Text(
              'Grupul de inițiativă Rădăuțiul civic a apărut în luna iunie 2017 in mod oficial, după o serie de acțiuni civice '
                  +
                  'implementate deja de unii membri, pe bază de voluntariat și din dorința de a da ceva înapoi orașului lor natal, '
                  +
                  'iar în septembrie 2018 acesta a devenit asociație neguvernamentală.',
              style: TextStyle(
                fontSize: 15,
              ),
            ),
          ),
          //2
          Container(
            padding: EdgeInsets.only(top: 10,),
            width: MediaQuery.of(context).size.width - 30,
            child: Text(
              'Viziunea asociației „Rădăuțiul Civic” este cea a unui Rădăuți dezvoltat, cu o societate civilă '
                  +
                  'puternică, cu cetățeni responsabili, educați informați și activi, care promovează binele comunității.',
              style: TextStyle(
                fontSize: 15,
              ),
            ),
          ),
          //3
          Container(
            padding: EdgeInsets.only(top: 10,),
            width: MediaQuery.of(context).size.width - 30,
            child: Text(
              'Misiunea asociației „Rădăuțiul Civic” este de a stimula cetățenia activă pentru dezvoltarea '
                  +
                  'comunității locale.',
              style: TextStyle(
                fontSize: 15,
              ),
            ),
          ),
          //4
          Container(
            padding: EdgeInsets.only(top: 10,),
            width: MediaQuery.of(context).size.width - 30,
            child: Text(
              'Printre valorile de bază ale grupului nostru civic se numără:'
                  +
                  '\n- integritatea și onestitatea membrilor și a comunității;'
                  +
                  '\n- profesionalismul - mizăm pe acțiuni de calitate, nu pentru imagine ci pentru un impact real în comunitate;'
                  +
                  '\n- responsabilitatea - suntem și ne asumăm responsabilitatea pentru acțiunile noastre. Numai prin asumare putem să producem o schimbare în bine în jurul nostru;'
                  +
                  '\n- transparența  și adevărul în acțiunile și obiectivele noastre;'
                  +
                  '\n- non partizanatul - ca orice inițiativă civică, acest grup nu este și nu va fi partizan politic;'
                  +
                  '\n- devotamentul și curajul se numără de asemenea printre valorile noastre.',
              style: TextStyle(
                fontSize: 15,
              ),
            ),
          ),
          //5
          Container(
            padding: EdgeInsets.only(top: 10,),
            width: MediaQuery.of(context).size.width - 30,
            child: Text(
              'Ne plac oamenii cu idei, oamenii activim oameni care FAC și nu doar spun. Ne plac oamenii care '
                  +
                  'oferă soluții, nu doar care critică și ne plac oamenii care cred că prin puterea exemplului pot pune '
                  +
                  'lucrurile în mișcare.',
              style: TextStyle(
                fontSize: 15,
              ),
            ),
          ),
          //6
          Container(
            padding: EdgeInsets.only(top: 10,),
            width: MediaQuery.of(context).size.width - 30,
            child: Text(
              'Suntem cetățeni în fiecare zi nu doar când mergem din 4 în 4 ani la vot sau când avem vreo '
                  +
                  'problemă. Dacă ne dorim un oraș care să înflorească și care să se dezvolte, acest lucru ține și de '
                  +
                  'noi și de ceea ce facem în fiecare zi pentru asta. O democrație funcțională nu poate exista prin '
                  +
                  'simpla participare la vot, ci prin asumarea statutului de cetățean în fiecare zi.',
              style: TextStyle(
                fontSize: 15,
              ),
            ),
          ),
          //7
          Container(
            padding: EdgeInsets.only(top: 10, bottom: 20,),
            width: MediaQuery.of(context).size.width - 30,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new InkWell(
                    child: new Text(
                      'www.radautiulcivic.ro',
                      style: TextStyle(decoration: TextDecoration.underline, color: Color(0xFF38A49C), fontSize: 15,),
                    ),
                    onTap: () => UrlLauncher.launch('https://www.radautiulcivic.ro/')
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}