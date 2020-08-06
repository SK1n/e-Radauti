import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutterapperadauti/menu_page.dart';
import 'take_picture.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:geolocator/geolocator.dart';

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
  Position position;
  String dropdownValue = "Select";

  List<String> attachments = [];

  String _recipientController = null;

  final _subjectController = TextEditingController(text: '');

  final _bodyController = TextEditingController(
    text: '',
  );
  final _nameControler = TextEditingController(
    text: '',
  );
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Future<void> send() async {
    final Email email = Email(
      body:'Nume:' + _nameControler.text + '<br>' + 'Descriere: <br>' + _bodyController.text + '<br>' + position.toString(),
      subject: _subjectController.text,
      recipients: [_recipientController.toString()],
      attachmentPaths: attachments,
      isHTML: true,
    );

    String platformResponse;

    try {
      await FlutterEmailSender.send(email);
      platformResponse = 'Succes';
    } catch (error) {
      platformResponse = error.toString();
    }

    if (!mounted) return;

    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(platformResponse),
    ));
  }

  String _path = null;

  void _showPhotoLibrary() async {
    final file = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _path = file.path;
      attachments.add(_path);
    });
  }

  void getLocation() async {
    position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    print(position);
  }

  void _showCamera() async {
    final cameras = await availableCameras();
    final camera = cameras.first;

    final result = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => TakePicturePage(camera: camera)));

    setState(() {
      _path = result;
      attachments.add(_path);
    });
  }

  void _showOptions(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
              height: 150,
              child: Column(children: <Widget>[
                ListTile(
                    onTap: () {
                      Navigator.pop(context);
                      _showCamera();
                    },
                    leading: Icon(Icons.photo_camera),
                    title: Text("Take a picture from camera")),
                ListTile(
                    onTap: () {
                      Navigator.pop(context);
                      _showPhotoLibrary();
                    },
                    leading: Icon(Icons.photo_library),
                    title: Text("Choose from photo library"))
              ]));
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
              margin: EdgeInsets.only(top: 0.0, right: 0.0), // EdgeInsets.only(top: 20.0, right: 10.0),
              child: IconButton(
                icon: Icon(Icons.menu,
                  size: 24,
                  color: Colors.black, ), //Colors.white
                onPressed: () => _scaffoldKey.currentState.openDrawer(), //_scaffoldKey.currentState.openDrawer(),
              ),
            ),
          ],
        ),
        drawer: NavDrawer2(),
        body: SingleChildScrollView(
            child: Column(
              children: [
                Row(
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
                      width: MediaQuery.of(context).size.width-80,
                      child: new Stack(
                        alignment: AlignmentDirectional.center,
                        children: <Widget>[
                          Stack(
                            children: <Widget>[
                              Icon(Icons.camera, color: Color(0x55FB6340),),
                              SizedBox(width: 5,),
                              Container(
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(30.0, 4.0, 0.0, 0.0), //10.0 //25.0
                                  child: Text(
                                    'Sesizeaza o problema',
                                    style: TextStyle(
                                      color: Color(0xFF000000), //Color(0xFFFFFFFF),
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
                      controller: _nameControler,
                      enabled: true,
                      decoration: new InputDecoration(
                        border: new OutlineInputBorder(
                          borderSide: new BorderSide(
                              color: Color(0xAAFB6340)),
                        ),
                        labelText: 'Name:',
                        prefixText: '',
                        errorText: _validateName ? 'Value Can\'t Be Empty' : null,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 1, color: Color(0xAAFB6340)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 1, color: Color(0xAAFB6340)),
                        ),
                        labelStyle: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    )),
                Container(
                    margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                    child: TextField(
                      textCapitalization: TextCapitalization.sentences,
                      controller: _subjectController,
                      enabled: true,
                      decoration: new InputDecoration(
                        border: new OutlineInputBorder(
                          borderSide: new BorderSide(
                              color: Color(0xAAFB6340)),
                        ),
                        labelText: 'Subject:',
                        prefixText: '',
                        errorText: _validateSubject ? 'Value Can\'t Be Empty' : null,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 1, color: Color(0xAAFB6340)),
                        ),
                        labelStyle: TextStyle(
                          color: Colors.grey,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 1, color: Color(0xAAFB6340)),
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
                            color: Color(0xAAFB6340)),
                      ),
                      labelText: 'Description:',
                      labelStyle: TextStyle(
                        color: Colors.grey,
                      ),
                      prefixText: '',
                      errorText: _validateDescription ? 'Value Can\'t Be Empty' : null,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 1, color: Color(0xAAFB6340)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 1, color: Color(0xAAFB6340)),
                      ),
                    ),
                  )
                ),
                Container(
                  margin: EdgeInsets.only(top:20, left:20, right: 20),
                  child: new DropdownButton<String>(
                    value: dropdownValue,
                    elevation: 16,
                    style: TextStyle(color: Colors.black),
                    items: <String>['Select','Primarie', 'Defectiuni', 'Apa'].map((String value) {
                      return new DropdownMenuItem<String>(
                        value: value,
                        child: new Text(value),
                      );
                    }).toList(),
                    onChanged: (String value) {
                      setState(() {
                        dropdownValue = value;
                        if(identical(value.toString(), "Select")) {
                          _validateDropDown = true;
                          print(_validateDropDown.toString());
                          print(_recipientController.toString());
                        } else if (identical(value.toString(), "Primarie")) {
                          _recipientController = "email1@gmail.com";
                          _validateDropDown = false;
                          print(_validateDropDown.toString());
                          print(_recipientController.toString());
                        } else if (identical(value.toString(), "Defectiuni")){
                          _recipientController = "email2@gmail.com";
                          _validateDropDown = false;
                          print(_validateDropDown.toString());
                          print(_recipientController.toString());
                        } else if(identical(value.toString(), "Apa")) {
                          _recipientController = "email3@gmail.com";
                          _validateDropDown = false;
                          print(_validateDropDown.toString());
                          print(_recipientController.toString());
                        }
                      });
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top:20, left:20, right: 20),
                  width: MediaQuery.of(context).size.width,
                  child: FlatButton(
                    color: Color(0xAAFB6340),
                    textColor: Colors.white,
                    onPressed: () {
                      _showOptions(context);
                    },
                    child: Text(
                        "Take a picture"
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top:0, left:20, right: 20),
                  width: MediaQuery.of(context).size.width,
                  child: FlatButton(
                    color: Color(0xAAFB6340),
                    textColor: Colors.white,
                    onPressed: () {
                      setState(() {
                        _nameControler.text.isEmpty ? _validateName = true : _validateName = false;
                        _bodyController.text.isEmpty ? _validateDescription = true : _validateDescription = false;
                        _subjectController.text.isEmpty ? _validateSubject = true : _validateSubject = false;
                        if(_path == null) {
                          _path == null ? _validatePath = true : _validatePath = false;
                          _scaffoldKey.currentState.showSnackBar(SnackBar(
                            content: Text("You didn't take a photo!"),
                          ));
                        }
                        if(_validateDropDown == true) {
                          _scaffoldKey.currentState.showSnackBar(SnackBar(
                            content: Text("You didn't select a category"),
                          ));
                        }
                        if(position == null) {
                          getLocation();
                          _scaffoldKey.currentState.showSnackBar(SnackBar(
                            content: Text("We need your location. Please accept the location permission or activate your GPS!"),
                          ));
                        }
                        if (_validateName == false)
                          if(_validateDescription == false)
                            if(_validateSubject == false)
                              if(_validatePath == false)
                                if(_validateDropDown == false)
                                  if(position != null)
                                    send();
                      });
                    },
                    child: Text(
                      "Send"
                    ),
                  ),
                )
              ],
            )
        )
    );
  }

  void initState() {
    super.initState();
    WidgetsBinding.instance
        .addPostFrameCallback((_) => getLocation());
  }
}
