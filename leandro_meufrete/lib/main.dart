// ignore: avoid_web_libraries_in_flutter

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:leandro_meufrete/pages/editresultado.dart';
import 'package:leandro_meufrete/pages/resultado.dart';
import 'pages/cadastrotruck.dart';
import 'pages/menu.dart';
import 'pages/cadastro.dart';
import 'pages/login.page.dart';
import 'pages/sobre.dart';

Future<void> main() async {

  //Registrar o Firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'MeuFrete',
    initialRoute: '/login',
    routes: {
      '/login': (context) => LoginPage(),
      '/menu': (context) => MenuPrincipal(),
      '/cadtruck': (context) => CadastroTruck(),
      '/editresultado': (context) => EditResultado(),
      '/cadastro':(context) => CadastroUsuario(),
      '/sobre': (context) => TelaSobre(),
      '/resultado': (context) => Resultado()
    },


    
    theme: ThemeData(
        primaryColor: Colors.blue[900],
        backgroundColor: Colors.grey[100],
        fontFamily: 'Open Sans',
        textTheme: TextTheme(
          headline1: TextStyle(fontSize: 22, color: Colors.white, fontStyle: FontStyle.italic),
          headline2: TextStyle(fontSize: 18, color: Colors.blue[900])
        )
    )
  ));

  // 
  //Teste do Firesotre
  //
  /*var db = FirebaseFirestore.instance;

  db.collection('fretes').add(
    {
      'distancia' : 'Frete de 30 km',
      'preco'     : '40.00',
    }

  );*/
  

  
}

