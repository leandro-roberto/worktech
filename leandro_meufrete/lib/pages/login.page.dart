import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}


class _LoginPageState extends State<LoginPage> {
  
  var txtEmail = TextEditingController();
  var txtSenha = TextEditingController();
  bool isLoading = false;
  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(
          //top: 60,
          left: 40,
          right: 40,
        ),
          color: Colors.grey[100],
          child: ListView(children: <Widget>[
            SizedBox(
              width: 168,
              height: 64,
              child: Center(
                child: Text(
                  'Meu Frete',
                  style: TextStyle(
                    color: Colors.blueAccent,
                    fontFamily: 'Satisfy',
                    fontWeight: FontWeight.w500,
                    fontSize: 40,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 128,
              height: 168,
              //child: Icon(Icons.delivery_dining, size: 120, color: Colors.blueAccent),
              child: Center(
                child: Image.asset('assets/imagens/truck4.png'),
              )
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
                width: 128,
                height: 20,
                child: Center(
                  child: Text('Digite seu usuário e senha ou faça seu cadastro', 
                    style: TextStyle(
                    color: Colors.blueAccent,
                    //fontFamily: 'Satisfy',
                    //fontWeight: FontWeight.w500,
                    fontSize: 12,
                    ),
                  ),
                ),
            ),
          SizedBox(
            height: 10,
          ),
          /*TextFormField(
            autofocus: true,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              labelText: "Usuário",
              labelStyle: TextStyle(
                color: Colors.blueAccent,
                fontWeight: FontWeight.w400,
                fontSize: 16,
              )
            ),
            onChanged: (value) {
              tempUser = value.toString();
            },
          ),*/
          TextField(
              controller: txtEmail,
              style:
                  TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.w300),
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email), labelText: 'Email'),
          ),
          
          /*TextFormField(
            autofocus: true,
            keyboardType: TextInputType.text,
            obscureText: true,
            decoration: InputDecoration(
              labelText: "Senha",
              labelStyle: TextStyle(
                color: Colors.blueAccent,
                fontWeight: FontWeight.w400,
                fontSize: 16,
              )
            ),
            onChanged: (value) {
            tempPassword = value.toString();
            },
          ),
          */

          SizedBox(height: 20),
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
          Container(
            padding: EdgeInsets.all(5),
            margin: EdgeInsets.only
            (top: 10,
            left: 40,
            right: 40, 
                       
            ),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blueAccent, width: 4),
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              gradient: LinearGradient(
                colors: [Colors.blueAccent, Colors.greenAccent, Colors.black87],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
              // ignore: deprecated_member_use
            child: TextButton(
              child: Text(
                'LOGIN',
                style: TextStyle(
                  color: Colors.blueAccent,
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
              ),
              onPressed: () {
                setState(() {
                  isLoading = true;
                });
                login(txtEmail.text, txtSenha.text);
              }
              
              
            )
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 30,
            alignment: Alignment.center,
            child: TextButton(
              child: Text(
                "Clique aqui para cadastrar seu Usuário e Senha",
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/cadastro');                              
              }
            )
          )
        ]
      ),
    )
  );
    
  }

  void login(email, senha){

    FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email, password: senha).then((resultado){
        isLoading = false;
        
        Navigator.pushReplacementNamed(context, '/menu');
        
    }).catchError((erro){

      var mensagem = '';
      if (erro.code == 'user-not-found'){
        mensagem = 'ERRO: Usuário não encontrado.';
      }else if (erro.code == 'wrong-password'){
        mensagem = 'ERRO: Senha incorreta.';
      }else if (erro.code == 'invalid-email'){
        mensagem = 'ERRO: Email inválido.';
      }else{
        mensagem = 'ERRO: ${erro.message}';
      }
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('$mensagem'),
            duration: Duration(seconds: 2)
          )
        );
    });

  }
}
