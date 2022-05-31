import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'LogIn.dart';
import 'SignIn.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Inventario General',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''), // English, no country code
        Locale('es', ''), // Spanish, no country code
      ],
      home: const MyHomePage(title: 'Home'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
            Padding(padding: const EdgeInsets.only(top: 50,left: 20,right: 20),
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    print('Redirigiendo "LogIn"...');
                    Navigator.push(context,MaterialPageRoute(builder: (_)=> const LogIn()));
                  },
                  child: const Text('Iniciar Sesión'),
                ),
              ),
            ),
            // Button 'SignIn'
            Padding(padding: const EdgeInsets.only(top: 20,left: 20,right: 20),
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    print('Redirigiendo "SignIn"...');
                    Navigator.push(context, MaterialPageRoute(builder: (_)=> const SignIn()));
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
