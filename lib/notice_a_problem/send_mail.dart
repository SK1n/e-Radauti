import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

var sendEmailMailer = SendEmailMailer;

class SendEmailMailer {
  String username = 'eradauti@radautiulcivic.ro';
  String password = 'Android.2018';
  List<Attachment> listAttachment;
  FileAttachment file1;
  FileAttachment file2;
  FileAttachment file3;
  CupertinoAlertDialog cupertinoAlertDialog;
  String _emailError;
  var message;
  // ignore: missing_return
  Future<bool> sendEmailWithLocation(
      String name,
      String destination,
      String institution,
      String subject,
      String body,
      Position position,
      String email,
      String number,
      List<dynamic> attachments,
      BuildContext context) async {
    changeListType(attachments);
    message = Message()
      ..from = Address(username, 'Radautiul Civic')
      ..recipients.add(destination)
      ..ccRecipients.add(email)
      ..subject = ' Petiție $subject - aplicația e-Rădăuți'
      ..html = 'Către, $institution($destination) <br><br> Stimată doamnă/ Stimate domn,'
          '<br><br><i>Subsemnatul(a) $name, vă supun atenției următoarea problemă:<br><br>'
          '$body<br><br>În conformitate cu atribuțiile pe care le aveți, vă rog să luați'
          ' măsurile ce se impun. Cele sesizate sunt la următoarea adresă '
          ' Lat:${position.latitude.toString()} Long:${position.longitude.toString()}'
          "( <a href ='https://www.google.com/maps/place/${position.latitude.toString()}+${position.longitude.toString()}"
          "'>Adresa Google Maps</a> )<br><br></i>"
          'Prezenta sesizare reprezintă o petiție în sensul O.G. nr. 27/2002 privind activitatea de soluționare a petițiilor și '
          'a fost transmisă prin intermediul aplicației mobile e-Rădăuți, dezvoltată'
          ' de Ascociația Rădăuțiul Civic, prin funcționalitatea „Sesizează o problemă”'
          'iar în cazul în care e-mail-ul nu conține numele și adresa de e-mail a petentului, aceasta poate fi clasată, potrivit O.G. 27/2002.'
          'Vă rog să îmi transmiteți răspunsul în termenul legal la adresa $email'
          '.<br><br>Cu stimă,<br><br>'
          '     $name<br><br>     Tel: $number / $email'
      ..attachments = listAttachment;
    if (await showDialogAfterTringToSendEmail(context, email) == false) {
      return false;
    }
  }

  // ignore: missing_return
  Future<bool> sendEmailWithoutPosition(
      String name,
      String destination,
      String institution,
      String subject,
      String description,
      String email,
      String number,
      List<dynamic> attachments,
      BuildContext context) async {
    changeListType(attachments);
    message = Message()
      ..from = Address(username)
      ..recipients.add(destination)
      ..subject = ' Petiție ${subject.toString()} - aplicația e-Rădăuți'
      ..html = 'Către, $institution(${destination.toString()}) <br><br> Stimată doamnă/ Stimate domn,'
          '<br><br>Subsemnatul(a) ${name.toString()}, vă supun atenției următoarea problemă:<br><br>'
          '$description<br><br>În conformitate cu atribuțiile pe care le aveți, vă rog să luați'
          ' măsurile ce se impun.<br><br>'
          'Prezenta sesizare reprezintă o petiție în sensul O.G. nr. 27/2002 privind activitatea de soluționare a petițiilor și '
          'a fost transmisă prin intermediul aplicației mobile e-Rădăuți, dezvoltată'
          ' de Ascociația Rădăuțiul Civic, prin funcționalitatea „Sesizează o problemă”.<br><br>'
          'Vă rog să îmi transmiteți răspunsul în termenul legal la adresa $email'
          '.<br><br>Cu stimă,<br><br>'
          '     $name<br><br>     Tel: $number/$email'
      ..attachments = listAttachment;
    if (await showDialogAfterTringToSendEmail(context, email) == false) {
      return false;
    }
  }

  void changeListType(initialList) {
    if (initialList.length == 3) {
      file1 = FileAttachment(initialList[0]);
      file2 = FileAttachment(initialList[1]);
      file3 = FileAttachment(initialList[2]);
      listAttachment = [file1, file2, file3];
    } else if (initialList.length == 2) {
      file1 = FileAttachment(initialList[0]);
      file2 = FileAttachment(initialList[1]);
      listAttachment = [file1, file2];
    } else {
      file1 = FileAttachment(initialList[0]);
      listAttachment = [file1];
    }
  }

  Future<bool> showDialogAfterTringToSendEmail(
      BuildContext context, email) async {
    if (await tryToSendEmail(context) == true) {
      showDialog(
          context: context,
          builder: (_) => CupertinoAlertDialog(
                title: Text('Email-ul a fost trimis cu succes!'),
                content: Text(
                    'Urmatorul pas este sa asteptati un email pe adresa $email'),
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
    } else {
      showDialog(
          context: context,
          builder: (_) => CupertinoAlertDialog(
                title: Text('Eroare'),
                content: Text(
                    'Ne pare rau a intervenit o eroare \nVa rugam sa incercati din nou!\n $_emailError'),
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
    }
    return false;
  }

  Future<bool> tryToSendEmail(BuildContext context) async {
    final smtpServerB = SmtpServer('mail.radautiulcivic.ro',
        password: '$password', port: 26, username: '$username');
    try {
      final sendReport = await send(message, smtpServerB);
      debugPrint('Message sent: ' + sendReport.toString());
    } on MailerException catch (e) {
      debugPrint('Message not sent.');
      for (var p in e.problems) {
        print('Problem: ${p.code}: ${p.msg}');
        _emailError = 'Problem: ${p.code}: ${p.msg}';
      }
      return false;
    }
    return true;
  }
}
