import 'dart:io';
import 'package:camera/camera.dart';
import 'take_picture.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';

class HomePageNoticeProblem extends StatefulWidget {
  @override
  _HomePageNoticeProblemState createState() => _HomePageNoticeProblemState();
}

class _HomePageNoticeProblemState extends State<HomePageNoticeProblem> {
  bool _validate = false;

  List<String> attachments = [];

  final _recipientController = TextEditingController(
    text: 'luys2007@outlook.com',
  );

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
      body:'Nume:' + _nameControler.text + '<br>' + _bodyController.text,
      subject: _subjectController.text,
      recipients: [_recipientController.text],
      attachmentPaths: attachments,
      isHTML: true,
    );

    String platformResponse;

    try {
      await FlutterEmailSender.send(email);
      platformResponse = 'success';
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
                  _nameControler.text.isEmpty ? _validate = true : _validate = false;
                  _bodyController.text.isEmpty ? _validate = true : _validate = false;
                  _subjectController.text.isEmpty ? _validate = true : _validate = false;
                  if(_path == null) {
                    _path == null ? _validate = true : _validate = false;
                    _scaffoldKey.currentState.showSnackBar(SnackBar(
                      content: Text("You didn't take a photo!"),
                    ));
                  }
                });
                if (_validate == false) {
                  send();
                }

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
                        errorText: _validate ? 'Value Can\'t Be Empty' : null,
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
                        errorText: _validate ? 'Value Can\'t Be Empty' : null,
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
                      errorText: _validate ? 'Value Can\'t Be Empty' : null,
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
                    items: <String>['email1@gmail.com', 'email2@gmail.com', 'email3@gmail.com', 'email4@gmail.com'].map((String value) {
                      return new DropdownMenuItem<String>(
                        value: value,
                        child: new Text(value),
                      );
                    }).toList(),
                    onChanged: (_) {},
                  ),
                )
              ],
            )
        )
    );
  }

  void _openImagePicker() async {
    File pick = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      attachments.add(pick.path);
    });
  }
}
