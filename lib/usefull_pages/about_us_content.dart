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
            padding: EdgeInsets.only(
              top: 20,
              bottom: 10,
            ),
            child: Row(
              children: <Widget>[
                Container(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    icon: Icon(
                      Icons.keyboard_arrow_left,
                      color: Color(0xFF979797),
                    ), //_left Icons.arrow_back
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
          ),
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
            padding: EdgeInsets.only(
              top: 10,
            ),
            width: MediaQuery.of(context).size.width - 30,
            child: Text(
              'Grupul de inițiativă Rădăuțiul civic a apărut în luna iunie 2017 in mod oficial, după o serie de acțiuni civice ' +
                  'implementate deja de unii membri, pe bază de voluntariat și din dorința de a da ceva înapoi orașului lor natal. ' +
                  'Misiunea grupului de inițiativă „Rădăuțiul civic” este de a stimula cetățenia activă și implicarea în comunitate.',
              overflow: TextOverflow.ellipsis,
              maxLines: 7,
              style: TextStyle(
                fontSize: 15,
              ),
            ),
          ),
          //2
          Container(
            padding: EdgeInsets.only(
              top: 10,
            ),
            width: MediaQuery.of(context).size.width - 30,
            child: Text(
              'Printre valorile de bază ale grupului nostru civic se numără:' +
                  '\n- transparența în acțiunile și obiectivele noastre;' +
                  '\n- integritatea și onestitatea membrilor și a comunității;' +
                  '\n- profesionalismul - mizăm pe acțiuni de calitate, nu pentru imagine ci pentru un impact real în comunitate;' +
                  '\n- non-partizanatul la orice inițiativă civică, acest grup de inițiativă nu este și nu va fi partizan politic.',
              overflow: TextOverflow.ellipsis,
              maxLines: 8,
              style: TextStyle(
                fontSize: 15,
              ),
            ),
          ),
          //3
          Container(
            padding: EdgeInsets.only(
              top: 10,
            ),
            width: MediaQuery.of(context).size.width - 30,
            child: Text(
              'Chiar dacă suntem încă un grup de inițiativă și nu avem personalitate juridică (nu suntem încă un ONG),' +
                  ' asta nu ne împiedică să punem deja pe picioare acțiuni utile pentru comunitate.',
              overflow: TextOverflow.ellipsis,
              maxLines: 5,
              style: TextStyle(
                fontSize: 15,
              ),
            ),
          ),
          //4
          Container(
            padding: EdgeInsets.only(
              top: 10,
              bottom: 20,
            ),
            width: MediaQuery.of(context).size.width - 30,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new InkWell(
                    child: new Text(
                      'www.radautiulcivic.ro',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Color(0xFF38A49C),
                        fontSize: 15,
                      ),
                    ),
                    onTap: () =>
                        UrlLauncher.launch('https://www.radautiulcivic.ro/')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
