import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CadastroUsuario extends StatefulWidget {
  @override
  _CadastroUsuarioState createState() => _CadastroUsuarioState();
}


class _CadastroUsuarioState extends State<CadastroUsuario> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  var txtNome = TextEditingController();
  var txtEmail = TextEditingController();
  var txtSenha = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        padding: EdgeInsets.only(
          //top: 60,
          left: 40,
          right: 40,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Cadastro de Usuários',
              style: TextStyle(
                color: Colors.blueAccent,
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
            ),
            //Icone do usuario
            SizedBox(
              width: 128,
              height: 128,
              child: Icon(Icons.supervised_user_circle,
                  size: 120, color: Colors.blueAccent),
            ),
            TextField(
              controller: txtNome,
              style:
                  TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.w300),
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person), labelText: 'Nome'),
            ),
            
            SizedBox(
              height: 10,
            ),
            
            TextField(
              controller: txtEmail,
              style:
                  TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.w300),
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email), labelText: 'Email'),
            ),

            SizedBox(
              height: 10,
            ),

            TextField(
              obscureText: true,
              controller: txtSenha,
              style:
                  TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.w300),
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock), labelText: 'Senha'),
            ),
            
            SizedBox(
              height: 20,
            ),
            TextButton(
                child: Text(
                  'Clique aqui para enviar',
                  style: TextStyle(
                    color: Colors.blueAccent,
                    fontSize: 20,
                  ),
                ),
                onPressed: () {
                  criarConta(txtNome.text, txtEmail.text, txtSenha.text);
                }),
            SizedBox(
              height: 20,
            ),
            TextButton(
              child: Text(
                'Voltar à tela de login',
                style: TextStyle(
                  color: Colors.blueAccent,
                  fontSize: 20,
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            SizedBox(
              height: 60,
            ),
          ],
        ),
      ),
    );
  }
   //
  // CRIAR CONTA no Firebase Auth
  //
  void criarConta(nome, email, senha) {
    FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email, password: senha).then((resultado){

      //Armazenar dados adicionais no Firestore
      var db = FirebaseFirestore.instance;
      db.collection('usuarios').doc(resultado.user!.uid).set(
        {
          'nome'  : nome,
          'email' : email,
        }
      ).then((valor) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Usuário criado com sucesso'),
            duration: Duration(seconds: 2)
          )
        );
        Navigator.pop(context);
      });

    }).catchError((erro){
      if (erro.code == 'email-already-in-use'){
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('ERRO: O email informado já está em uso.'),
            duration: Duration(seconds: 2)
          )
        );
      }else{
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('ERRO: ${erro.message}'),
            duration: Duration(seconds: 2)
          )
        );
      }
    });


  }


}




