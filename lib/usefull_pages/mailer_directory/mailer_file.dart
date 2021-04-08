import 'package:flutter/material.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

class LoadMailer {
  Future<bool> tryLoadMailer(_nameController, _recipientController,
      _bodyController, _emailController) async {
    String username = 'radautiulcivic@gmail.com';
    String password = 'pass123.CIVIC';
    // ignore: deprecated_member_use
    final smtpServer = gmail(username, password);
    final message = Message()
      ..from = Address(username, _nameController.text)
      ..recipients.add(_recipientController)
      ..subject = ' Formularul de contact - aplicația e-Rădăuți'
      ..html = 'Către,     Rădăuțul civic<br><br>Stimată doamnă/ Stimate domn,<br><br>'
          'Subsemnatul/Subsemnata ${_nameController.text}, vă supun atenției următoarea problemă:<br><br>'
          '${_bodyController.text}<br><br>Prezentul e-mail reprezintă un mesaj transmis '
          'prin intermediul aplicației mobile e-Rădăuți, dezvoltată de Asociația Rădăuțiul Civic'
          ', prin funcționalitatea „Contact”.<br><br>Vă rog să îmi transmiteți răspunsul în termenul legal la adresa '
          '${_emailController.text}.<br><br>Cu stimă,<br><br>     ${_nameController.text}<br><br>'
          '     Email: ${_emailController.text}';
    try {
      final sendReport = await send(message, smtpServer);
      debugPrint('Mesaj trimis: ' + sendReport.toString());
    } on MailerException catch (e) {
      debugPrint('Mesajul nu a fost trimis.');
      for (final p in e.problems) {
        debugPrint('Problema: ${p.code}: ${p.msg}');
      }
      return false;
    }
    return true;
  }
}
