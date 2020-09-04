import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutterapperadauti/TownHall/leaders.dart';
import 'package:flutterapperadauti/TownHall/local_council.dart';
import 'package:flutterapperadauti/menu_page.dart';

class Confidential extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        automaticallyImplyLeading: false,
        leading: Container(
          padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
          margin: const EdgeInsets.fromLTRB(15.0, 5.0, 0.0, 5.0),
          child: Image.asset("assets/logo_images/app_logo.png"),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 20, bottom: 20,),
              child: Row(
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      icon: Icon(Icons.keyboard_arrow_left, color: Color(0xFF979797),), //_left Icons.arrow_back
                      onPressed: (){
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width - 80,
                    child: new Stack(
                      alignment: AlignmentDirectional.center,
                      children: <Widget>[
                        Stack(
                          children: <Widget>[
                            //Icon(Icons.location_city, color: Color(0x55FB6340), size: 30,),
                            Container(
                              child: Text(
                                'Confidențialitate',
                                style: TextStyle(
                                  color: Color(0xFF000000), //Color(0xFFFFFFFF),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 19,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            //1
            Container(
              width: MediaQuery.of(context).size.width - 30,
              child: Text(
                'Termeni de confidențialitate',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            //1.1
            Container(
              padding: EdgeInsets.only(top: 10,),
              width: MediaQuery.of(context).size.width - 30,
              child: Text(
                'Grupul independent „Rădăuțiul civic” a construit gratuit și voluntar '
                +
                'aplicația „e-Rădăuți”. Aplicația este oferită gratuit și trebuie să fie folosită așa.',
                overflow: TextOverflow.ellipsis,
                maxLines: 5,
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
            //1.2
            Container(
              padding: EdgeInsets.only(top: 10,),
              width: MediaQuery.of(context).size.width - 30,
              child: Text(
                'Aplicația este un instrument mobil de facilitare a comunicării dintre localnici și grupul „Rădăuțiul civic”. '
                +
                'Rolul comunicării este de implicare civică, de raportare sau pentru simplu contact. În cele mai multe cazuri '
                +
                'informațiile vor fi direcționate către adresa noastră de email radautiulcivic@gmail.com. Pe lângă aceasta '
                +
                'aplicația conține instrumente care pot fi folosite pentru a-i ajuta pe potențialii turiști să cunoască '
                +
                'obiectivele turistice ale orașului.',
                overflow: TextOverflow.ellipsis,
                maxLines: 9,
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
            //1.3
            Container(
              padding: EdgeInsets.only(top: 10,),
              width: MediaQuery.of(context).size.width - 30,
              child: Text(
                'Dacă alegi să folosești aplicația noastră accepți faptul '
                +
                'că vom colecta și folosi informații care au legătura cu acești termeni. Informațiile personale colectate '
                +
                'vor fi folosite atunci când se transmit cereri sau plângeri către autoritățile locale și/sau către '
                +
                'entitățile afișate în aplicație. Instrumentele de comunicare deschisă (ex. Discuții cu localnici) între '
                +
                'utilizatorii aplicației afișează public, pe lângă altele, adresa de e-mail sau numele complet.',
                overflow: TextOverflow.ellipsis,
                maxLines: 9,
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
            //1.4
            Container(
              padding: EdgeInsets.only(top: 10,),
              width: MediaQuery.of(context).size.width - 30,
              child: Text(
                'Informațiile nu vor fi distribuite public și nu vor publicate '
                +
                'decât în condițiile specifice în „termenii de confidențialitate” . '
                +
                '„Termnii de confidențialitate” sunt complementari documentului cu '
                +
                '„Termeni și condiții”, care poate fi accesat în interiorul aplicației.',
                overflow: TextOverflow.ellipsis,
                maxLines: 5,
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
                'Colectarea și folosirea informațiilor',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            Container(
              //padding: EdgeInsets.only(top: 10,),
              width: MediaQuery.of(context).size.width - 30,
              child: Text(
                'Atunci când folosești aplicația noastră va trebui să ne dați permisiunea de a folosi, pe lângă altele, anumite '
                +
                'informații legate de identitatea personală precum camera telefonului sau a tabletei, dar și a poziției pe GPS.'
                +
                '\nAplicația folosește servicii terțe care ar putea colecta informații folosite pentru a te identifica. '
                +
                'Legături către termeni de confidențialitate folosite de aplicație.',
                overflow: TextOverflow.ellipsis,
                maxLines: 8,
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
                'Servicii Google Play',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            //3.1
            Container(
              //padding: EdgeInsets.only(top: 10,),
              width: MediaQuery.of(context).size.width - 30,
              child: Text(
                'Logarea datelor',
                overflow: TextOverflow.ellipsis,
                maxLines: 5,
                style: TextStyle(
                  fontSize: 15,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
            Container(
              //padding: EdgeInsets.only(top: 10,),
              width: MediaQuery.of(context).size.width - 30,
              child: Text(
                'Îți aducem la cunoștință că de fiecare dată când folosești aplicația, informații și date din telefon sunt '
                +
                'colectate prin produsele terțe și transmise în caz de erori în date logate. Datele de logare pot conține '
                +
                'informații precum adresa protocolului de internet („IP”), numele dispozitivului, sistemul de operare, '
                +
                'configurația aplicației atunci când folosești instrumentele noastre, data și ora folosirii aplicației '
                +
                'dar și alte date statistice.',
                overflow: TextOverflow.ellipsis,
                maxLines: 9,
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
            //3.2
            Container(
              padding: EdgeInsets.only(top: 10,),
              width: MediaQuery.of(context).size.width - 30,
              child: Text(
                'Cookies',
                overflow: TextOverflow.ellipsis,
                maxLines: 5,
                style: TextStyle(
                  fontSize: 15,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
            Container(
              //padding: EdgeInsets.only(top: 10,),
              width: MediaQuery.of(context).size.width - 30,
              child: Text(
                'Cookie-urile sunt fișiere ce conțin cantități mici de date ce sunt '
                +
                'folosite drept identificator anonim unic. Acestea sunt trimise către browser de la website-ul pe '
                +
                'care îl vizitezi și sunt stocate în memoria internă a dispozitivului. Acest serviciu folosește cookie-uri '
                +
                'explicit. Cu toate acestea, aplicația poate folosi cod third-party și librării care folosesc cookie-uri ca '
                +
                'să colecteze informații și să își îmbunătățească serviciile. Ai opțiunea atât să accepți cât și să refuzi '
                +
                'aceste cookie-uri și mai mult, să știi când pe dispozitivul tău sunt trimise cookie-urile. Dacă refuzi să '
                +
                'le folosești nu vei putea folosi decât anumite părți ale serviciilor.',
                overflow: TextOverflow.ellipsis,
                maxLines: 15,
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
            //3.3
            Container(
              padding: EdgeInsets.only(top: 10,),
              width: MediaQuery.of(context).size.width - 30,
              child: Text(
                'Provideri de serviciu',
                overflow: TextOverflow.ellipsis,
                maxLines: 5,
                style: TextStyle(
                  fontSize: 15,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
            Container(
              //padding: EdgeInsets.only(top: 10,),
              width: MediaQuery.of(context).size.width - 30,
              child: Text(
                'Putem angaja companii terțiare și persoane fizice din următoarele motive:'
                +
                '\n- facilităm serviciul proprii'
                +
                '\n- să furnizăm utilizatorilor servicii terțiare (ex. Reciclare)'
                +
                '\n- să furnizăm serviciul în numele nostru'
                +
                '\n- să efectuăm servicii legate de serviciul nostru'
                +
                '\n- să fim asistați pentru a analiza cum e folosit serviciul nostru',
                overflow: TextOverflow.ellipsis,
                maxLines: 9,
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
            //3.4
            Container(
              padding: EdgeInsets.only(top: 10,),
              width: MediaQuery.of(context).size.width - 30,
              child: Text(
                'Vrem să informăm utilizatorii aplicației că aceste third-party-uri au acces la informațiile personale. '
                +
                'Motivul pentru care am putea face asta este ca sa efectueze anumite servicii în numele nostru. Cu '
                +
                'toate acestea, sunt obligate sa nu dezvăluie sau să folosească informația în alte scopuri.',
                overflow: TextOverflow.ellipsis,
                maxLines: 6,
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
                'Securitate',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            Container(
              //padding: EdgeInsets.only(top: 10,),
              width: MediaQuery.of(context).size.width - 30,
              child: Text(
                'Apreciem încrederea ta atunci când ne oferi informații personale. De aceea încercăm să folosim mijloace '
                +
                'acceptabile din vedere comercial ca să o protejăm. Cu toate acestea, trebuie să ții cont că nicio metodă '
                +
                'de transmisie prin internet sau de stocare electronică nu este 100% sigură și nu putem garanta securitatea '
                +
                'ei absolută.',
                overflow: TextOverflow.ellipsis,
                maxLines: 7,
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
                'Linkuri către alte siteuri sau către alți provideri de serviciu.',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            Container(
              //padding: EdgeInsets.only(top: 10,),
              width: MediaQuery.of(context).size.width - 30,
              child: Text(
                'Această aplicație conține linkuri și formulare de contact către alte siteuri sau provideri de servicii. '
                +
                'Dacă dai click pe un link terțiar, vei fi redirecționat către acel site. Formularele de contact care sunt '
                +
                'completate de utilizator pentru un serviciu terțiar vor fi trimise direct către providerul de servicii '
                +
                'third-party. Reamintim că noi acționăm cu aceste site-uri externe. Prin urmare îți recomandăm citești '
                +
                'politica de confidențialitate a acestor siteuri. Nu avem niciun control și nu ne asumăm nicio '
                +
                'responsabiltate asupra conținutului, termenelor de confidențialiate sau practicile oricărui site terțiar '
                +
                'sau serviciu.',
                overflow: TextOverflow.ellipsis,
                maxLines: 12,
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
                'Confidențialitatea copiilor',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            Container(
              //padding: EdgeInsets.only(top: 10,),
              width: MediaQuery.of(context).size.width - 30,
              child: Text(
                'Aceste servicii nu se adresează persoanelor sub 13 ani. Nu colectăm voit informații care identifică '
                +
                'personal copii sub 13 ani. În cazul în care descoperim că un copil sub 13 ani ne-a oferit informații '
                +
                'personale, o vom șterge imediat de pe serverele noastre. Dacă ești părinte sau gardian sau dacă ești '
                +
                'conștient că ne-au fost oferite informații personale de la copilul tău, te rugăm să ne contactezi cât '
                +
                'mai rapid ca să luăm măsurile necesare.',
                overflow: TextOverflow.ellipsis,
                maxLines: 9,
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
            //7
            Container(
              padding: EdgeInsets.only(top: 10,),
              width: MediaQuery.of(context).size.width - 30,
              child: Text(
                'Schimbări în politica de confidentialitate',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            Container(
              //padding: EdgeInsets.only(top: 10,),
              width: MediaQuery.of(context).size.width - 30,
              child: Text(
                'Ori de câte ori va fi necesar, vom putea actualiza politica noastră de confidențialitate. În consecință te '
                +
                'sfătuim să revii pe această pagină periodic în caz că apar unele schimbări. Vei primi notificări când vor '
                +
                'apărea modificări în politica noastră de confidențialitate. Aceste schimbări intră în vigoare imediat ce '
                +
                'sunt postate pe această pagină.',
                overflow: TextOverflow.ellipsis,
                maxLines: 7,
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
            //8
            Container(
              padding: EdgeInsets.only(top: 10,),
              width: MediaQuery.of(context).size.width - 30,
              child: Text(
                'Contactează-ne',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 0, bottom: 20,),
              width: MediaQuery.of(context).size.width - 30,
              child: Text(
                'Dacă ai întrebări sau sugestii referitoare la termenii noștri de '
                +
                'confidențialitate, nu ezita să ne contactezi la adresa radautiulcivic@gmail.com.',
                overflow: TextOverflow.ellipsis,
                maxLines: 5,
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}