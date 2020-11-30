import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutterapperadauti/notice_a_problem/identify_destination.dart';
import 'package:flutterapperadauti/notice_a_problem/send_mail.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mailer/mailer.dart';

class LayoutNoticeProblem extends StatefulWidget {
  @override
  _LayoutNoticeProblemState createState() => _LayoutNoticeProblemState();
}

class _LayoutNoticeProblemState extends State<LayoutNoticeProblem> {
  final _formKey = GlobalKey<FormState>();
  String _name;
  String _subject;
  String _description;
  String _number;
  String _email;
  Position _position;
  String _destination;
  List<Attachment> _attachments;
  @override
  Widget build(BuildContext context) {
    return FormBuilder(
        key: _formKey,
        child: Column(
          children: [
            FormBuilderTextField(
              attribute: 'name',
              onChanged: (value) {
                _name = value;
                debugPrint('name value: $value');
              },
              validators: [
                FormBuilderValidators.required(),
              ],
            ),
            FormBuilderTextField(
              attribute: 'subject',
              onChanged: (value) {
                _subject = value;
                debugPrint('subject value: $value');
              },
              validators: [
                FormBuilderValidators.required(),
              ],
            ),
            FormBuilderTextField(
              attribute: 'description',
              onChanged: (value) {
                _description = value;
                debugPrint('description value: $value');
              },
              validators: [
                FormBuilderValidators.required(),
              ],
            ),
            FormBuilderTextField(
              attribute: 'number',
              onChanged: (value) {
                _number = value;
                debugPrint('number value: $value');
              },
              keyboardType: TextInputType.number,
              validators: [
                FormBuilderValidators.required(),
                FormBuilderValidators.numeric()
              ],
            ),
            FormBuilderTextField(
              attribute: 'email',
              onChanged: (value) {
                _email = value;
                debugPrint('email value: $value');
              },
              validators: [
                FormBuilderValidators.required(),
                FormBuilderValidators.email(),
              ],
            ),
            FormBuilderCheckbox(
              label: Text('Adăugați locația dvs. la email'),
              attribute: 'positionCheckBox',
              onChanged: (value) {
                if (value == true) {
                  getPosition();
                } else {
                  _position = null;
                }
                debugPrint('name value: $value');
              },
              validators: [],
            ),
            FormBuilderDropdown(
              attribute: 'destinationEmail',
              decoration: InputDecoration(labelText: 'Selectati destinatarul!'),
              onChanged: (value) {
                _destination = IdentifyDestination().identify(value);
                debugPrint('destination value: $_destination');
              },
              items: <String>[
                'Destinatar',
                'Primăria Rădăuți',
                'Servicii Comunale',
                'ACET Rădăuți',
                'Consiliul Județean Suceava',
                'Garda De Mediu Suceava',
                'Garda Forestieră Suceava',
                'Rădăuțiul Civic'
              ]
                  .map((emailDestination) => DropdownMenuItem(
                        value: emailDestination,
                        child: Text('$emailDestination'),
                      ))
                  .toList(),
            ),
            FlatButton(
                onPressed: () {
                  if (_position != null) {
                    SendEmailMailer().sendEmailWithLocation(
                        _name,
                        _destination,
                        _subject,
                        _description,
                        _position,
                        _email,
                        _number,
                        _attachments);
                  } else {
                    SendEmailMailer().sendEmailWithoutPosition(
                        _name,
                        _destination,
                        _subject,
                        _description,
                        _email,
                        _number,
                        _attachments);
                  }
                },
                child: Text('Send')),
          ],
        ));
  }
}

void getPosition() {}
