import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutterapperadauti/widgets/src/appBarModel.dart';
import 'package:flutterapperadauti/widgets/src/nav_drawer.dart';
import 'package:flutterapperadauti/notice_a_problem/identify_destination.dart';
import 'package:flutterapperadauti/notice_a_problem/send_mail.dart';
import 'package:geolocator/geolocator.dart';

class LayoutNoticeProblem extends StatefulWidget {
  @override
  _LayoutNoticeProblemState createState() => _LayoutNoticeProblemState();
}

class _LayoutNoticeProblemState extends State<LayoutNoticeProblem> {
  final _formKey = GlobalKey<FormBuilderState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String _name;
  String _subject;
  String _description;
  String _number;
  String _email;
  String _institution;
  bool hasToggledPosition = false;
  Position _position;
  String _destination;
  List<dynamic> _attachments;
  bool isLoading = false;
  FocusNode focusNode;
  String errorRequired = 'Acest camp este obligatoriu!';
  String errorPhonePattern = '''Numarul introdus nu este formatat corect
      \nFormate acceptate:
      \n+40213-564-864
      \n+40213.564.864
      \n+40213 564 864
      \n0213-564-864
      \n0712456789''';
  String errorEmail =
      'Email-ul nu este intr-un format acceptat (abcdef@abc.abc)';
  @override
  void initState() {
    super.initState();
    focusNode = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBarModel().loadAppBar(
          context, 'Sesizează o problemă', Icons.announcement, _scaffoldKey),
      drawer: NavDrawer(),
      body: isLoading
          ? Container(
              alignment: Alignment.center,
              child: CupertinoActivityIndicator(),
            )
          : Container(
              padding: EdgeInsets.all(10),
              child: SingleChildScrollView(
                child: FormBuilder(
                    key: _formKey,
                    child: Column(
                      children: [
                        FormBuilderTextField(
                          decoration:
                              InputDecoration(hintText: 'Nume și prenume'),
                          attribute: 'name',
                          onChanged: (value) {
                            _name = value;
                            debugPrint('name value: $value');
                          },
                          validators: [
                            FormBuilderValidators.required(
                                errorText: errorRequired),
                          ],
                        ),
                        FormBuilderDropdown(
                          focusNode: focusNode,
                          initialValue: 'Institutia',
                          attribute: 'destinationEmail',
                          onChanged: (value) {
                            _institution = value;
                            _destination =
                                IdentifyDestination().identify(value);
                            debugPrint('destination value: $_destination');
                            focusNode.requestFocus();
                          },
                          items: <String>[
                            'Institutia',
                            'Primăria Rădăuți',
                            'Servicii Comunale',
                            'ACET Rădăuți',
                            'Consiliul Județean Suceava',
                            'Garda De Mediu Suceava',
                            'Garda Forestieră Suceava',
                            'Asociația Rădăuțiul Civic'
                          ]
                              .map((emailDestination) => DropdownMenuItem(
                                    value: emailDestination,
                                    child: Text('$emailDestination'),
                                  ))
                              .toList(),
                        ),
                        FormBuilderTextField(
                          decoration: InputDecoration(hintText: 'Subiect'),
                          attribute: 'subject',
                          onChanged: (value) {
                            _subject = value;
                            debugPrint('subject value: $value');
                          },
                          validators: [
                            FormBuilderValidators.required(
                                errorText: errorRequired),
                          ],
                        ),
                        FormBuilderTextField(
                          decoration: InputDecoration(hintText: 'Descriere'),
                          maxLines: 5,
                          attribute: 'description',
                          onChanged: (value) {
                            _description = value;
                            debugPrint('description value: $value');
                          },
                          validators: [
                            FormBuilderValidators.required(
                                errorText: errorRequired),
                          ],
                        ),
                        FormBuilderTextField(
                          decoration:
                              InputDecoration(hintText: 'Număr de telefon'),
                          attribute: 'number',
                          onChanged: (value) {
                            _number = value;
                            debugPrint('number value: $value');
                          },
                          keyboardType: TextInputType.number,
                          validators: [
                            FormBuilderValidators.required(
                                errorText: errorRequired),
                            FormBuilderValidators.numeric(
                                errorText:
                                    'Acest camp trebuie sa contina numai numere!'),
                            FormBuilderValidators.pattern(
                                r'^(\+4|)?(07[0-8]{1}[0-9]{1}|02[0-9]{2}|03[0-9]{2}){1}?(\s|\.|\-)?([0-9]{3}(\s|\.|\-|)){2}$',
                                errorText: errorPhonePattern)
                          ],
                        ),
                        FormBuilderTextField(
                          decoration: InputDecoration(hintText: 'Email'),
                          attribute: 'email',
                          onChanged: (value) {
                            _email = value;
                            debugPrint('email value: $value');
                          },
                          validators: [
                            FormBuilderValidators.required(
                                errorText: errorRequired),
                            FormBuilderValidators.email(errorText: errorEmail),
                          ],
                        ),
                        FormBuilderSwitch(
                          label: Row(
                            children: [
                              Icon(SimpleLineIcons.location_pin),
                              Text('Adăugați locația dvs. la email'),
                            ],
                          ),
                          attribute: 'positionSwitch',
                          onChanged: (value) async {
                            hasToggledPosition = value;
                            value = hasToggledPosition;
                          },
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 5),
                          child: Text(
                              'Pentru a putea verifica mai repede problema semnalizata avem nevoie de cel putin o imagine!'),
                        ),
                        FormBuilderImagePicker(
                          attribute: 'image',
                          onChanged: (value) {
                            _attachments = value;
                            debugPrint('attachments: $_attachments');
                          },
                          maxImages: 3,
                          defaultImage:
                              AssetImage('assets/images/icons8-plus-64.png'),
                          validators: [
                            FormBuilderValidators.required(
                                errorText: errorRequired),
                          ],
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: FlatButton(
                              onPressed: () async {
                                if (_formKey.currentState.validate()) {
                                  this.setState(() {
                                    isLoading = true;
                                  });
                                  if (hasToggledPosition == true) {
                                    if (await getPosition() ==
                                        true) if (await SendEmailMailer()
                                            .sendEmailWithLocation(
                                                _name,
                                                _destination,
                                                _institution,
                                                _subject,
                                                _description,
                                                _position,
                                                _email,
                                                _number,
                                                _attachments,
                                                context) ==
                                        false) {
                                      this.setState(() {
                                        isLoading = false;
                                      });
                                    }
                                  } else {
                                    if (await SendEmailMailer()
                                            .sendEmailWithoutPosition(
                                                _name,
                                                _destination,
                                                _institution,
                                                _subject,
                                                _description,
                                                _email,
                                                _number,
                                                _attachments,
                                                context) ==
                                        false) {
                                      this.setState(() {
                                        isLoading = false;
                                      });
                                    }
                                  }
                                }
                              },
                              color: Colors.blueAccent,
                              textColor: Colors.white,
                              child: Text('Send')),
                        ),
                      ],
                    )),
              ),
            ),
      floatingActionButton: FloatingActionButton(
        child: Icon(SimpleLineIcons.refresh),
        onPressed: () {
          hasToggledPosition = false;
          _formKey.currentState.reset();
        },
      ),
    );
  }

  Future<bool> getPosition() async {
    try {
      _position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

      return true;
    } on Exception catch (e) {
      showDialog(
          context: context,
          builder: (_) => CupertinoAlertDialog(
                title: Text('Eroare'),
                content: Text(
                    'Ne pare rau dar nu putem sa luam locatia dvs.\n Eroare:\n ${e.toString()}'),
                actions: [
                  CupertinoDialogAction(
                    child: Text('Ok'),
                    isDefaultAction: true,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )
                ],
              ));
      this.setState(() {
        hasToggledPosition = false;
        isLoading = false;
      });
      return false;
    }
  }
}
