import 'dart:developer';
import 'dart:io';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutterapperadauti/menu_page.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/services.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:gallery_saver/gallery_saver.dart';


class HomePageNoticeProblem extends StatefulWidget {
  @override
  _HomePageNoticeProblemState createState() => _HomePageNoticeProblemState();
}

class _HomePageNoticeProblemState extends State<HomePageNoticeProblem> {
  bool _validateName = false;
  bool _validateSubject = false;
  bool _validateDescription = false;
  bool _validateDropDown = false;
  bool _validatePath = false;
  bool _validateNumber = false;
  bool _validateEmail = false;
  String dropdownValue = "Selecteaza";
  Position position;
  File recordedImage1;
  File recordedImage2;
  File recordedImage3;
  bool isLoading = false;

  List<Attachment> attachments = [null, null, null];

  String _recipientController;

  final _subjectController = TextEditingController(text: '');

  final _bodyController = TextEditingController(
    text: '',
  );
  final _nameController = TextEditingController(
    text: '',
  );
  final _numberController = TextEditingController(
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
      ..recipients.add(_recipientController.toString())
     // ..ccRecipients.addAll(['radautiulcivic@gmail.com','coman.paul@yahoo.com'])
      ..subject =
          ' Petiție ' + _subjectController.text + ' - aplicația e-Rădăuți'
      ..html = 'Către,'
          '     ' +
          dropdownValue.toString() +
          '<br><br>' +
          'Stimată doamnă/ Stimate domn,<br><br>' +
          'Subsemnatul ' +
          _nameController.text +
          ', vă supun atenției următoarea problemă:<br><br>' +
          _bodyController.text +
          '<br><br>În conformitate cu atribuțiile pe care le aveți, vă rog să luați măsurile ce se impun.<br><br> Cele sesizate sunt la următoarea adresă ' +
          ' Lat:' + position.latitude.toString() + ' Long:' + position.longitude.toString() + "( <a href ='https://www.google.com/maps/place/" + position.latitude.toString() + "+" + position.longitude.toString() + "'>Adresa</a> )"
          '<br><br>' +
          'Prezenta sesizare reprezintă o petiție în sensul O.G. nr. 27/2002 privind activitatea de soluționare a petițiilor și ' +
          'a fost transmisă prin intermediul aplicației mobile e-Rădăuți, dezvoltată'
              ' de Ascociația Rădăuțiul Civic, prin funcționalitatea „Sesizează o problemă”.<br><br>' +
          'Vă rog să îmi transmiteți răspunsul în termenul legal la adresa ' +
          _emailController.text +
          '.<br><br>' +
          'Cu stimă,<br><br>' +
          '     ' +
          _nameController.text +
          '<br><br>' +
          '     ' +
          'Tel: ' +
          _numberController.text +
          '/' +
          _emailController.text
      ..attachments = attachments;

    try {
      final sendReport = await send(message, smtpServer);
      print('Message sent: ' + sendReport.toString());
      _scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text("Mesaj trimis!"),
      ));
      setState(() {
        attachments = [null, null, null];
        recordedImage1 = null;
        recordedImage2 = null;
        recordedImage3 = null;
        _subjectController.text = '';
        _bodyController.text = '';
        _nameController.text = '';
        _numberController.text = '';
        _emailController.text = '';
        isLoading = false;
      });
    } on MailerException catch (e) {
      print('Message not sent.' + e.message);
      _scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text("Mesaj netrimis!"),
      ));
      for (var p in e.problems) {
        print('Problem: ${p.code}: ${p.msg}');
      }
      setState(() {
        isLoading = false;
      });
    }
  }

  void removePicture(int i) async {
    setState(() {
      print(i);
      switch(i) {
        case 0: {
          attachments[0] = null;
          recordedImage1 = null;
          if(attachments[1] != null) {
            recordedImage1 = recordedImage2;
            recordedImage2 = null;
            attachments[0] = attachments[1];
            attachments[1] = null;
          }
          if(attachments[2] != null) {
            recordedImage2 = recordedImage3;
            attachments[1] = attachments[2];
            attachments[2] = null;
            recordedImage3 = null;
          }
        } break;
        case 1: {
          attachments[1] = null;
          recordedImage2 = null;
          if(attachments[2] != null) {
            recordedImage2 = recordedImage3;
            recordedImage3 = null;
            attachments[1] = attachments[2];
            attachments[2] = null;
          }
        } break;
        case 2: {
          attachments[2] = null;
          recordedImage3 = null;
        }
      }
    });
  }

  Future<void> getImage(BuildContext context, int i) async {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
              height: 150,
              child: Column(children: <Widget>[
                ListTile(
                    onTap: () {
                      Navigator.pop(context);
                      _takePhoto(i);
                    },
                    leading: Icon(Icons.photo_camera),
                    title: Text("Take a picture from camera")),
                ListTile(
                    onTap: () {
                      Navigator.pop(context);
                      _showPhotoLibrary(i);
                    },
                    leading: Icon(Icons.photo_library),
                    title: Text("Choose from photo library"))
              ]));
        });
  }

  void _showPhotoLibrary(int i) async {
    final image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      switch(i) {
        case 0: {
          recordedImage1 = File(image.path);
          attachments[0] = FileAttachment(recordedImage1);
        } break;
        case 1: {
          if(recordedImage1 == null) {
            recordedImage1 = File(image.path);
            attachments[0] = FileAttachment(recordedImage1);
          } else {
            recordedImage2 = File(image.path);
            attachments[1] = FileAttachment(recordedImage2);
          }
        } break;
        case 2: {
          if(recordedImage1 == null) {
            recordedImage1 = File(image.path);
            attachments[0] = FileAttachment(recordedImage1);
          } else if(recordedImage2 == null) {
            recordedImage2 = File(image.path);
            attachments[1] = FileAttachment(recordedImage2);
          } else {
            recordedImage3 = File(image.path);
            attachments[2] = FileAttachment(recordedImage3);
          }
        }
      }
    });
  }

  void getLocation() async {
    position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      print(position);
    }

  Future<void> _takePhoto(int i) async {
    ImagePicker.pickImage(source: ImageSource.camera).then((File image) {
      if (image != null && image.path != null) {
        setState(() {
          switch(i) {
            case 0: {
              recordedImage1 = File(image.path);
              attachments[0] = FileAttachment(recordedImage1);
            } break;
            case 1: {
              if(recordedImage1 == null) {
                recordedImage1 = File(image.path);
                attachments[0] = FileAttachment(recordedImage1);
              } else {
                recordedImage2 = File(image.path);
                attachments[1] = FileAttachment(recordedImage2);
              }
            } break;
            case 2: {
              if(recordedImage1 == null) {
                recordedImage1 = File(image.path);
                attachments[0] = FileAttachment(recordedImage1);
              } else if(recordedImage2 == null) {
                recordedImage2 = File(image.path);
                attachments[1] = FileAttachment(recordedImage2);
              } else {
                recordedImage3 = File(image.path);
                attachments[2] = FileAttachment(recordedImage3);
              }
            }
          }
        });
        GallerySaver.saveImage(image.path).then((bool success) {
          setState(() {});
        });
      }
    });
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
          actions: <Widget>[
            Container(
              alignment: Alignment.topRight,
              margin: EdgeInsets.only(top: 0.0, right: 0.0),
              // EdgeInsets.only(top: 20.0, right: 10.0),
              child: IconButton(
                icon: Icon(
                  Icons.menu,
                  size: 24,
                  color: Colors.black,
                ), //Colors.white
                onPressed: () => _scaffoldKey.currentState
                    .openDrawer(),
              ),
            ),
          ],
        ),
        drawer: NavDrawer2(),
        body: isLoading
            ? Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation <Color> (Color(0x55FB6340)),
          ),)
            : SingleChildScrollView(
            child: Column(
          children: [
            Row(
              children: <Widget>[
                Container(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    icon: Icon(
                      Icons.keyboard_arrow_left,
                      color: Color(0xFF979797),
                    ),
                    //_left Icons.arrow_back
                    onPressed: () {
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
                          Icon(
                            Icons.camera,
                            color: Color(0x55FB6340),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Container(
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(
                                  30.0, 4.0, 0.0, 0.0), //10.0 //25.0
                              child: Text(
                                'Sesizeaza o problema',
                                style: TextStyle(
                                  color: Color(0xFF000000),
                                  //Color(0xFFFFFFFF),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
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
            Container(
                margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                child: TextField(
                  textCapitalization: TextCapitalization.sentences,
                  controller: _nameController,
                  enabled: true,
                  decoration: new InputDecoration(
                    border: new OutlineInputBorder(
                      borderSide: new BorderSide(
                          color: Color.fromRGBO(56, 164, 156, 10)),
                    ),
                    labelText: 'Nume si prenume:',
                    prefixText: '',
                    errorText:
                        _validateName ? 'Nu ati introdus nume dvs.' : null,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 1, color: Color.fromRGBO(56, 164, 156, 10)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 1, color: Color.fromRGBO(56, 164, 156, 10)),
                    ),
                    labelStyle: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                )),
            Container(
              margin: EdgeInsets.fromLTRB(20, 20, 0, 20),
              child: Row(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width / 2 - 30,
                    child: TextField(
                      textCapitalization: TextCapitalization.sentences,
                      controller: _emailController,
                      enabled: true,
                      decoration: new InputDecoration(
                        border: new OutlineInputBorder(
                          borderSide: new BorderSide(
                              color: Color.fromRGBO(56, 164, 156, 10)),
                        ),
                        labelText: 'Email:',
                        prefixText: '',
                        errorText:
                            _validateEmail ? 'Nu ati introdus un email!' : null,
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
                  Padding(
                    padding: EdgeInsets.only(left: 10, right: 10),
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width / 2 - 30,
                      child: TextField(
                        textCapitalization: TextCapitalization.sentences,
                        controller: _numberController,
                        enabled: true,
                        decoration: new InputDecoration(
                          border: new OutlineInputBorder(
                            borderSide: new BorderSide(
                                color: Color.fromRGBO(56, 164, 156, 10)),
                          ),
                          labelText: 'Numar de telefon:',
                          prefixText: '',
                          errorText: _validateNumber
                              ? 'Nu ati introdus un numar de telefon!'
                              : null,
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
                      )),
                ],
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                child: TextField(
                  textCapitalization: TextCapitalization.sentences,
                  controller: _subjectController,
                  enabled: true,
                  decoration: new InputDecoration(
                    border: new OutlineInputBorder(
                      borderSide: new BorderSide(
                          color: Color.fromRGBO(56, 164, 156, 10)),
                    ),
                    labelText: 'Subiect:',
                    prefixText: '',
                    errorText:
                        _validateSubject ? 'Nu ati introdus subiectul' : null,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 1, color: Color.fromRGBO(56, 164, 156, 10)),
                    ),
                    labelStyle: TextStyle(
                      color: Colors.grey,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 1, color: Color.fromRGBO(56, 164, 156, 10)),
                    ),
                  ),
                )),
            Container(
                margin: EdgeInsets.only(top: 20, left: 20, right: 20),
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
                    labelText: 'Descriere:',
                    labelStyle: TextStyle(
                      color: Colors.grey,
                    ),
                    prefixText: '',
                    errorText: _validateDescription
                        ? 'Nu ati introdus o descriere'
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
                )),
            GridView.count(
              crossAxisCount: 2,
              primary: false,
              shrinkWrap: true,
              padding: const EdgeInsets.all(20),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              children: <Widget>[
                FlatButton(
                  child: recordedImage1 == null
                      ? FlatButton(
                      child: SvgPicture.asset('assets/images/photo.svg'),
                      onPressed: () {
                        getImage(context, 0);
                      },
                      )
                      : FlatButton(
                      child: Image.file(recordedImage1),
                      onPressed: () {
                        getImage(context, 0);
                      },
                    onLongPress: () {
                      removePicture(0);
                    },
                  ),
                ),
                FlatButton(
                  child: recordedImage2 == null
                      ? FlatButton(
                    child: SvgPicture.asset('assets/images/photo.svg'),
                    onPressed: () {
                      getImage(context, 1);
                      },
                  )
                      : FlatButton(
                      child: Image.file(recordedImage2),
                      onPressed: () {
                        getImage(context, 1);
                      },
                    onLongPress: () {
                      removePicture(1);
                    },
                  ),
                ),
                FlatButton(
                  child: recordedImage3 == null
                      ? FlatButton(
                      child: SvgPicture.asset('assets/images/photo.svg'),
                      onPressed: () {
                        getImage(context, 2);
                      },
                  )
                      : FlatButton(
                      child: Image.file(recordedImage3),
                      onPressed: () {
                        getImage(context, 2);
                      },
                    onLongPress: () {
                      removePicture(2);
                    },
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 20, left: 20, right: 20),
              child: new DropdownButton<String>(
                value: dropdownValue,
                elevation: 16,
                style: TextStyle(color: Colors.black),
                items: <String>['Selecteaza', 'Primaria Radauti', 'Servicii Comunale', 'ACET Radauti', 'Consiliul Judetean Suceava', 'Garda De Mediu Suceava', 'Garda Forestiera Suceava', 'Radautiul Civic']
                    .map((String value) {
                  return new DropdownMenuItem<String>(
                    value: value,
                    child: new Text(value),
                  );
                }).toList(),
                onChanged: (String value) {
                  setState(() {
                    dropdownValue = value;
                    switch (value) {
                      case "Selecteaza": {
                        _validateDropDown = true;
                      } break;
                      case "Primaria Radauti": {
                        _recipientController = "relatiipublice@primariaradauti.ro";
                        _validateDropDown = false;
                      } break;
                      case "Servicii Comunale" : {
                        _recipientController = "office@serviciicomunale.ro";
                        _validateDropDown = false;
                      } break;
                      case "ACET Radauti" : {
                        _recipientController = "agentia.radauti@acetsv.ro";
                        _validateDropDown = false;
                      } break;
                      case "Consiliul Judetean Suceava" : {
                        _recipientController = "contact@cjsuceava.ro";
                        _validateDropDown = false;
                      } break;
                      case "Garda De Mediu Suceava" : {
                        _recipientController = "cjsuceava@gnm.ro";
                        _validateDropDown = false;
                      } break;
                      case "Garda Forestiera Suceava" : {
                        _recipientController = "gardaforestiera.suceava@gmail.com";
                        _validateDropDown = false;
                      } break;
                      case "Radautiul Civic" : {
                        _recipientController = "radautiulcivic@gmail.com";
                        _validateDropDown = false;
                      } break;
                    }
                    /*
                    if (identical(value.toString(), "Selecteaza")) {
                      _validateDropDown = true;
                    } else if (identical(value.toString(), "Primaria Radauti")) {
                      _recipientController = "email1@gmail.com";
                      _validateDropDown = false;
                      print(_validateDropDown.toString());
                      print(_recipientController.toString());
                    } else if (identical(value.toString(), "Defectiuni")) {
                      _recipientController = "email2@gmail.com";
                      _validateDropDown = false;
                      print(_validateDropDown.toString());
                      print(_recipientController.toString());
                    } else if (identical(value.toString(), "Apa")) {
                      _recipientController = "email3@gmail.com";
                      _validateDropDown = false;
                      print(_validateDropDown.toString());
                      print(_recipientController.toString());
                    }*/
                  });
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20, left: 20, right: 20),
              width: MediaQuery.of(context).size.width,
              child: FlatButton(
                color: Color.fromRGBO(56, 164, 156, 10),
                textColor: Colors.white,
                onPressed: () {
                  //_showOptions(context);
                },
                child: Text("Fa o poza"),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 0, left: 20, right: 20),
              width: MediaQuery.of(context).size.width,
              child: FlatButton(
                color: Color.fromRGBO(56, 164, 156, 10),
                textColor: Colors.white,
                onPressed: () {
                  attachments.removeWhere((item) => item == null);
                    setState(() {
                      _nameController.text.isEmpty
                          ? _validateName = true
                          : _validateName = false;
                      _bodyController.text.isEmpty
                          ? _validateDescription = true
                          : _validateDescription = false;
                      _subjectController.text.isEmpty
                          ? _validateSubject = true
                          : _validateSubject = false;
                      _emailController.text.isEmpty
                          ? _validateEmail = true
                          : _validateEmail = false;
                      _numberController.text.isEmpty
                          ? _validateNumber = true
                          : _validateNumber = false;
                      if (recordedImage1 != null || recordedImage2 != null || recordedImage3 != null) {
                        _validatePath = false;
                      } else {
                        _validatePath = true;
                        _scaffoldKey.currentState.showSnackBar(SnackBar(
                          content: Text("Nu ai facut poza!"),
                        ));
                      }
                      if (_validateDropDown == true) {
                        _scaffoldKey.currentState.showSnackBar(SnackBar(
                          content: Text("Nu ai selectat o categorie"),
                        ));
                      }
                      if (position == null) {
                        getLocation();
                        _scaffoldKey.currentState.showSnackBar(SnackBar(
                          content: Text(
                              "Ne trebuie locatia dvs. Va rugam acceptati permisiunea de GPS"),
                        ));
                      }
                      if (_validateName == false) {
                        if (_validateDescription == false) {
                          if (_validateSubject == false) {
                            if (_validateDropDown == false) {
                              if (position != null) {
                                if (_validatePath == false) {
                                  if(attachments[0] == null) {
                                    _scaffoldKey.currentState.showSnackBar(SnackBar(
                                      content: Text(
                                          "Nu ati facut/incarcat nici o poza!"),
                                    ));
                                  } else {
                                    setState(() {
                                      isLoading = true;
                                    });
                                    _mailer();
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    });
                },
                child: Text("Trimite"),
              ),
            )
          ],
        )));
  }

  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => getLocation());
  }
}
