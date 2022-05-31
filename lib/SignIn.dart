import 'package:flutter/material.dart';
import 'package:date_field/date_field.dart';
import 'package:intl/intl.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  SignInApp createState() => SignInApp();
}

class SignInApp extends State<SignIn> {
  // TextEditingController controllerUsuario = TextEditingController();
  DateTime now = DateTime.now();

  final controllerUsuario = TextEditingController();
  final controllerDocumento = TextEditingController();
  final controllerContrasena = TextEditingController();
  late DateTime selectedData;



  @override
  Widget build(BuildContext context) {
    const TextField_EdgeInsets = EdgeInsets.only(left: 20, top: 10, right: 20);
    String formattedDate = DateFormat('dd/MM/yyyy').format(now);
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
            // TextField 'Usuario'
            Padding(
              padding: TextField_EdgeInsets,
              child: TextField(
                controller: controllerUsuario,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    labelText: 'Usuario',
                    hintText: 'Digite su Usuario'),
              ),
            ),
            // TextField 'Documento'
            Padding(
              padding: TextField_EdgeInsets,
              child: TextField(
                controller: controllerDocumento,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    labelText: 'Documento',
                    hintText: 'Digite su Documento'),
              ),
            ),
            // TextField 'Contraseña'
            Padding(
              padding: TextField_EdgeInsets,
              child: TextField(
                controller: controllerContrasena,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    labelText: 'Contraseña',
                    hintText: 'Digite su Contraseña'),
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
                  onPressed: () {
                    print('Registrándose...');
                    print('Usuario: ${controllerUsuario.text}\n'
                        'Documento: ${controllerDocumento.text}\n'
                        'Contraseña: ${controllerContrasena.text}\n'
                        'FechaNacimiento: $selectedData\n'
                        'FechaActual: $now\n'
                        'FechaActualFormato: $formattedDate');
                    controllerUsuario.clear();
                    controllerDocumento.clear();
                    controllerContrasena.clear();
                  },
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
