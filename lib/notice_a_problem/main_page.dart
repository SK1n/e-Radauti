import 'dart:async';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutterapperadauti/menu_page.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/services.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:flutter_icons/flutter_icons.dart';

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
  String dropdownValue = "Destinatar";
  Position position;
  File recordedImage1;
  File recordedImage2;
  File recordedImage3;
  bool isLoading = false;
  bool checkBox = false;
  double _timeLeft = 15;
  Timer _timer;

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

  void startTimer() {
    _timeLeft = 0.0;
    if (_timer != null) {
      _timer.cancel();
    }
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_timeLeft < 16) {
          _timeLeft = _timeLeft + 0.1;
        } else {
          _timer.cancel();
        }
      });
    });
  }

  void _mailer() async {
    String username = 'radautiulcivic@gmail.com';
    String password = 'pass123.CIVIC';
    final smtpServer = gmail(username, password);
    Duration timeoutEmail = new Duration(hours: 0, minutes: 0, seconds: 10);

    var message;
    if (checkBox == true) {
      message = Message()
        ..from = Address(username, _nameController.text)
        ..recipients.add(_recipientController)
        ..subject = ' Petiție ${_subjectController.text} - aplicația e-Rădăuți'
        ..html = 'Către, ${dropdownValue.toString()} <br><br> Stimată doamnă/ Stimate domn,'
            '<br><br>Subsemnatul ${_nameController.text}, vă supun atenției următoarea problemă:<br><br>'
            '${_bodyController.text}<br><br>În conformitate cu atribuțiile pe care le aveți, vă rog să luați'
            ' măsurile ce se impun.<br><br> Cele sesizate sunt la următoarea adresă '
            ' Lat:${position.latitude.toString()} Long:${position.longitude.toString()}'
            "( <a href ='https://www.google.com/maps/place/${position.latitude.toString()}+${position.longitude.toString()}"
            "'>Adresa</a> )<br><br>"
            'Prezenta sesizare reprezintă o petiție în sensul O.G. nr. 27/2002 privind activitatea de soluționare a petițiilor și '
            'a fost transmisă prin intermediul aplicației mobile e-Rădăuți, dezvoltată'
            ' de Ascociația Rădăuțiul Civic, prin funcționalitatea „Sesizează o problemă”.<br><br>'
            'Vă rog să îmi transmiteți răspunsul în termenul legal la adresa ${_emailController.text}'
            '.<br><br>Cu stimă,<br><br>'
            '     ${_nameController.text}<br><br>     Tel: ${_numberController.text}/${_emailController.text}'
        ..attachments = attachments;
    } else {
      message = Message()
        ..from = Address(username, _nameController.text)
        ..recipients.add(_recipientController)
        ..subject = ' Petiție ${_subjectController.text} - aplicația e-Rădăuți'
        ..html = 'Către, ${dropdownValue.toString()} <br><br> Stimată doamnă/ Stimate domn,'
            '<br><br>Subsemnatul ${_nameController.text}, vă supun atenției următoarea problemă:<br><br>'
            '${_bodyController.text}<br><br>În conformitate cu atribuțiile pe care le aveți, vă rog să luați măsurile ce se impun.<br><br>'
            'Prezenta sesizare reprezintă o petiție în sensul O.G. nr. 27/2002 privind activitatea de soluționare a petițiilor și '
            'a fost transmisă prin intermediul aplicației mobile e-Rădăuți, dezvoltată'
            ' de Ascociația Rădăuțiul Civic, prin funcționalitatea „Sesizează o problemă”.<br><br>'
            'Vă rog să îmi transmiteți răspunsul în termenul legal la adresa ${_emailController.text}'
            '.<br><br>Cu stimă,<br><br>'
            '     ${_nameController.text}<br><br>     Tel: ${_numberController.text}/${_emailController.text}'
        ..attachments = attachments;
    }
    try {
      final sendReport = await send(message, smtpServer, timeout: timeoutEmail);
      print('Message sent: ' + sendReport.toString());
      showDialog(context: context, builder: (_) => popoutSucces());
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
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      debugPrint(e.problems.message);
      showDialog(context: context, builder: (_) => popoutFailed(e.problems));
    }
  }

  void removePicture(int i) async {
    setState(() {
      print(i);
      switch (i) {
        case 0:
          {
            attachments[0] = null;
            recordedImage1 = null;
            if (attachments[1] != null) {
              recordedImage1 = recordedImage2;
              recordedImage2 = null;
              attachments[0] = attachments[1];
              attachments[1] = null;
            }
            if (attachments[2] != null) {
              recordedImage2 = recordedImage3;
              attachments[1] = attachments[2];
              attachments[2] = null;
              recordedImage3 = null;
            }
          }
          break;
        case 1:
          {
            attachments[1] = null;
            recordedImage2 = null;
            if (attachments[2] != null) {
              recordedImage2 = recordedImage3;
              recordedImage3 = null;
              attachments[1] = attachments[2];
              attachments[2] = null;
            }
          }
          break;
        case 2:
          {
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
                    title: Text("Faceți o fotografie de la cameră")),
                ListTile(
                    onTap: () {
                      Navigator.pop(context);
                      _showPhotoLibrary(i);
                    },
                    leading: Icon(Icons.photo_library),
                    title: Text("Alegeți din biblioteca foto"))
              ]));
        });
  }

  void _showPhotoLibrary(int i) async {
    // ignore: deprecated_member_use
    final image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      switch (i) {
        case 0:
          {
            recordedImage1 = File(image.path);
            attachments[0] = FileAttachment(recordedImage1);
          }
          break;
        case 1:
          {
            if (recordedImage1 == null) {
              recordedImage1 = File(image.path);
              attachments[0] = FileAttachment(recordedImage1);
            } else {
              recordedImage2 = File(image.path);
              attachments[1] = FileAttachment(recordedImage2);
            }
          }
          break;
        case 2:
          {
            if (recordedImage1 == null) {
              recordedImage1 = File(image.path);
              attachments[0] = FileAttachment(recordedImage1);
            } else if (recordedImage2 == null) {
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
    // ignore: deprecated_member_use
    ImagePicker.pickImage(source: ImageSource.camera).then((File image) {
      if (image != null && image.path != null) {
        setState(() {
          switch (i) {
            case 0:
              {
                recordedImage1 = File(image.path);
                attachments[0] = FileAttachment(recordedImage1);
              }
              break;
            case 1:
              {
                if (recordedImage1 == null) {
                  recordedImage1 = File(image.path);
                  attachments[0] = FileAttachment(recordedImage1);
                } else {
                  recordedImage2 = File(image.path);
                  attachments[1] = FileAttachment(recordedImage2);
                }
              }
              break;
            case 2:
              {
                if (recordedImage1 == null) {
                  recordedImage1 = File(image.path);
                  attachments[0] = FileAttachment(recordedImage1);
                } else if (recordedImage2 == null) {
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
                onPressed: () => _scaffoldKey.currentState.openDrawer(),
              ),
            ),
          ],
        ),
        drawer: NavDrawer2(),
        body: isLoading
            ? Center(
          child: Stack(
            children: [
              CircularProgressIndicator(
                value: _timeLeft,
                valueColor:
                AlwaysStoppedAnimation<Color>(Color(0xFF38A49C)),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Text(
                  '${15 - _timeLeft.toInt() * 10}',
                  style: TextStyle(fontSize: 24),
                ),
              ),
            ],
          ),
        )
            : SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(bottom: 15, top: 20),
                child: Row(
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
                              Container(
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(
                                      0.0, 0.0, 0.0, 0.0), //10.0 //25.0
                                  child: Icon(
                                    Icons.photo_filter,
                                    color: Color(0x55FB6340),
                                    size: 30,
                                  ),
                                ),
                              ),
                              Container(
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(
                                      35.0, 0.0, 0.0, 0.0), //10.0 //25.0
                                  child: Text(
                                    'Sesizează \no problemă',
                                    style: TextStyle(
                                      color: Color(
                                          0xFF000000), //Color(0xFFFFFFFF),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 19,
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
              ),
              Container(
                  margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: TextField(
                    textCapitalization: TextCapitalization.sentences,
                    controller: _nameController,
                    enabled: true,
                    decoration: new InputDecoration(
                      border: new OutlineInputBorder(
                        borderSide:
                        new BorderSide(color: Color(0xFF38A49C)),
                      ),
                      prefixIcon: Icon(
                        Icons.person,
                        color: Color(0x55FB6340),
                        size: 20,
                      ),
                      //hintText: "Enter Your Name",
                      labelText: 'Nume și prenume:',
                      prefixText: '',
                      errorText: _validateName
                          ? 'Nu ați introdus numele dvs.!'
                          : null,
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
                          prefixIcon: Icon(
                            Ionicons.ios_mail,
                            color: Color(0x55FB6340),
                            size: 20,
                          ),
                          labelText: 'Email:',
                          prefixText: '',
                          errorText: _validateEmail
                              ? 'Nu ați introdus email!'
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
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10, right: 10),
                    ),
                    Container(
                        width: MediaQuery.of(context).size.width / 2 - 30,
                        child: TextField(
                          textCapitalization:
                          TextCapitalization.sentences,
                          controller: _numberController,
                          enabled: true,
                          decoration: new InputDecoration(
                            border: new OutlineInputBorder(
                              borderSide: new BorderSide(
                                  color:
                                  Color.fromRGBO(56, 164, 156, 10)),
                            ),
                            prefixIcon: Icon(
                              Icons.phone,
                              color: Color(0x55FB6340),
                              size: 20,
                            ),
                            //hintText: "Enter Your Name",
                            labelText: 'Telefon:',
                            prefixText: '',
                            errorText: _validateNumber
                                ? 'Nu ați introdus telefon!'
                                : null,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1,
                                  color:
                                  Color.fromRGBO(56, 164, 156, 10)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1,
                                  color:
                                  Color.fromRGBO(56, 164, 156, 10)),
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
                      errorText: _validateSubject
                          ? 'Nu ați introdus subiectul!'
                          : null,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 1,
                            color: Color.fromRGBO(56, 164, 156, 10)),
                      ),
                      labelStyle: TextStyle(
                        color: Colors.grey,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 1,
                            color: Color.fromRGBO(56, 164, 156, 10)),
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
                          ? 'Nu ați introdus o descriere!'
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
                    ),
                  )),
              GridView.count(
                crossAxisCount: 3,
                primary: false,
                shrinkWrap: true,
                padding: const EdgeInsets.only(
                  top: 0,
                  left: 0,
                  right: 0,
                  bottom: 0,
                ),
                children: <Widget>[
                  FlatButton(
                    onPressed: () {},
                    child: recordedImage1 == null
                        ? FlatButton(
                      child: SvgPicture.asset(
                          'assets/images/photo.svg'),
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
                    onPressed: () {},
                    child: recordedImage2 == null
                        ? FlatButton(
                      child: SvgPicture.asset(
                          'assets/images/photo.svg'),
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
                    onPressed: () {},
                    child: recordedImage3 == null
                        ? FlatButton(
                      child: SvgPicture.asset(
                          'assets/images/photo.svg'),
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
              CheckboxListTile(
                title: Text('Adaugati locatia dvs. la email'),
                activeColor: Color.fromRGBO(56, 164, 156, 10),
                secondary: checkBox == false
                    ? Icon(MaterialIcons.location_off)
                    : Icon(MaterialIcons.location_on),
                controlAffinity: ListTileControlAffinity.leading,
                value: checkBox,
                onChanged: (bool value) {
                  setState(() {
                    checkBox = value;
                    if (checkBox == true) {
                      if (position == null) {
                        getLocation();
                        _scaffoldKey.currentState.showSnackBar(SnackBar(
                          content: Text(
                              "Ne trebuie locația dvs.! Vă rugăm acceptați permisiunea de GPS!"),
                        ));
                      }
                    }
                  });
                },
              ),
              Text('Alege destinația sesizării din lista de mai jos'),
              Container(
                margin: EdgeInsets.only(
                  top: 0,
                  left: 0,
                  right: 0,
                  bottom: 20,
                ),
                child: new DropdownButton<String>(
                  value: dropdownValue,
                  elevation: 16,
                  style: TextStyle(color: Colors.black),
                  items: <String>[
                    'Destinatar',
                    'Primăria Rădăuți',
                    'Servicii Comunale',
                    'ACET Rădăuți',
                    'Consiliul Județean Suceava',
                    'Garda De Mediu Suceava',
                    'Garda Forestieră Suceava',
                    'Rădăuțiul Civic'
                  ].map((String value) {
                    return new DropdownMenuItem<String>(
                      value: value,
                      child: Center(
                        child: new Text(value),
                      ),
                    );
                  }).toList(),
                  onChanged: (String value) {
                    setState(() {
                      dropdownValue = value;
                      dropDownValueIdentifier(value);
                    });
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: 0,
                  left: 20,
                  right: 20,
                  bottom: 20,
                ),
                width: MediaQuery.of(context).size.width,
                child: FlatButton(
                  color: Color.fromRGBO(56, 164, 156, 10),
                  textColor: Colors.white,
                  onPressed: () {
                    attachments.removeWhere((item) => item == null);
                    verifyInputsAndSendEmail();
                  },
                  child: Text("Trimite"),
                ),
              )
            ],
          ),
        ));
  }

// _validateDropDown is true if selected values is 'Destinatar' and the
// user will get a message saying that he has to select a delivery location
// else _validateDropDown is false and _recipientController gets the address to delivery location
  void dropDownValueIdentifier(value) {
    switch (value) {
      case "Destinatar":
        {
          _validateDropDown = true;
          debugPrint('valoare email: $_recipientController');
        }
        break;
      case "Primăria Rădăuți":
        {
          _recipientController = "relatiipublice@primariaradauti.ro";
          _validateDropDown = false;
          debugPrint('valoare email: $_recipientController');
        }
        break;
      case "Servicii Comunale":
        {
          _recipientController = "office@serviciicomunale.ro";
          _validateDropDown = false;
          debugPrint('valoare email: $_recipientController');
        }
        break;
      case "ACET Rădăuți":
        {
          _recipientController = "agentia.radauti@acetsv.ro";
          _validateDropDown = false;
          debugPrint('valoare email: $_recipientController');
        }
        break;
      case "Consiliul Județean Suceava":
        {
          _recipientController = "contact@cjsuceava.ro";
          _validateDropDown = false;
          debugPrint('valoare email: $_recipientController');
        }
        break;
      case "Garda De Mediu Suceava":
        {
          _recipientController = "cjsuceava@gnm.ro";
          _validateDropDown = false;
          debugPrint('valoare email: $_recipientController');
        }
        break;
      case "Garda Forestieră Suceava":
        {
          _recipientController = "gardaforestiera.suceava@gmail.com";
          _validateDropDown = false;
          debugPrint('valoare email: $_recipientController');
        }
        break;
      case "Rădăuțiul Civic":
        {
          _recipientController = "666grade@gmail.com";
          _validateDropDown = false;
          debugPrint('valoare email: $_recipientController');
        }
        break;
    }
  }

//We check if every text input field is not empty and
// if there is at least one image, if everything is OK we send the email
  void verifyInputsAndSendEmail() {
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
      if (recordedImage1 != null ||
          recordedImage2 != null ||
          recordedImage3 != null) {
        _validatePath = false;
      } else {
        _validatePath = true;
        _scaffoldKey.currentState.showSnackBar(SnackBar(
          content: Text("Nu ați făcut/incărcat nici o poză!"),
        ));
      }
      if (_validateDropDown == true) {
        _scaffoldKey.currentState.showSnackBar(SnackBar(
          content: Text("Nu ați selectat o categorie!"),
        ));
      }
      if (_validateName == false) {
        if (_validateDescription == false) {
          if (_validateSubject == false) {
            if (_validateDropDown == false) {
              if (_validatePath == false) {
                if (attachments[0] == null) {
                  _scaffoldKey.currentState.showSnackBar(SnackBar(
                    content: Text("Nu ați făcut/incărcat nici o poză!"),
                  ));
                } else {
                  setState(() {
                    isLoading = true;
                  });
                  startTimer();
                  _mailer();
                }
              }
            }
          }
        }
      }
    });
  }

  CupertinoAlertDialog popoutSucces() {
    return CupertinoAlertDialog(
      title: Text('A fost trimis cu succes!'),
      content:
      Text('Mesajul a fost trimis cu succes catre $_recipientController'),
      actions: [
        CupertinoDialogAction(
          child: FlatButton(
            child: Text('Okay'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ],
    );
  }

  CupertinoAlertDialog popoutFailed(e) {
    return CupertinoAlertDialog(
      title: Text('A aparut o eroare'),
      content: Text('Mesajul nu a fost trimis din cauza ca:\n $e'),
      actions: [
        CupertinoDialogAction(
          child: FlatButton(
            child: Text('Okay'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        CupertinoDialogAction(
          child: FlatButton(
            child: Text('Incearca din nou'),
            onPressed: () {
              Navigator.pop(context);
              setState(() {
                isLoading = true;
              });
              startTimer();
              _mailer();
            },
          ),
        ),
      ],
    );
  }
}
