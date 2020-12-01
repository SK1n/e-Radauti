import 'dart:ffi';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

var sendEmailMailer = SendEmailMailer;

class SendEmailMailer {
  String username = 'radautiulcivic@gmail.com'; //TODO add email address
  String password = 'pass123.CIVIC'; //TODO add email password
  List<Attachment> listAttachment;
  FileAttachment file1;
  FileAttachment file2;
  FileAttachment file3;
  CupertinoAlertDialog cupertinoAlertDialog;
  var message;
  void sendEmailWithLocation(
      String name,
      String destination,
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
      ..subject = ' Petiție $subject - aplicația e-Rădăuți'
      ..html = 'Către, $destination <br><br> Stimată doamnă/ Stimate domn,'
          '<br><br>Subsemnatul $name, vă supun atenției următoarea problemă:<br><br>'
          '$body<br><br>În conformitate cu atribuțiile pe care le aveți, vă rog să luați'
          ' măsurile ce se impun.<br><br> Cele sesizate sunt la următoarea adresă '
          ' Lat:${position.latitude.toString()} Long:${position.longitude.toString()}'
          "( <a href ='https://www.google.com/maps/place/${position.latitude.toString()}+${position.longitude.toString()}"
          "'>Adresa</a> )<br><br>"
          'Prezenta sesizare reprezintă o petiție în sensul O.G. nr. 27/2002 privind activitatea de soluționare a petițiilor și '
          'a fost transmisă prin intermediul aplicației mobile e-Rădăuți, dezvoltată'
          ' de Ascociația Rădăuțiul Civic, prin funcționalitatea „Sesizează o problemă”.<br><br>'
          'Vă rog să îmi transmiteți răspunsul în termenul legal la adresa $email'
          '.<br><br>Cu stimă,<br><br>'
          '     $name<br><br>     Tel: $number/$email'
      ..attachments = listAttachment;
    voidshowDialogAfterTringToSendEmail(context);
  }

  Future<bool> sendEmailWithoutPosition(
      String name,
      String destination,
      String subject,
      String description,
      String email,
      String number,
      List<dynamic> attachments,
      BuildContext context) async {
    changeListType(attachments);
    message = Message()
      ..from = Address(username, name)
      ..recipients.add(destination)
      ..subject = ' Petiție ${subject.toString()} - aplicația e-Rădăuți'
      ..html = 'Către, ${destination.toString()} <br><br> Stimată doamnă/ Stimate domn,'
          '<br><br>Subsemnatul ${name.toString()}, vă supun atenției următoarea problemă:<br><br>'
          '$description<br><br>În conformitate cu atribuțiile pe care le aveți, vă rog să luați'
          ' măsurile ce se impun.<br><br>'
          'Prezenta sesizare reprezintă o petiție în sensul O.G. nr. 27/2002 privind activitatea de soluționare a petițiilor și '
          'a fost transmisă prin intermediul aplicației mobile e-Rădăuți, dezvoltată'
          ' de Ascociația Rădăuțiul Civic, prin funcționalitatea „Sesizează o problemă”.<br><br>'
          'Vă rog să îmi transmiteți răspunsul în termenul legal la adresa $email'
          '.<br><br>Cu stimă,<br><br>'
          '     $name<br><br>     Tel: $number/$email'
      ..attachments = listAttachment;
    voidshowDialogAfterTringToSendEmail(context);
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
      listAttachment = [file1, null];
    }
  }

  void voidshowDialogAfterTringToSendEmail(BuildContext context) async {
    if (await tryToSendEmail(context) == true) {
      showDialog(
          context: context,
          child: CupertinoAlertDialog(
            title: Text('Trimis!'),
            content: Text('Email-ul a fost trimis cu succes!'),
            actions: [
              CupertinoDialogAction(
                child: Text('Okay'),
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
          child: CupertinoAlertDialog(
            title: Text('Eroare'),
            content: Text(
                'Ne pare rau a intervenit o eroare \nVa rugam sa incercati din nou!'),
            actions: [
              CupertinoDialogAction(
                child: Text('Okay'),
                isDefaultAction: true,
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          ));
    }
  }

  Future<bool> tryToSendEmail(BuildContext context) async {
    final smtpServer = gmail(username, password);
    try {
      final sendReport = await send(message, smtpServer);
      debugPrint('Message sent: ' + sendReport.toString());
    } on MailerException catch (e) {
      print('Message not sent.');
      for (var p in e.problems) {
        print('Problem: ${p.code}: ${p.msg}');
      }
      return false;
    }
    return true;
  }
}
