import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapperadauti/modules/screens/views/about_item.dart';

class AboutUsApp extends StatelessWidget {
  const AboutUsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.all(8.0),
          sliver: SliverList(
            delegate: SliverChildListDelegate(
              [
                AboutModel().widgetCover(
                    "assets/images/coperta_hai_sa_digitalizam.png", context),
                AboutModel().widgetTitle("Aplicația e-Rădăuți", context),
                AboutModel().widgetParagraph(
                    'Aplicația „e-Rădăuți” este un proiect voluntar născut în 2017 din dorința de a duce orașul '
                    'mai aproape de era digitală, de a facilita implicare localnicilor în acțiunile locale.',
                    context),
                AboutModel().widgetParagraph(
                    'Aplicația s-a născut în urma unui concurs în premieră în '
                    'oraș intitulat „Hai să digitalizăm orașul” la care au participat optsprezece '
                    'elevi din două licee din Rădăuți.',
                    context),
                AboutModel().widgetParagraph(
                    'Aplicațiile dezvoltate în timpul concursului au fost evaluate de un juriu internațional '
                    'de profesioniști în domeniul IT și Design iar resursele financiare pentru premii '
                    'au venit din donații ale membrilor „Rădăuțiul Civic”, ale juriului și ale '
                    'firmei locale „Hard Power Services”.',
                    context),
                AboutModel().widgetParagraph(
                    'Noua versiune a aplicației e-Rădăuți este implementată în anul 2020 cu ajutorul fondurilor obținute '
                    'de la asociația Geeks for Democracy, prin Fondul pentru Democrație și este dedicată doar '
                    'localnicilor, renunțând temporar la partea dedicată turiștilor.',
                    context),
                AboutModel().widgetParagraph(
                    'De asemenea această versiune a fost actualizată cu sprijinul oferit de Code4Romania, în cadrul '
                    'ședințelor tehnice Civic Tech 911',
                    context),
                AboutModel().widgetParagraph(
                    'Acest upgrade a venit cu noi funcționalități dar și cu îmbunătățiri ale funcționalităților deja '
                    'existente, aplicația fiind disponibilă în premieră și pe iOS, nu doar pe Android.',
                    context),
                AboutModel().widgetParagraph(
                    'Aplicația este rezultatul muncii unei echipe formate din Ciprian Dicu, Luis Scripcaru, '
                    'Paul Coman - pe partea de dezvoltare, cod și algoritmi, Viviana Huțuleac și '
                    'Daniela Tiron pe partea de comunicare și grafică și Luca Ciubotaru pe partea de management de '
                    'proiect.',
                    context),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
