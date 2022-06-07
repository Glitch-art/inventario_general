import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class InfoUser extends StatelessWidget {
  const InfoUser(this.doc, {Key? key}) : super(key: key);

  final QueryDocumentSnapshot<Object?> doc;

  @override
  Widget build(BuildContext context) {
    
    Timestamp time = doc.get('user_birthday');
    DateTime user_birthday =
        DateTime.fromMicrosecondsSinceEpoch(time.microsecondsSinceEpoch);
    String datetime =
        user_birthday.day.toString() + "/" +
        user_birthday.month.toString() + "/" +
        user_birthday.year.toString();

    var texto = Theme.of(context).textTheme.bodyLarge;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Información Usuario'),
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            // Button 'Iniciar Sesion'
            Padding(
              padding: const EdgeInsets.all(20),
              child: Center(
                  child: Text(
                '${doc.get('name')}',
                style: texto,
              )),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Center(
                  child: Text(
                '${doc.get('email')}',
                style: texto,
              )),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Center(
                  child: Text(
                '${doc.get('document')}',
                style: texto,
              )),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Center(
                  child: Text(
                    datetime,
                textAlign: TextAlign.center,
                style:
                    new TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0),
              )),
            ),
          ]),
        ));
  }
}
