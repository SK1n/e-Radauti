import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
//import 'package:flutterapperadauti/notice_a_problem/smpt_server.dart';
import 'package:flutterapperadauti/state/loading_notifier.dart';
import 'package:flutterapperadauti/state/notice_problem_notifier.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';
import 'package:mailer/smtp_server/mailgun.dart';
import 'package:provider/provider.dart';

final databaseRef =
    FirebaseDatabase.instance.reference().child('Notice_Problem_Map');

Future<void> createMessage(BuildContext context, dynamic formKey) async {
  NoticeFormState noticeFormState =
      Provider.of<NoticeFormState>(context, listen: false);
  IsLoading isLoading = Provider.of<IsLoading>(context, listen: false);
  String institution = noticeFormState.institution;
  String name = noticeFormState.name;
  String body = noticeFormState.description;
  String number = noticeFormState.phoneNumber;
  String email = noticeFormState.email;
  Position position = noticeFormState.position;
  String textDescription;

  textDescription = ''' 
    Către, <b>$institution</b> ($institution) <br><br> Stimată doamnă/ Stimate domn,
        <br><br>Subsemnatul(a) $name, vă supun atenției următoarea problemă:<br><br>
        <i>$body</i><br><br>În conformitate cu atribuțiile pe care le aveți, vă rog să luați
         măsurile ce se impun.
    ''';
  position == null
      ? textDescription += ''' 
        <br><br>Prezenta sesizare reprezintă o petiție în sensul O.G. nr. 27/2002 privind activitatea de soluționare a petițiilor și 
        a fost transmisă <b>prin intermediul aplicației mobile e-Rădăuți</b>, dezvoltată
         de Asociația Rădăuțiul Civic, prin funcționalitatea „Sesizează o problemă”, 
        iar în cazul în care e-mail-ul nu conține numele și adresa de e-mail a petentului, aceasta poate fi clasată, potrivit O.G. 27/2002.
        <br><br>Vă rog să îmi transmiteți răspunsul în termenul legal la adresa $email
        .<br><br>Cu stimă,<br><br>
             <b>$name</b><br><br>     Tel: $number / $email
        '''
      : textDescription += ''' Cele sesizate sunt la următoarea adresă 
         Lat:${position.latitude}  Long:${position.longitude} 
         (<a href ='https://www.google.com/maps/place/${position.latitude.toString()}+${position.longitude.toString()}'>Adresa Google Maps</a>)<br><br></i>
        <br><br>
        Prezenta sesizare reprezintă o petiție în sensul O.G. nr. 27/2002 privind activitatea de soluționare a petițiilor și 
        a fost transmisă <b>prin intermediul aplicației mobile e-Rădăuți</b>, dezvoltată
         de Asociația Rădăuțiul Civic, prin funcționalitatea „Sesizează o problemă”, 
        iar în cazul în care e-mail-ul nu conține numele și adresa de e-mail a petentului, aceasta poate fi clasată, potrivit O.G. 27/2002.
        <br><br>Vă rog să îmi transmiteți răspunsul în termenul legal la adresa $email
        .<br><br>Cu stimă,<br><br>
             <b>$name</b><br><br>     Tel: $number / $email
        ''';
  sendMessage(textDescription, noticeFormState, isLoading, formKey);
}

Future<void> sendMessage(
    String textDescription,
    NoticeFormState noticeFormState,
    IsLoading isLoading,
    dynamic formKey) async {
  String username = 'eradautiapp@gmail.com';
  String password = 'e-Radauti123';

  // ignore: deprecated_member_use
  final smtp = gmail(username, password);
  // Create our message.
  final message = Message()
    ..from = Address(username, 'Radautiul Civic - @no-reply')
    ..recipients.add(noticeFormState.institution)
    //..bccRecipients.add(Address('radautiulcivic@gmail.com'))
    ..subject = 'Petiție ${noticeFormState.subject} - aplicația e-Rădăuți'
    ..html = textDescription;
  // formKey.currentState.fields['image'].value
  //     .forEach((value) => message.attachments.add(FileAttachment(value)));

  try {
    isLoading.changeLoadingState();
    await send(message, smtp).then((value) => {
          isLoading.changeLoadingState(),
          debugPrint('Message sent: ${value.toString()}')
        });

    // ignore: unnecessary_statements
    noticeFormState.position != null ? addToFirebase(noticeFormState) : null;
  } on MailerException catch (e) {
    isLoading.changeLoadingState();
    print('Message not sent.');
    for (var p in e.problems) {
      print('Problem: ${p.code}: ${p.msg}');
    }
  }
}

void addToFirebase(NoticeFormState noticeFormState) {
  Map<dynamic, dynamic> fbMap = {
    'title': noticeFormState.description.toString(),
    'lat': noticeFormState.position.latitude,
    'long': noticeFormState.position.longitude,
    'status': 'În lucru'
  };
  databaseRef.push().set(fbMap);
}
