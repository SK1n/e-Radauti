import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/services.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

class Contact extends StatelessWidget {
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
              padding: EdgeInsets.only(
                top: 10,
              ),
              width: MediaQuery.of(context).size.width - 80,
              child: Text(
                "Informații despre primar, viceprimar și atribuțiile fiecăruia.",
                overflow: TextOverflow.ellipsis,
                maxLines: 5,
                style: TextStyle(
                  color: Color(0xFF38A49C),
                  fontSize: 15,
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width - 120,
              padding: EdgeInsets.only(
                left: 10,
              ),
              child: Text(
                "Conducere",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Contact2 extends StatefulWidget {
  @override
  _Contact2State createState() => _Contact2State();
}

class _Contact2State extends State<Contact2> {
  bool _validateName = false;
  //bool _validateSubject = false;
  bool _validateDescription = false;
  //bool _validateDropDown = false;
  //bool _validatePath = false;
  //bool _validateNumber = false;
  bool _validateEmail = false;
  //String dropdownValue = "Selecteaza";
  Position position;
  //File recordedImage1;
  //File recordedImage2;
  //File recordedImage3;
  bool isLoading = false;

  List<Attachment> attachments = [null, null, null];
  //Attachment attachments = null;

  //String _recipientController;

  //final _subjectController = TextEditingController(text: '');

  final _bodyController = TextEditingController(
    text: '',
  );
  final _nameController = TextEditingController(
    text: '',
  );
  /*final _numberController = TextEditingController(
    text: '',
  );*/
  final _emailController = TextEditingController(
    text: '',
  );
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _mailer() async {
    String username = 'ciprian.dicu7@yahoo.com';
    String password = 'Mate#93';

    final smtpServer = gmail(username, password);
    final message = Message()
      ..from = Address(username, _nameController.text)
      ..recipients.add('ciprian.dicu7@yahoo.com')
      // ..ccRecipients.addAll(['radautiulcivic@gmail.com','coman.paul@yahoo.com'])
      ..subject = ' Mesaj secțiunea Contact ' + ' - aplicația e-Rădăuți'
      ..html = 'Către,'
              '     ' +
          ' Rădăuțiul civic    ' +
          '<br><br>' +
          'Stimată doamnă/ Stimate domn,<br><br>' +
          'Subsemnatul ' +
          _nameController.text +
          ', vă supun atenției următoarea problemă:<br><br>' +
          _bodyController.text +
          '<br><br>' +
          'Prezentul email ' +
          'a fost transmis prin intermediul aplicației mobile e-Rădăuți, dezvoltată'
              ' de Ascociația Rădăuțiul Civic, prin funcționalitatea „Contact”.<br><br>' +
          'Vă rog să îmi transmiteți răspunsul la adresa ' +
          _emailController.text +
          '.<br><br>' +
          'Cu stimă,<br><br>' +
          '     ' +
          _nameController.text +
          '<br><br>' +
          '     ' +
          'Email: ' +
          _emailController.text
      ..attachments = attachments;

    try {
      final sendReport = await send(message, smtpServer);
      print('Message sent: ' + sendReport.toString());
      _scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text("Mesaj trimis!"),
      ));
      setState(() {
        //attachments = [null, null, null];
        //recordedImage1 = null;
        //recordedImage2 = null;
        //recordedImage3 = null;
        //_subjectController.text = '';
        _bodyController.text = '';
        _nameController.text = '';
        //_numberController.text = '';
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

  /*void removePicture(int i) async {
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
  }*/

  /*Future<void> getImage(BuildContext context, int i) async {
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
  }*/

  /*void _showPhotoLibrary(int i) async {
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
  }*/

  void getLocation() async {
    position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    print(position);
  }

  /*Future<void> _takePhoto(int i) async {
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
  }*/

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
                  valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF38A49C)),
                ),
              )
            : SingleChildScrollView(
                child: Column(
                children: [
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
                                        color: Color(
                                            0xFF000000), //Color(0xFFFFFFFF),
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
                                color: Color.fromRGBO(56, 164, 156, 10)),
                          ),
                          labelText: 'Nume și prenume:',
                          prefixText: '',
                          errorText: _validateName
                              ? 'Nu ați introdus numele dvs.'
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
                  Container(
                    margin: EdgeInsets.fromLTRB(20, 20, 0, 20),
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width - 30,
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
                              errorText: _validateEmail
                                  ? 'Nu ați introdus un email!'
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
                      ],
                    ),
                  ),
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
                          labelText: 'Mesaj:',
                          labelStyle: TextStyle(
                            color: Colors.grey,
                          ),
                          prefixText: '',
                          errorText: _validateDescription
                              ? 'Nu ați introdus un mesaj'
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
                  Container(
                    margin: EdgeInsets.only(top: 0, left: 20, right: 20),
                    width: MediaQuery.of(context).size.width,
                    child: FlatButton(
                      color: Color.fromRGBO(56, 164, 156, 10),
                      textColor: Colors.white,
                      onPressed: () {
                        //attachments.removeWhere((item) => item == null);
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
                          /*if (position == null) {
                          getLocation();
                          _scaffoldKey.currentState.showSnackBar(SnackBar(
                            content: Text(
                                "Ne trebuie locatia dvs. Va rugam acceptati permisiunea de GPS"),
                          ));
                        }*/
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
                  )
                ],
              )));
  }

  void initState() {
    super.initState();
    //WidgetsBinding.instance.addPostFrameCallback((_) => getLocation());
  }
}
