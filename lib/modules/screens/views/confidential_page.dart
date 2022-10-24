import 'package:flutter/material.dart';
import 'package:flutterapperadauti/modules/screens/views/confidential_item.dart';
import 'package:flutterapperadauti/utils/shared_widgets/app_bar_model.dart';
import 'package:flutterapperadauti/utils/shared_widgets/nav_drawer.dart';

class Confidential extends StatelessWidget {
  const Confidential({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const NavDrawer(),
      body: CustomScrollView(
        slivers: [
          const AppBarUi(
            content: 'Confidențialitate',
            leading: Icons.add_box_outlined,
          ),
          SliverPadding(
            padding: const EdgeInsets.all(8.0),
            sliver: SliverList(
                delegate: SliverChildListDelegate([
              ConfidentialItem()
                  .widgetTitleParagraph('Termeni de confidențialitate'),
              ConfidentialItem().widgetParagraph(
                  'Grupul independent „Rădăuțiul civic” a construit voluntar '
                  'aplicația „e-Rădăuți”. Aplicația este oferită gratuit și trebuie să fie folosită așa.',
                  context),
              ConfidentialItem().widgetRichText(
                'Aplicația este un instrument mobil de facilitare a comunicării dintre localnici, instituțiile locale și grupul „Rădăuțiul Civic”. Rolul comunicării este de implicare civică sau de raportare a diferitelor probleme întâlnite în societate. În funcție de opțiunea accesată, informațiile pe care utilizatorul le va introduce în diferitele formulare vor fi direcționate către adresa noastră de e-mail oferită de serviciul Google Mail: radautiulcivic@gmail.com sau către instituțiile locale precum Primăria Rădăuți, Servicii Comunale, ACET Rădăuți, Consiliul Județean Suceava, Garda de Mediu Suceava, Garda Forestieră Suceava etc. Când datele sunt trimise către „Rădăuțiul Civic”, ele vor fi stocate pe serverul adresei de e-mail, de aceea recomandăm vizitarea politicii de confidențialitate a Google Inc (',
                [
                  ConfidentialItem().widgetTextSpanLink(
                      'https://policies.google.com/privacy',
                      'https://policies.google.com/privacy'),
                  const TextSpan(
                      text: '). '
                          'Când sunt trimise către instituțiile publice, ele vor fi stocate pe serverele dedicate, fără a fi procesate '
                          'sau stocate de către „Rădăuțiul Civic”. Recomandăm contactarea agențiilor în legătură cu stocarea datelor.'),
                ],
                context,
              ),
              ConfidentialItem().widgetRichText(
                  'Dacă alegi să folosești aplicația noastră accepți faptul că vom colecta și folosi informații care au legătura cu acești termeni. Informațiile personale colectate vor fi folosite atunci când se transmit cereri sau plângeri către „Rădăuțiul Civic”.  Opțiuni precum Sesizează o problemă trimit datele personale (numele și prenumele, adresa de e-mail, numărul de telefon și locația) către adresa de e-mail radautiulcivic@gmail.com (când este trimisă către „Rădăuțiul Civic”) la care au acces membrii grupului „Rădăuțiul Civic” sau către ',
                  [
                    ConfidentialItem().widgetTextSpanLink(
                        'relatiipublice@primariaradauti.ro',
                        'mailto:relatiipublice@primariaradauti.ro'),
                    const TextSpan(text: ', '),
                    ConfidentialItem().widgetTextSpanLink(
                        'office@serviciicomunale.ro',
                        'mailto:office@serviciicomunale.ro'),
                    const TextSpan(text: ', '),
                    ConfidentialItem().widgetTextSpanLink(
                        'agentia.radauti@acetsv.ro',
                        'mailto:agentia.radauti@acetsv.ro'),
                    const TextSpan(text: ', '),
                    ConfidentialItem().widgetTextSpanLink(
                        'contact@cjsuceava.ro', 'mailto:contact@cjsuceava.ro'),
                    const TextSpan(text: ', '),
                    ConfidentialItem().widgetTextSpanLink(
                        'cjsuceava@gnm.ro', 'mailto:cjsuceava@gnm.ro'),
                    const TextSpan(text: ', '),
                    ConfidentialItem().widgetTextSpanLink(
                        'gardaforestiera.suceava@gmail.com',
                        'mailto:gardaforestiera.suceava@gmail.com'),
                    const TextSpan(
                        text:
                            ' pentru agențiile publice la care vor avea acces diferite persoane publice angajate la agențiile respective.\nOpțiunea de contactare a persoanelor de la conducere (Primar, Viceprimar, Secretar sau Consilieri) se va realiza folosind adresa de e-mail a persoanei selectate, folosind numărul de telefon sau adresa de Facebook. Datele trimise către fiecare persoană din conducere vor fi stocate și procesate de către aceștia, ceea ce înseamnă că „Rădăuțiul Civic” nu are niciun control asupra felului în care sunt folosite. Pentru a afla cum sunt procesate, vă recomandăm să îi contactați în privat pe fiecare.'),
                  ],
                  context),
              ConfidentialItem().widgetParagraph(
                  'Rădăuțiul Civic se angajează să protejeze datele cu caracter personal furnizate de persoanele sau companiile cu care colaborează. Pentru a ne asigura că datele dvs. personale sunt în siguranță, comunicăm în mod regulat politica de protecție a datelor cu caracter personal precum și instrucțiunile de lucru referitoare la acest aspect, tuturor utilizatorilor aplicației și urmărim aplicarea cu strictețe a măsurilor de protecție a vieții private în cadrul organizației.',
                  context),
              ConfidentialItem().widgetParagraph(
                  'Această politică de protecție a datelor cu caracter personal descrie practicile noastre privind '
                  'colectarea, utilizarea și transferul datelor comunicate direct sau indirect organizației noastre, '
                  'precum și modul de utilizare a datelor cu caracter personal în scopul furnizării serviciilor.',
                  context),
              ConfidentialItem().widgetParagraph(
                  'Dacă, din orice motiv, termenii stabiliți în cadrul acestor condiții de utilizare a datelor cu '
                  'caracter personal, nu sunt acceptabili pentru dvs., aveți posibilitatea de a ne comunica acest '
                  'lucru și eventual puteți solicita detalii sau explicit, ștergerea datelor dvs., prin trimiterea '
                  'mesajului la adresa menționată în preambul (radautiulcivic@gmail.com).',
                  context),
              ConfidentialItem().widgetParagraph(
                  'Informațiile nu vor fi distribuite public și nu vor fi publicate '
                  'decât în condițiile specifice în „termenii de confidențialitate”.',
                  context),
              //2
              ConfidentialItem().widgetTitleParagraph(
                  'Colectarea și folosirea informațiilor'),
              ConfidentialItem().widgetParagraph(
                  'Atunci când folosești aplicația noastră, va trebui să ne dați permisiunea de a folosi, pe lângă altele, anumite '
                  'informații legate de identitatea personală precum camera telefonului sau a tabletei, dar și a poziției pe GPS.'
                  '\nAplicația folosește servicii terțe care ar putea colecta informații folosite pentru a te identifica. '
                  '\nLegături către termeni de confidențialitate folosiți de aplicație:',
                  context),
              //3
              ConfidentialItem().widgetTitleParagraph('Servicii Google Play'),
              ConfidentialItem()
                  .widgetSubtitleParagraph('Logarea datelor', context),
              ConfidentialItem().widgetParagraph(
                  'Îți aducem la cunoștință că de fiecare dată când folosești aplicația, informații și date din telefon sunt colectate prin produsele terțe și transmise în caz de erori în date logare. Datele de logare pot conține informații precum adresa protocolului de internet („IP”), numele dispozitivului, versiunea sistemului de operare, configurația aplicației atunci când folosești instrumentele noastre, data și ora folosirii aplicației dar și alte date statistice.',
                  context),
              ConfidentialItem().widgetSubtitleParagraph('Cookies', context),
              ConfidentialItem().widgetParagraph(
                  'Cookie-urile sunt fișiere ce conțin cantități mici de date ce sunt folosite drept identificator anonim unic. Acestea sunt trimise către browser de la website-ul pe care îl vizitezi și sunt stocate în memoria internă a dispozitivului. Acest serviciu nu folosește cookie-uri explicit. Cu toate acestea, aplicația poate folosi cod terț și librării care folosesc cookie-uri ca să colecteze informații și să își îmbunătățească serviciile. Ai opțiunea atât să accepți cât și să refuzi aceste cookie-uri și mai mult, să știi când pe dispozitivul tău sunt trimise cookie-urile. Dacă refuzi să le folosești, nu vei putea folosi decât anumite părți ale serviciilor.',
                  context),
              //4
              ConfidentialItem().widgetTitleParagraph('Provideri de serviciu'),
              ConfidentialItem().widgetParagraph(
                  'Putem angaja companii terțiare și persoane fizice din următoarele motive:\n- facilităm serviciul proprii\n- să furnizăm utilizatorilor servicii terțiare (ex. reciclare)\n- să furnizăm serviciul în numele nostru\n- să efectuăm servicii legate de serviciul nostru\n- să fim asistați pentru a analiza cum e folosit serviciul nostru',
                  context),
              //5
              ConfidentialItem().widgetTitleParagraph('Servicii terțe'),
              ConfidentialItem().widgetParagraph(
                  'De cele mai multe ori, datele care sunt destinate serviciilor terțe nu vor fi procesate de către „Rădăuțiul Civic” ci vor fi redirecționate către providerii de servicii. \nVrem să informăm utilizatorii aplicației că aceste servicii terțe au acces la informațiile personale. Motivul pentru care am putea face asta este ca să efectueze anumite sarcini în numele nostru. Cu toate acestea, sunt obligate să nu dezvăluie sau să folosească informația în alte scopuri.',
                  context),
              //6
              ConfidentialItem().widgetTitleParagraph('Securitate'),
              ConfidentialItem().widgetParagraph(
                  'Apreciem încrederea ta atunci când ne oferi informații personale. De aceea încercăm să folosim mijloace '
                  'acceptabile din punct de vedere comercial ca să o protejăm. Cu toate acestea, trebuie să ții cont că '
                  'nicio metodă de transmisie prin internet sau de stocare electronică nu este 100% sigură, și nu putem '
                  'garanta securitatea ei absolută.',
                  context),
              //7
              ConfidentialItem().widgetTitleParagraph(
                  'Link-uri către alte site-uri sau către alți provideri de serviciu'),
              ConfidentialItem().widgetParagraph(
                  'Această aplicație conține link-uri și formulare de contact către alte site-uri sau provideri de servicii. Dacă dai click pe un link terțiar, vei fi redirecționat către acel site. Formularele de contact care sunt completate de utilizator pentru un serviciu terțiar vor fi trimise direct către providerul terț de servicii. Reamintim că noi nu acționăm cu aceste site-uri externe. Prin urmare îți recomandăm să citești politica de confidențialitate a acestor site-uri. Nu avem niciun control și nu ne asumăm nicio responsabiltate asupra conținutului, termenelor de confidențialiate sau practicile oricărui site terțiar sau serviciu.',
                  context),
              //8
              ConfidentialItem()
                  .widgetTitleParagraph('Confidențialitatea copiilor'),
              ConfidentialItem().widgetParagraph(
                  'Aceste servicii nu se adresează persoanelor sub 13 ani. Nu colectăm voit informații care identifică personal copii sub 13 ani. În cazul în care descoperim că un copil sub 13 ani ne-a oferit informații personale, o vom șterge imediat de pe serverele noastre. Dacă ești părinte sau gardian sau dacă ești conștient că ne-au fost oferite informații personale de la copilul tău, te rugăm să ne contactezi cât mai rapid ca să luăm măsurile necesare.',
                  context),
              //9
              ConfidentialItem().widgetTitleParagraph(
                  'Schimbări în politica de confidentialitate'),
              ConfidentialItem().widgetParagraph(
                  'Ori de câte ori va fi necesar, vom putea actualiza politica noastră de confidențialitate. În consecință te '
                  'sfătuim să revii pe această pagină periodic în caz că apar unele schimbări. Vei primi notificări când vor '
                  'apărea modificări în politica noastră de confidențialitate. Aceste schimbări intră în vigoare imediat ce '
                  'sunt postate pe această pagină.',
                  context),
              //10
              ConfidentialItem().widgetTitleParagraph('Contactează-ne'),
              ConfidentialItem().widgetParagraph(
                  'Dacă ai întrebări sau sugestii referitoare la termenii noștri de '
                  'confidențialitate, nu ezita să ne contactezi la adresa radautiulcivic@gmail.com.'
                  'Tot pe această adresă de e-mail ne puteți solicita '
                  'ștergerea datelor personale din baza noastră de date. ',
                  context),
            ])),
          ),
          //1
        ],
      ),
    );
  }
}
