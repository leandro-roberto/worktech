import "package:flutter/material.dart";
//import 'package:firebase_auth/firebase_auth.dart';
//import 'package:leandro_meufrete/pages/cadastrotruck.dart';
//import 'package:leandro_meufrete/pages/editresultado.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:math';


class ConsultaFrete extends StatefulWidget {
  final double pesototal;
  final double totalkm;
  final double qtdeDiesel;
  final double custoDiesel;
  final double pedagio;
  final double refeicao;
  final double manutencao;
  final double custofinal;
  final double valorfrete;
  final double precofinal;
  final double lucroliquido;
  final String nameFrete;

  ConsultaFrete(this.pesototal, this.totalkm, this.qtdeDiesel,this.custoDiesel, this.pedagio, this.refeicao, this.manutencao, this.custofinal, this.valorfrete, this.precofinal, this.lucroliquido, this.nameFrete);

  @override
  _ConsultaFreteState createState() => _ConsultaFreteState();
}
 
class _ConsultaFreteState extends State<ConsultaFrete> {
int codigo = 0;   
@override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(        
        padding: EdgeInsets.all(30),
          child: ListView(children: 
            [
              SizedBox(
                width: 128,
                  height: 128,
                  child: Center(
                    child: Image.asset('assets/imagens/truck2.png'),
                  )
              ),
              SizedBox(                            
                  height: 10,
              ),

              //formTexto('Nome do Frete', nomefrete),

              SizedBox(                            
                  height: 10,
              ),

              subTitulo('Detalhes dos Gastos:'),

              corpoTexto('Nome do Frete: ${widget.nameFrete}'),
              
              corpoTexto('Peso Total do Caminhão (incluindo a carga): ${widget.pesototal.toStringAsFixed(0)} toneladas'),

              corpoTexto('Total de Quilometros Rodados: ${widget.totalkm.toStringAsFixed(0)} quilometros'),

              corpoTexto('Total de Combustivel gastos no frete: ${widget.qtdeDiesel.toStringAsFixed(1)}'),

              corpoTexto('Valor gasto com Diesel no frete: R\$ ${widget.custoDiesel.toStringAsFixed(2)}'),

              corpoTexto('Valor gasto com Pedágios para o frete: R\$ ${widget.pedagio.toStringAsFixed(2)}'),

              corpoTexto('Valor gasto com Refeições para o frete: R\$ ${widget.refeicao.toStringAsFixed(2)}'),

              corpoTexto('Valor gasto com manutenções para o frete: R\$ ${widget.manutencao.toStringAsFixed(2)}'),

              corpoTexto('Custo de todos os gastos do Frete: R\$ ${widget.custofinal.toStringAsFixed(2)}'),

              corpoTexto('Valor cobrado pelo frete por tonelada: R\$ ${widget.valorfrete.toStringAsFixed(2)}'),

              SizedBox(
                height: 10,
              ),

              subTitulo('Total de Gastos:'),

              corpoTextoMaiorVermelho('R\$ ${widget.custofinal.toStringAsFixed(2)}'),

              SizedBox(
                height: 10,
              ),

              subTitulo('Ganhos:'),              

              corpoTexto('Valor Total do Frete:'),

              corpoTextoMaiorVerde('R\$ ${widget.precofinal.toStringAsFixed(2)}'),

              SizedBox(
                height: 10,
              ),

              subTitulo('Balanço Final (Lucro Liquido):'),

              corpoTexto('Lucro liquido do frete:'),

              corpoTextoMaiorVerde('R\$ ${widget.lucroliquido.toStringAsFixed(2)}'),

              TextButton(
                child: Text('Menu Principal',
                  style: TextStyle(
                  color: Colors.blueAccent,
                  fontSize: 16,
                  ),
                ),
                onPressed: (){
                  Navigator.pushNamed(context,'/menu');
                }, 
              ),

              SizedBox(
                height: 10,
              ),

              TextButton(
                child: Text(
                  'Salvar os valores do Frete realizado',
                  style: TextStyle(
                  color: Colors.blueAccent,
                  fontSize: 16,
                  ),
                ),
                onPressed: () {
                  setState(() {
                    String valordoFrete = 'Total: ${widget.precofinal.toStringAsFixed(2)} | Lucro: ${widget.lucroliquido.toStringAsFixed(2)}';
                                                            
                    if (codigo == 0){
                      final random = Random();
                      final randomNumber = random.nextInt(10000);
                      int codigo = randomNumber;

                      salvarBD(codigo, widget.nameFrete, valordoFrete);

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Dados Salvos com Sucesso!'),
                          duration: Duration(seconds: 2)
                        )
                      );
                    }
                    else{
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Usuário criado com sucesso'),
                          duration: Duration(seconds: 2)
                        )
                      );
                    }

                  });
                  
                },
              ),

              SizedBox(
                height: 10,
              ),

              TextButton(
                child: Text(
                  'Voltar à tela anterior',
                  style: TextStyle(
                  color: Colors.blueAccent,
                  fontSize: 16,
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context,'/cadtruck');
                },
              ),
            ]
          )
      )
    );
  }  

  Widget subTitulo(rotulo) {
    return SizedBox(
                width: 128,
                height: 20,
                child: Text(
                  rotulo,
                  style: TextStyle(
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                  ),
                ),
              );
  }

  salvarBD(codigo, nome, valor){
    var db = FirebaseFirestore.instance;

      db.collection('fretes').add(
        {
          'codigo'     : codigo,
          'nomefrete'  : nome,
          'valorfrete' : valor,
        }
      );
  }

 
  Widget corpoTexto(texto){
    return SizedBox(
                width: 128,
                height: 20,
                child: Text(
                    texto,
                    style: TextStyle(
                      fontSize: 12,
                    ),
                ),
    );
             
  }

  Widget corpoTextoMaiorVerde(variavel){
    return SizedBox(
                width: 128,
                height: 30,
                child: Text(
                    variavel,
                    style: TextStyle(
                    color: Colors.lightGreen,
                    fontWeight: FontWeight.w700,
                    fontSize: 30,
                  ),
                ),
    );
             
  }

  Widget corpoTextoMaiorVermelho(variavel){
    return SizedBox(
                width: 128,
                height: 30,
                child: Text(
                    variavel,
                    style: TextStyle(
                    color: Colors.redAccent,
                    fontWeight: FontWeight.w700,
                    fontSize: 30,
                  ),
                ),
    );
             
  }

 
  

  
}
