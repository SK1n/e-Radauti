import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

var sendEmailMailer = SendEmailMailer;

class SendEmailMailer {
  String username = 'radautiulcivic@gmail.com';
  String password = 'pass123.CIVIC';

  var message;
  void sendEmailWithLocation(
      String name,
      String destination,
      String subject,
      String body,
      Position position,
      String email,
      String number,
      List<Attachment> attachments,
      BuildContext context) async {
    message = Message()
      ..from = Address(username, name)
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
      ..attachments = attachments;
    tryToSendEmail(message);
  }

  void sendEmailWithoutPosition(
      String name,
      String destination,
      String subject,
      String body,
      String email,
      String number,
      List<Attachment> attachments,
      BuildContext context) async {
    message = Message()
      ..from = Address(username, name)
      ..recipients.add(destination)
      ..subject = ' Petiție $subject - aplicația e-Rădăuți'
      ..html = 'Către, $destination <br><br> Stimată doamnă/ Stimate domn,'
          '<br><br>Subsemnatul $name, vă supun atenției următoarea problemă:<br><br>'
          '$body<br><br>În conformitate cu atribuțiile pe care le aveți, vă rog să luați'
          ' măsurile ce se impun.<br><br>'
          'Prezenta sesizare reprezintă o petiție în sensul O.G. nr. 27/2002 privind activitatea de soluționare a petițiilor și '
          'a fost transmisă prin intermediul aplicației mobile e-Rădăuți, dezvoltată'
          ' de Ascociația Rădăuțiul Civic, prin funcționalitatea „Sesizează o problemă”.<br><br>'
          'Vă rog să îmi transmiteți răspunsul în termenul legal la adresa $email'
          '.<br><br>Cu stimă,<br><br>'
          '     $name<br><br>     Tel: $number/$email'
      ..attachments = attachments;
    tryToSendEmail(message);
  }

  Future<bool> tryToSendEmail(var message) async {
    final smtpServer = gmail(username, password);
    try {
      final sendReport = await send(message, smtpServer);
      debugPrint('Mesaj trimis: ' + sendReport.toString());
    } on MailerException catch (e) {
      debugPrint('mailerException: ${e.message}');
    }
  }
}
