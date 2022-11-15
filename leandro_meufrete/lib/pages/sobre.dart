import "package:flutter/material.dart";

class TelaSobre extends StatelessWidget {
  TelaSobre() : super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            padding: EdgeInsets.only(
              top: 10,
              right: 40,
              left: 40,
              ),
            child: ListView(children: [
              SizedBox(
                width: 128,
                height: 128,
                child: Center(
                  child: Image.asset('assets/imagens/truck4.png'),
                )
              ),
              SizedBox(                            
                height: 25,
              ),
              SizedBox(
                width: 128,
                height: 20,
                child: Text(
                  'Sobre o Aplicativo:',
                  style: TextStyle(
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                ),
              ),
              SizedBox(
                width: 128,
                height: 50,
                child: Center(
                  child: Text(
                    'O Aplicativo Meu Frete foi desenvolvido para ajudar no cálculo de gastos e lucros de pequenos fretes.',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 128,
                height: 20,
                child: Text(
                  'Objetivo:',
                  style: TextStyle(
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                ),
              ),
              SizedBox(
                width: 128,
                height: 65,
                child: Center(
                  child: Text(
                    'O objetivo é ajudar motoristas e prestadores de serviços autônomos que não tem opções de aplicativos simples e gratuitos para ajudar nos cálculos de pequenos fretes para previsionar gastos.',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 128,
                height: 20,
                child: Text(
                  'Desenvolvedor 1:',
                  style: TextStyle(
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                ),
              ),
              Container(
                width: 128,
                height: 200,
                //margin: EdgeInsets.all(20),
                child: Row(children: [
                  Container(
                    width: 160,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                                'Thiago Martins Menegusso, aluno da Fatec Ribeirão Preto do curso de Análise e Desenvolvimento de Sistemas período Noturno, natural de Curitiba - PR, residente em Ribeirão Preto - SP.'),
                          ]),
                    ),
                  Expanded(
                    child: Container(
                      width: 128,
                      child: Center(
                        child: Image.asset('assets/imagens/thiago_menegusso.png'), 
                    ),                   
                  ),
                  )
                ]),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 128,
                height: 20,
                child: Text(
                  'Desenvolvedor 2:',
                  style: TextStyle(
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                ),
              ),
              Container(
                width: 240,
                height: 128,
                //margin: EdgeInsets.all(20),
                child: Row(children: [
                  Container(
                      //padding: EdgeInsets.all(10),
                      width: 180,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('Leandro Roberto Batista, aluno da Fatec Ribeirão Preto do curso de Análise e Desenvolvimento de Sistemas periodo Noturno, natural e residente na cidade de Ribeirão Preto - SP'),
                          /*SizedBox(
                            height: 25,
                          ),*/
                        ],
                      ),
                    ),
                  Expanded(
                    child: Container(
                    width: 128,
                    child: Center(
                      child: Image.asset('assets/imagens/Leandro_Batista.jpg'),
                    ),
                  ),
                  )
                ]),
              ),
              SizedBox(
                height: 10,
              ),
              TextButton(
                child: Text(
                  'Menu Principal',
                  style: TextStyle(
                    color: Colors.blueAccent,
                    fontSize: 18,
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ])));
  }

  
}
