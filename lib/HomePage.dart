import 'package:flutter/material.dart';
import 'LogIn.dart';
import 'SignIn.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Variables
  // Métodos

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Button 'LogIn'
            Padding(
              padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    print('Redirigiendo "LogIn"...');
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => const LogIn()));
                  },
                  child: const Text('Iniciar Sesión'),
                ),
              ),
            ),
            // Button 'SignIn'
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    print('Redirigiendo "SignIn"...');
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => const SignIn()));
                  },
                  child: const Text('Registrarse'),
                ),
              ),
            )
          ],
        ),
      ),

      /**
          body: Center(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
          const Text(
          'You have pushed the button this many times:',
          ),
          Text(
          'NN',
          style: Theme.of(context).textTheme.headline4,
          ),
          ],
          ),
          ),
       **/
    );
  }
}
