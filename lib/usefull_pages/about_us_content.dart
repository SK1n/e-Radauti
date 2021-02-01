import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapperadauti/usefull_pages/usefull_pages_widget/widget_about_model.dart';

class AboutUsContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          WidgetAboutModel().widgetCover("assets/images/CoverAboutPage.png", context),
          WidgetAboutModel().widgetTitle("Rădăuțiul Civic", context),
          WidgetAboutModel().widgetParagraph(
              'Grupul de inițiativă Rădăuțiul civic a apărut în luna iunie 2017 în mod oficial, după o serie de acțiuni civice ' +
                  'implementate deja de unii membri, pe bază de voluntariat și din dorința de a da ceva înapoi orașului lor natal, ' +
                  'iar în septembrie 2018 acesta a devenit asociație neguvernamentală.',
              context
          ),
          WidgetAboutModel().widgetParagraph(
              'Viziunea asociației „Rădăuțiul Civic” este cea a unui Rădăuți dezvoltat, cu o societate civilă ' +
                  'puternică, cu cetățeni responsabili, educați, informați și activi, care promovează binele comunității.',
              context
          ),
          WidgetAboutModel().widgetParagraph(
              'Misiunea asociației „Rădăuțiul Civic” este de a stimula cetățenia activă pentru dezvoltarea ' +
                  'comunității locale.',
              context
          ),
          WidgetAboutModel().widgetParagraph(
              'Printre valorile de bază ale grupului nostru civic se numără:' +
                  '\n- integritatea și onestitatea membrilor și a comunității;' +
                  '\n- profesionalismul - mizăm pe acțiuni de calitate, nu pentru imagine ci pentru un impact real în comunitate;' +
                  '\n- responsabilitatea - suntem și ne asumăm responsabilitatea pentru acțiunile noastre. Numai prin asumare putem să producem o schimbare în bine în jurul nostru;' +
                  '\n- transparența  și adevărul în acțiunile și obiectivele noastre;' +
                  '\n- non partizanatul - ca orice inițiativă civică, acest grup nu este și nu va fi partizan politic;' +
                  '\n- devotamentul și curajul se numără de asemenea printre valorile noastre.',
              context
          ),
          WidgetAboutModel().widgetParagraph(
              'Ne plac oamenii cu idei, oamenii activi, oameni care FAC și nu doar spun. Ne plac oamenii care ' +
                  'oferă soluții, nu doar care critică și ne plac oamenii care cred că prin puterea exemplului pot pune ' +
                  'lucrurile în mișcare.',
              context
          ),
          WidgetAboutModel().widgetParagraph(
              'Suntem cetățeni în fiecare zi nu doar când mergem din 4 în 4 ani la vot sau când avem vreo ' +
                  'problemă. Dacă ne dorim un oraș care să înflorească și care să se dezvolte, acest lucru ține și de ' +
                  'noi și de ceea ce facem în fiecare zi pentru asta. O democrație funcțională nu poate exista prin ' +
                  'simpla participare la vot, ci prin asumarea statutului de cetățean în fiecare zi.',
              context
          ),
          WidgetAboutModel().widgetParagraphLink('www.radautiulcivic.ro', 'https://www.radautiulcivic.ro/', context),
        ],
      ),
    );
  }
}
