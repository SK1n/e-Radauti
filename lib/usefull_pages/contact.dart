import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapperadauti/usefull_pages/mailer_directory/mailer_file.dart';
import 'package:flutterapperadauti/usefull_pages/usefull_pages_widget/widget_contact_model.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutterapperadauti/widgets/src/appBarModelNew.dart';
import 'package:flutterapperadauti/widgets/src/loading_screen_ui.dart';
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

  @override
  void initState() {
    super.initState();
  }

  Widget widgetButton(_context) {
    return Container(
      margin: EdgeInsets.only(top: 20, left: 20, right: 20),
      width: MediaQuery.of(_context).size.width,
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
                  sendMail();
                }
              }
            }
          });
        },
        child: Text("Trimite"),
      ),
    );
  }

  void sendMail() async {
    var validate = await LoadMailer().tryLoadMailer(_nameController,
        _recipientController, _bodyController, _emailController);
    if (validate) {
      _scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text('"Mesaj trimis!"'),
      ));
      setState(() {
        _nameController.text = '';
        _emailController.text = '';
        _bodyController.text = '';
        isLoading = false;
      });
    } else {
      _scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text("Mesaj netrimis!"),
      ));
      isLoading = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: NavDrawer(),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            AppBarUi(
              content: 'Contact',
              leading: Icons.add_box_outlined,
              scaffoldKey: _scaffoldKey,
            )
          ];
        },
        body: isLoading
            ? LoadingScreen()
            : SingleChildScrollView(
                child: Column(
                  children: [
                    WidgetContactModel().widgetTextFieldIcon(
                        _nameController,
                        _validateName,
                        Icon(
                          Icons.person,
                          color: Color(0x55FB6340),
                          size: 20,
                        ),
                        'Nume și prenume:',
                        'Nu ați introdus numele dvs.!'),
                    WidgetContactModel().widgetTextFieldIcon(
                        _emailController,
                        _validateEmail,
                        Icon(
                          Ionicons.ios_mail,
                          color: Color(0x55FB6340),
                          size: 20,
                        ),
                        'Email:',
                        'Nu ați introdus emailul dvs.!'),
                    WidgetContactModel()
                        .widgetTextField(_bodyController, _validateDescription),
                    widgetButton(context),
                  ],
                ),
              ),
      ),
    );
  }
}
