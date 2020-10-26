import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;
import 'package:flutter/gestures.dart';

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

            //
            Container(
              padding: EdgeInsets.only(top: 10,),
              width: MediaQuery.of(context).size.width - 30,
              child: RichText(
                text: TextSpan(
                  text: 'Aplicația este un instrument mobil de facilitare a comunicării dintre localnici, instituțiile locale și '
                      +
                      'grupul „Rădăuțiul Civic”. Rolul comunicării este de implicare civică sau de raportare a diferitelor probleme '
                      +
                      'întâlnite în societate. În funcție de opțiunea accesată, informațiile pe care utilizatorul la va introduce în '
                      +
                      'diferitele formulare vor fi direcționate către adresa noastră de e-mail oferită de serviciul Google Mail: '
                      +
                      'radautiulcivic@gmail.com sau către instituțiile locale precum Primăria Rădăuți, Servicii Comunale, ACET '
                      +
                      'Rădăuți, Consiliul Județean Suceava, Garda de Mediu Suceava, Garda Forestieră Suceava etc. Când datele '
                      +
                      'sunt trimise către „Rădăuțiul Civic”, ele vor fi stocate pe serverul adresei de e-mail, de aceea recomandăm '
                      +
                      'vizitarea politicii de confidențialitate a Google Inc (',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'https://policies.google.com/privacy',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Color(0xFF38A49C),
                        fontSize: 15,
                      ),
                      recognizer: new TapGestureRecognizer()
                        ..onTap = () => UrlLauncher.launch('https://policies.google.com/privacy'),
                    ),
                    TextSpan(
                        text: '). '
                            +
                            'Când sunt trimise către instituțiile publice, ele vor fi stocate pe serverele dedicate, fără a fi procesate '
                            +
                            'sau stocate de către „Rădăuțiul Civic”. Recomandăm contactarea agențiilor în legătură cu stocarea datelor.'
                    ),
                  ],
                ),
              ),
            ),

            //1.2
            Container(
              padding: EdgeInsets.only(top: 10,),
              width: MediaQuery.of(context).size.width - 30,
              child: Text(
                'Aplicația este un instrument mobil de facilitare a comunicării dintre localnici, instituțiile locale și '
                +
                'grupul „Rădăuțiul Civic”. Rolul comunicării este de implicare civică sau de raportare a diferitelor probleme '
                +
                'întâlnite în societate. În funcție de opțiunea accesată, informațiile pe care utilizatorul la va introduce în '
                +
                'diferitele formulare vor fi direcționate către adresa noastră de e-mail oferită de serviciul Google Mail: '
                +
                'radautiulcivic@gmail.com sau către instituțiile locale precum Primăria Rădăuți, Servicii Comunale, ACET '
                +
                'Rădăuți, Consiliul Județean Suceava, Garda de Mediu Suceava, Garda Forestieră Suceava etc. Când datele '
                +
                'sunt trimise către „Rădăuțiul Civic”, ele vor fi stocate pe serverul adresei de e-mail, de aceea recomandăm '
                +
                'vizitarea politicii de confidențialitate a Google Inc (https://policies.google.com/privacy). '
                +
                'Când sunt trimise către instituțiile publice, ele vor fi stocate pe serverele dedicate, fără a fi procesate '
                +
                'sau stocate de către „Rădăuțiul Civic”. Recomandăm contactarea agențiilor în legătură cu stocarea datelor.',
                //overflow: TextOverflow.ellipsis,
                //maxLines: 9,
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ),

            //
            Container(
              padding: EdgeInsets.only(top: 10,),
              width: MediaQuery.of(context).size.width - 30,
              child: RichText(
                text: TextSpan(
                  text: 'Dacă alegi să folosești aplicația noastră accepți faptul '
                      +
                      'că vom colecta și folosi informații care au legătura cu acești termeni. Informațiile personale colectate '
                      +
                      'vor fi folosite atunci când se transmit cereri sau plângeri către „Rădăuțiul Civic”.  Opțiuni precum '
                      +
                      'Sesizează o problemă trimit datele personale (numele și prenumele, adresa de e-mail, numărul de '
                      +
                      'telefon și locația) către adresa de e-mail radautiulcivic@gmail.com (când este trimisă către „Rădăuțiul '
                      +
                      'Civic”) la care au acces membrii grupului „Rădăuțiul Civic” sau către ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                  children: <InlineSpan>[
                    //1
                    TextSpan(
                      text: 'relatiipublice@primariaradauti.ro',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Color(0xFF38A49C),
                        fontSize: 15,
                      ),
                      recognizer: new TapGestureRecognizer()
                        ..onTap = () => UrlLauncher.launch('mailto:relatiipublice@primariaradauti.ro'),
                    ),
                    TextSpan(
                        text: ', '
                    ),
                    //2
                    TextSpan(
                      text: 'office@serviciicomunale.ro',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Color(0xFF38A49C),
                        fontSize: 15,
                      ),
                      recognizer: new TapGestureRecognizer()
                        ..onTap = () => UrlLauncher.launch('mailto:office@serviciicomunale.ro'),
                    ),
                    TextSpan(
                        text: ', '
                    ),
                    //3
                    TextSpan(
                      text: 'agentia.radauti@acetsv.ro',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Color(0xFF38A49C),
                        fontSize: 15,
                      ),
                      recognizer: new TapGestureRecognizer()
                        ..onTap = () => UrlLauncher.launch('mailto:agentia.radauti@acetsv.ro'),
                    ),
                    TextSpan(
                        text: ', '
                    ),
                    //4
                    TextSpan(
                      text: 'contact@cjsuceava.ro',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Color(0xFF38A49C),
                        fontSize: 15,
                      ),
                      recognizer: new TapGestureRecognizer()
                        ..onTap = () => UrlLauncher.launch('mailto:contact@cjsuceava.ro'),
                    ),
                    TextSpan(
                        text: ', '
                    ),
                    //5
                    TextSpan(
                      text: 'cjsuceava@gnm.ro',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Color(0xFF38A49C),
                        fontSize: 15,
                      ),
                      recognizer: new TapGestureRecognizer()
                        ..onTap = () => UrlLauncher.launch('mailto:cjsuceava@gnm.ro'),
                    ),
                    TextSpan(
                        text: ', '
                    ),
                    //6
                    TextSpan(
                      text: 'gardaforestiera.suceava@gmail.com',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Color(0xFF38A49C),
                        fontSize: 15,
                      ),
                      recognizer: new TapGestureRecognizer()
                        ..onTap = () => UrlLauncher.launch('mailto:gardaforestiera.suceava@gmail.com'),
                    ),
                    //*
                    TextSpan(
                        text: ' pentru agențiile publice la care vor avea acces diferite persoane '
                            +
                            'publice angajate la agențiile respective.\nOpțiunea de contactare a persoanelor de la conducere (Primar, '
                            +
                            'Viceprimar, Secretar sau Consilieri) se va realiza folosind adresa de e-mail a persoanei selectate, folosind '
                            +
                            'numărul de telefon sau adresa de Facebook. Datele trimise către fiecare persoană din conducere vor fi stocate '
                            +
                            'și procesate de către aceștia, ceea ce înseamnă că „Rădăuțiul Civic” nu are niciun control asupra felului '
                            +
                            'în care sunt folosite. Pentru a afla cum sunt procesate, vă recomandăm să îi contactați în privat pe fiecare.'
                    ),
                  ],
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
                'vor fi folosite atunci când se transmit cereri sau plângeri către „Rădăuțiul Civic”.  Opțiuni precum '
                +
                'Sesizează o problemă trimit datele personale (numele și prenumele, adresa de e-mail, numărul de '
                +
                'telefon și locația) către adresa de e-mail radautiulcivic@gmail.com (când este trimisă către „Rădăuțiul '
                +
                'Civic”) la care au acces membrii grupului „Rădăuțiul Civic” sau către relatiipublice@primariaradauti.ro, '
                +
                'office@serviciicomunale.ro, agentia.radauti@acetsv.ro, contact@cjsuceava.ro, cjsuceava@gnm.ro, '
                +
                'gardaforestiera.suceava@gmail.com pentru agențiile publice la care vor avea acces diferite persoane '
                +
                'publice angajate la agențiile respective.\nOpțiunea de contactare a persoanelor de la conducere (Primar, '
                +
                'Viceprimar, Secretar sau Consilieri) se va realiza folosind adresa de e-mail a persoanei selectate, folosind '
                +
                'numărul de telefon sau adresa de Facebook. Datele trimise către fiecare persoană din conducere vor fi stocate '
                +
                'și procesate de către aceștia, ceea ce înseamnă că „Rădăuțiul Civic” nu are niciun control asupra felului '
                +
                'în care sunt folosite. Pentru a afla cum sunt procesate, vă recomandăm să îi contactați în privat pe fiecare.',
                //overflow: TextOverflow.ellipsis,
                //maxLines: 9,
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
                'Rădăuțiul Civic se angajează să protejeze datele cu caracter personal furnizate de persoanele '
                +
                'sau companiile cu care colaborează. Pentru a ne asigura că datele dvs. personale sunt în '
                +
                'siguranță, comunicăm în mod regulat politica de protecție a datelor cu caracter personal '
                +
                'precum și instrucțiunile de lucru referitoare la acest aspect, tuturor utilizatorilor aplicației și '
                +
                'urmărim aplicarea cu strictețe a măsurilor de protecție a vieții private în cadrul organizației.',
                //overflow: TextOverflow.ellipsis,
                //maxLines: 9,
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
            //1.5
            Container(
              padding: EdgeInsets.only(top: 10,),
              width: MediaQuery.of(context).size.width - 30,
              child: Text(
                'Această politică de protecție a datelor cu caracter personal descrie practicile noastre privind '
                +
                'colectarea, utilizarea și transferul datelor comunicate direct sau indirect organizației noastre, '
                +
                'precum și modul de utilizare a datelor cu caracter personal în scopul furnizării serviciilor.',
                //overflow: TextOverflow.ellipsis,
                //maxLines: 9,
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
            //1.6
            Container(
              padding: EdgeInsets.only(top: 10,),
              width: MediaQuery.of(context).size.width - 30,
              child: Text(
                'Dacă, din orice motiv, termenii stabiliți în cadrul acestor condiții de utilizare a datelor cu '
                +
                'caracter personal, nu sunt acceptabili pentru dvs., aveți posibilitatea de a ne comunica acest '
                +
                'lucru și eventual puteți solicita detalii sau explicit, ștergerea datelor dvs., prin trimiterea '
                +
                'mesajului la adresa menționată în preambul (radautiulcivic@gmail.com).',
                //overflow: TextOverflow.ellipsis,
                //maxLines: 9,
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
            //1.7
            Container(
              padding: EdgeInsets.only(top: 10,),
              width: MediaQuery.of(context).size.width - 30,
              child: Text(
                'Informațiile nu vor fi distribuite public și nu vor fi publicate '
                +
                'decât în condițiile specifice în „termenii de confidențialitate”.',
                //overflow: TextOverflow.ellipsis,
                //maxLines: 5,
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
                'Atunci când folosești aplicația noastră, va trebui să ne dați permisiunea de a folosi, pe lângă altele, anumite '
                +
                'informații legate de identitatea personală precum camera telefonului sau a tabletei, dar și a poziției pe GPS.'
                +
                '\nAplicația folosește servicii terțe care ar putea colecta informații folosite pentru a te identifica. '
                +
                '\nLegături către termeni de confidențialitate folosiți de aplicație:',
                //overflow: TextOverflow.ellipsis,
                //maxLines: 8,
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
                'colectate prin produsele terțe și transmise în caz de erori în date logare. Datele de logare pot conține '
                +
                'informații precum adresa protocolului de internet („IP”), numele dispozitivului, versiunea sistemului de '
                +
                'operare, configurația aplicației atunci când folosești instrumentele noastre, data și ora folosirii '
                +
                'aplicației dar și alte date statistice.',
                //overflow: TextOverflow.ellipsis,
                //maxLines: 9,
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
                'care îl vizitezi și sunt stocate în memoria internă a dispozitivului. Acest serviciu nu folosește cookie-uri '
                +
                'explicit. Cu toate acestea, aplicația poate folosi cod terț și librării care folosesc cookie-uri ca '
                +
                'să colecteze informații și să își îmbunătățească serviciile. Ai opțiunea atât să accepți cât și să refuzi '
                +
                'aceste cookie-uri și mai mult, să știi când pe dispozitivul tău sunt trimise cookie-urile. Dacă refuzi să '
                +
                'le folosești, nu vei putea folosi decât anumite părți ale serviciilor.',
                //overflow: TextOverflow.ellipsis,
                //maxLines: 15,
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
                'Provideri de serviciu',
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
                'Putem angaja companii terțiare și persoane fizice din următoarele motive:'
                +
                '\n- facilităm serviciul proprii'
                +
                '\n- să furnizăm utilizatorilor servicii terțiare (ex. reciclare)'
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
            //5
            Container(
              padding: EdgeInsets.only(top: 10,),
              width: MediaQuery.of(context).size.width - 30,
              child: Text(
                'Servicii terțe',
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
                'De cele mai multe ori, datele care sunt destinate serviciilor terțe nu vor fi procesate de către '
                +
                '„Rădăuțiul Civic” ci vor fi redirecționate către providerii de servicii. \n'
                +
                'Vrem să informăm utilizatorii aplicației că aceste servicii terțe au acces la informațiile personale. '
                +
                'Motivul pentru care am putea face asta este ca să efectueze anumite sarcini în numele nostru. Cu '
                +
                'toate acestea, sunt obligate să nu dezvăluie sau să folosească informația în alte scopuri.',
                //overflow: TextOverflow.ellipsis,
                //maxLines: 6,
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
                'acceptabile din punct de vedere comercial ca să o protejăm. Cu toate acestea, trebuie să ții cont că '
                +
                'nicio metodă de transmisie prin internet sau de stocare electronică nu este 100% sigură, și nu putem '
                +
                'garanta securitatea ei absolută.',
                //overflow: TextOverflow.ellipsis,
                //maxLines: 7,
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
                'Link-uri către alte site-uri sau către alți provideri de serviciu',
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
                'Această aplicație conține link-uri și formulare de contact către alte site-uri sau provideri de servicii. '
                +
                'Dacă dai click pe un link terțiar, vei fi redirecționat către acel site. Formularele de contact care sunt '
                +
                'completate de utilizator pentru un serviciu terțiar vor fi trimise direct către providerul terț de '
                +
                'servicii. Reamintim că noi nu acționăm cu aceste site-uri externe. Prin urmare îți recomandăm să citești '
                +
                'politica de confidențialitate a acestor site-uri. Nu avem niciun control și nu ne asumăm nicio '
                +
                'responsabiltate asupra conținutului, termenelor de confidențialiate sau practicile oricărui site terțiar '
                +
                'sau serviciu.',
                //overflow: TextOverflow.ellipsis,
                //maxLines: 12,
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
                //overflow: TextOverflow.ellipsis,
                //maxLines: 9,
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
            //9
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
                //overflow: TextOverflow.ellipsis,
                //maxLines: 7,
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
            //10
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
                'confidențialitate, nu ezita să ne contactezi la adresa radautiulcivic@gmail.com.'
                +
                'Tot pe această adresă de e-mail ne puteți solicita '
                +
                'ștergerea datelor personale din baza noastră de date. ',
                //overflow: TextOverflow.ellipsis,
                //maxLines: 5,
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