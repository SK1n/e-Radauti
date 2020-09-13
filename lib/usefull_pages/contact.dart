import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:flutter_icons/flutter_icons.dart';

class Contact extends StatefulWidget {
  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  bool _validateName = false;
  bool _validateDescription = false;
  bool _validateEmail = false;
  bool isLoading = false;

  //String _recipientController = 'ciprian.dicu7@yahoo.com';
  String _recipientController = 'radautiulcivic@gmail.com';

  final _bodyController = TextEditingController(
    text: '',
  );
  final _nameController = TextEditingController(
    text: '',
  );
  final _emailController = TextEditingController(
    text: '',
  );
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _mailer() async {
    String username = 'radautiulcivic@gmail.com';
    String password = 'pass123.CIVIC';

    final smtpServer = gmail(username, password);
    final message = Message()
      ..from = Address(username, _nameController.text)
      ..recipients.add(_recipientController)
    // ..ccRecipients.addAll(['radautiulcivic@gmail.com','coman.paul@yahoo.com'])
      ..subject =
          ' Formularul de contact ' + ' - aplicația e-Rădăuți'
      ..html = 'Către,'
          '     Rădăuțul civic' +
          '<br><br>' +
          'Stimată doamnă/ Stimate domn,<br><br>' +
          'Subsemnatul ' +
          _nameController.text +
          ', vă supun atenției următoarea problemă:<br><br>' +
          _bodyController.text +
          '<br><br>' +
          'Prezentul e-mail reprezintă un mesaj transmis ' +
          'prin intermediul aplicației mobile e-Rădăuți, dezvoltată'
              ' de Ascociația Rădăuțiul Civic, prin funcționalitatea „Contact”.<br><br>' +
          'Vă rog să îmi transmiteți răspunsul în termenul legal la adresa ' +
          _emailController.text +
          '.<br><br>' +
          'Cu stimă,<br><br>' +
          '     ' +
          _nameController.text +
          '<br><br>' +
          '     ' +
          'Email: ' +
          _emailController.text;
      //..attachments = attachments;

    try {
      final sendReport = await send(message, smtpServer);
      print('Message sent: ' + sendReport.toString());
      _scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text("Mesaj trimis!"),
      ));
      setState(() {
        _bodyController.text = '';
        _nameController.text = '';
        _emailController.text = '';
        isLoading = false;
      });
    } on MailerException catch (e) {
      print('Message not sent.');
      _scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text("Mesaj netrimis!"),
      ));
      for (var p in e.problems) {
        print('Problem: ${p.code}: ${p.msg}');
      }
      isLoading = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        automaticallyImplyLeading: false,
        leading: Container(
          padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
          margin: const EdgeInsets.fromLTRB(15.0, 5.0, 0.0, 5.0),
          child: Image.asset("assets/logo_images/app_logo.png"),
        ),
      ),
      body: isLoading
          ? Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation <Color> (Color(0xFF38A49C)),
        ),)
          : SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 20, bottom: 10,),
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
                                'Contact',
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
            Container(
                margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                child: TextField(
                  textCapitalization: TextCapitalization.sentences,
                  controller: _nameController,
                  enabled: true,
                  decoration: new InputDecoration(
                    border: new OutlineInputBorder(
                      borderSide: new BorderSide(
                          color: Color(0xFF38A49C)),
                    ),
                    prefixIcon: Icon(Icons.person, color: Color(0x55FB6340), size: 20,),
                    //hintText: "Enter Your Name",
                    labelText: 'Nume și prenume:',
                    prefixText: '',
                    errorText:
                    _validateName ? 'Nu ați introdus numele dvs.!' : null,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 1, color: Color(0xFF38A49C)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 1, color: Color(0xFF38A49C)),
                    ),
                    labelStyle: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: TextField(
                textCapitalization: TextCapitalization.sentences,
                controller: _emailController,
                enabled: true,
                decoration: new InputDecoration(
                  border: new OutlineInputBorder(
                    borderSide: new BorderSide(
                        color: Color.fromRGBO(56, 164, 156, 10)),
                  ),
                  prefixIcon: Icon(Ionicons.ios_mail, color: Color(0x55FB6340), size: 20,),
                  //hintText: "Enter Your Name",
                  labelText: 'Email:',
                  prefixText: '',
                  errorText:
                  _validateEmail ? 'Nu ați introdus email!' : null,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 1,
                        color: Color.fromRGBO(56, 164, 156, 10)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 1,
                        color: Color.fromRGBO(56, 164, 156, 10)),
                  ),
                  labelStyle: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 0,),
                child: TextField(
                  textCapitalization: TextCapitalization.sentences,
                  controller: _bodyController,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  enabled: true,
                  decoration: new InputDecoration(
                    border: new OutlineInputBorder(
                      borderSide: new BorderSide(
                          color: Color.fromRGBO(56, 164, 156, 10)),
                    ),
                    labelText: 'Mesaj:',
                    labelStyle: TextStyle(
                      color: Colors.grey,
                    ),
                    prefixText: '',
                    errorText: _validateDescription
                        ? 'Nu ați introdus un mesaj!'
                        : null,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 1, color: Color.fromRGBO(56, 164, 156, 10)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 1, color: Color.fromRGBO(56, 164, 156, 10)),
                    ),
                  ),
                ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20, left: 20, right: 20),
              width: MediaQuery.of(context).size.width,
              child: FlatButton(
                color: Color.fromRGBO(56, 164, 156, 10),
                textColor: Colors.white,
                onPressed: () {
                  setState(() {
                    _nameController.text.isEmpty
                        ? _validateName = true
                        : _validateName = false;
                    _bodyController.text.isEmpty
                        ? _validateDescription = true
                        : _validateDescription = false;
                    _emailController.text.isEmpty
                        ? _validateEmail = true
                        : _validateEmail = false;
                    if (_validateName == false) {
                      if (_validateDescription == false) {
                        if (_validateEmail == false) {
                          setState(() {
                            isLoading = true;
                          });
                          _mailer();
                        }
                      }
                    }
                  });
                },
                child: Text("Trimite"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void initState() {
    super.initState();
  }
}
