import 'package:flutter/material.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  LogInApp createState() => LogInApp();
}

class LogInApp extends State<LogIn>{
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
            Padding(padding: const EdgeInsets.only(top: 25),
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
            Padding(padding: TextField_EdgeInsets,
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)
                  ),
                  labelText: 'Usuario',
                  hintText: 'Digite su Usuario'
                ),
              ),
            ),
            // TextField 'Contraseña'
            Padding(padding: TextField_EdgeInsets,
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)
                    ),
                    labelText: 'Contraseña',
                    hintText: 'Digite su Contraseña'
                ),
              ),
            ),
            // Button 'Iniciar Sesion'
            Padding(padding: const EdgeInsets.all(20),
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    print('Iniciando Sesión...');
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