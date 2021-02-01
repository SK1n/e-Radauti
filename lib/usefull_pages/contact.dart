import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapperadauti/usefull_pages/mailer_directory/mailer_file.dart';
import 'package:flutterapperadauti/usefull_pages/usefull_pages_widget/widget_contact_model.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutterapperadauti/widgets/src/appBarModel.dart';
import 'package:flutterapperadauti/widgets/src/nav_drawer.dart';

class Contact extends StatefulWidget {
  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  bool _validateName = false;
  bool _validateDescription = false;
  bool _validateEmail = false;
  bool isLoading = false;
  String _recipientController = 'radautiulcivic@gmail.com';

  final _bodyController = TextEditingController(text: '',);
  final _nameController = TextEditingController(text: '',);
  final _emailController = TextEditingController(text: '',);
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }
  Function f1(){
    setState(() {
      _bodyController.text = '';
      _nameController.text = '';
      _emailController.text = '';
      isLoading = false;
    });
  }
  Function f2(){
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
            LoadMailer().functionMailer(_nameController, _recipientController, _bodyController, _emailController, _scaffoldKey, f1(), isLoading);
          }
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: NavDrawer(),
      appBar: AppBarModel()
          .loadAppBar(context, 'Contact', Icons.add_box_outlined, _scaffoldKey),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF38A49C)),),
            )
          : SingleChildScrollView(
              child: Column(
                children: [
                  WidgetContactModel().widgetTextFieldIcon(_nameController, Icon(Icons.person, color: Color(0x55FB6340), size: 20,), 'Nume și prenume:', _validateName, 'Nu ați introdus numele dvs.!'),
                  WidgetContactModel().widgetTextFieldIcon(_emailController, Icon(Ionicons.ios_mail, color: Color(0x55FB6340), size: 20,), 'Email:', _validateEmail, 'Nu ați introdus email dvs.!'),
                  WidgetContactModel().widgetTextField(_bodyController, 'Mesaj:', _validateDescription, 'Nu ați introdus un mesaj!'),
                  WidgetContactModel().widgetButton(f2(), context),
                ],
              ),
            ),
    );
  }
}
