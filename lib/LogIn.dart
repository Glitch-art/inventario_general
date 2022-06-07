import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:inventario_general/InfoUser.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  LogInApp createState() => LogInApp();
}

class LogInApp extends State<LogIn> {
  // String formattedDate = DateFormat('dd/MM/yyyy').format(now);

  final firebase = FirebaseFirestore.instance;

  final controllerEmail = TextEditingController();
  final controllerPassword = TextEditingController();

  GetOptions? get usuario => null;

  final snackBar_Error = const SnackBar(
    content: Text('Email y/o contraseña invalidos!'),
    backgroundColor: Colors.red,
  );

  void buttonLogIn() async {
    firebase
        .collection("Users")
        .where("email", isEqualTo: controllerEmail.text)
        .get(usuario)
        .then(
          (res) => print("Successfully completed"),
          onError: (e) => print("Error completing: $e"),
        );
  }

  void verifyForm() async {
    try {
      // Colección Users
      var ref = firebase.collection('Users');
      QuerySnapshot users = await ref.get();

      // Hay documentos guardados?
      if (users.docs.length != 0) {
        // Hay documentos guardados en la coleccion
        print('Hay documentos almacenados');
        var aux = false;

        // Recorrer documentos en la coleccion 'Users'
        for (var doc in users.docs) {
          // Verificar email en la coleccion
          if (doc.get('email') == controllerEmail.text) {
            print('Email encontrado: ${controllerEmail.text}');
            // Verificar password
            if (doc.get('password') == controllerPassword.text) {
              aux = true;
              print('Password correcta');
              print('Nombre --> ${doc.get('name')}');
              print(doc.data());
              changePage(doc);
            }
          }
        }
        if (!aux) ScaffoldMessenger.of(context).showSnackBar(snackBar_Error);
      } else {
        // No hay documentos guardados en la coleccion
        print('No hay documentos en la coleccion "Users"');
      }
    } catch (e) {
      print('Error: ${e.toString()}');
    }
  }

  void changePage(QueryDocumentSnapshot<Object?> doc) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => InfoUser(doc)));
  }

  @override
  Widget build(BuildContext context) {
    const TextField_EdgeInsets = EdgeInsets.only(left: 20, top: 10, right: 20);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Iniciar Sesión'),
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
                controller: controllerEmail,
                autofocus: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    labelText: 'Email',
                    hintText: 'Escriba su Email'),
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
            // Button 'Iniciar Sesion'
            Padding(
              padding: const EdgeInsets.all(20),
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    print('Iniciando Sesión...');
                    verifyForm();
                  },
                  child: const Text('Iniciar Sesión'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
