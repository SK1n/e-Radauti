import 'dart:io';
import 'package:camera/camera.dart';
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
          title: const Text('E-Radauti'),
          backgroundColor: Color.fromARGB(255, 54, 190, 166),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.send),
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
                });
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
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  alignment: Alignment.bottomCenter,
                  width: 80.0,
                  height: 80.0,
                  child: FlatButton(
                    onPressed: () {
                       _showOptions(context);
                       },
                    child: SvgPicture.asset('assets/images/notice_a_problem.svg'),
                  ),
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
                              color: Color.fromARGB(255, 54, 190, 166)),
                        ),
                        labelText: 'Name:',
                        prefixText: '',
                        errorText: _validateName ? 'Value Can\'t Be Empty' : null,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 1, color: Color.fromARGB(255, 54, 190, 166)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 1, color: Color.fromARGB(255, 54, 190, 166)),
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
                              color: Color.fromARGB(255, 54, 190, 166)),
                        ),
                        labelText: 'Subject:',
                        prefixText: '',
                        errorText: _validateSubject ? 'Value Can\'t Be Empty' : null,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 1, color: Color.fromARGB(255, 54, 190, 166)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 1, color: Color.fromARGB(255, 54, 190, 166)),
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
                            color: Color.fromARGB(255, 54, 190, 166)),
                      ),
                      labelText: 'Description:',
                      prefixText: '',
                      errorText: _validateDescription ? 'Value Can\'t Be Empty' : null,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 1, color: Color.fromARGB(255, 54, 190, 166)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 1, color: Color.fromARGB(255, 54, 190, 166)),
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
