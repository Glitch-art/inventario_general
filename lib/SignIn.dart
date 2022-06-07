import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:date_field/date_field.dart';
import 'package:intl/intl.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  SignInApp createState() => SignInApp();
}

class SignInApp extends State<SignIn> with SingleTickerProviderStateMixin {
  late AnimationController controller;

  // TextEditingController controllerUsuario = TextEditingController();
  DateTime now = DateTime.now();

  final firebase = FirebaseFirestore.instance;

  final controllerEmail = TextEditingController();
  final controllerName = TextEditingController();
  final controllerDocument = TextEditingController();
  final controllerPassword = TextEditingController();

  late DateTime selectedData;

  final snackBar_Good = const SnackBar(
    content: Text('Registrado con éxito!'),
    backgroundColor: Colors.green,
  );

  final snackBar_Error = const SnackBar(
    content: Text('Registrado con éxito!'),
    backgroundColor: Colors.red,
  );

  void buttonSignIn() async {
    Timestamp userBirth = Timestamp.fromDate(selectedData); //To TimeStamp

    try {
      await firebase.collection('Users').doc().set({
        "email": controllerEmail.text,
        "name": controllerName.text,
        "document": controllerDocument.text,
        "password": controllerPassword.text,
        "user_birthday": userBirth,
      });
      if (kDebugMode) {
        print('Email: ${controllerEmail.text}\n'
            'Name: ${controllerName.text}\n'
            'Document: ${controllerDocument.text}\n'
            'Password: ${controllerPassword.text}\n'
            'user_birthday: $selectedData\n'
            'FechaActual: $now');
      }
      controllerEmail.clear();
      controllerName.clear();
      controllerDocument.clear();
      controllerPassword.clear();

      ScaffoldMessenger.of(context).showSnackBar(snackBar_Good);
    } catch (e) {
      if (kDebugMode) {
        print('Error: $e');
      }
      ScaffoldMessenger.of(context).showSnackBar(snackBar_Error);
    }
  }

  @override
  Widget build(BuildContext context) {
    const TextField_EdgeInsets = EdgeInsets.only(left: 20, top: 10, right: 20);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Registrarse'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Imagen
            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Center(
                child: SizedBox(
                  width: 100,
                  height: 100,
                  child: Image.asset('images/user.png'),
                  // Attribution: "https://www.flaticon.com/free-icons/user" User icons created by Freepik - Flaticon
                ),
              ),
            ),
            // TextField 'email'
            Padding(
              padding: TextField_EdgeInsets,
              child: TextField(
                autofocus: true,
                controller: controllerEmail,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    labelText: 'Email',
                    hintText: 'Escriba su Email'),
              ),
            ),
            // TextField 'Name'
            Padding(
              padding: TextField_EdgeInsets,
              child: TextField(
                controller: controllerName,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    labelText: 'Nombre',
                    hintText: 'Escriba su nombre completo'),
              ),
            ),
            // TextField 'Documento'
            Padding(
              padding: TextField_EdgeInsets,
              child: TextField(
                controller: controllerDocument,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    labelText: 'Documento',
                    hintText: 'Digite su documento'),
              ),
            ),
            // TextField 'Contraseña'
            Padding(
              padding: TextField_EdgeInsets,
              child: TextField(
                controller: controllerPassword,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    labelText: 'Contraseña',
                    hintText: 'Digite su Contraseña'),
                obscureText: true,
              ),
            ),
            // TextField 'Fecha de Nacimiento'
            Padding(
              padding: TextField_EdgeInsets,
              child: DateTimeFormField(
                onDateSelected: (DateTime value) {
                  setState(() {
                    selectedData = value;
                  });
                },
                mode: DateTimeFieldPickerMode.date,
                lastDate: DateTime.now(),
                dateFormat: DateFormat('dd/MM/yyyy'),
                decoration: InputDecoration(
                  hintText: 'Digite su fecha de nacimiento',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  labelText: 'Fecha de Nacimiento',
                ),
              ),
            ),
            // Button 'Registrarse'
            Padding(
              padding: const EdgeInsets.all(20),
              child: Center(
                child: ElevatedButton(
                  onPressed: () => {buttonSignIn()},
                  child: const Text('Registrarse'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
