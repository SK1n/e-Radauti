import 'package:flutter/material.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

class LoadMailer{
  void functionMailer(childName, childRecipient, childBody, childEmail, childScaffoldKey, childFunction, childIsLoading) async {
    String username = 'radautiulcivic@gmail.com';
    String password = 'pass123.CIVIC';
    // ignore: deprecated_member_use
    final smtpServer = gmail(username, password);
    final message = Message()
      ..from = Address(username, childName.text)
      ..recipients.add(childRecipient)
      ..subject = ' Formularul de contact - aplicația e-Rădăuți'
      ..html = 'Către,     Rădăuțul civic<br><br>Stimată doamnă/ Stimate domn,<br><br>'
          'Subsemnatul/Subsemnata ${childName.text}, vă supun atenției următoarea problemă:<br><br>'
          '${childBody.text}<br><br>Prezentul e-mail reprezintă un mesaj transmis '
          'prin intermediul aplicației mobile e-Rădăuți, dezvoltată de Asociația Rădăuțiul Civic'
          ', prin funcționalitatea „Contact”.<br><br>Vă rog să îmi transmiteți răspunsul în termenul legal la adresa '
          '${childEmail.text}.<br><br>Cu stimă,<br><br>     ${childName.text}<br><br>'
          '     Email: ${childEmail.text}';
    try {
      final sendReport = await send(message, smtpServer);
      print('Mesaj trimis: ' + sendReport.toString());
      childScaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text("Mesaj trimis!"),
      ));
      childFunction;
    } on MailerException catch (e) {
      debugPrint('Mesajul nu a fost trimis.');
      // ignore: deprecated_member_use
      childScaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text("Mesaj netrimis!"),
      ));
      for (var p in e.problems) {
        debugPrint('Problem: ${p.code}: ${p.msg}');
      }
      childIsLoading = false;
    }
  }
}