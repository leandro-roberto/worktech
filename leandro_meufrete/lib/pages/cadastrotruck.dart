import 'package:flutter/material.dart';
import 'package:leandro_meufrete/pages/consultafrete.dart';


class CadastroTruck extends StatefulWidget {
  @override
  _CadastroTruckState createState() => _CadastroTruckState();
}

var consumo = TextEditingController();
var vlrDiesel = TextEditingController();
var pesoCaminhao = TextEditingController();
var distanciaKM = TextEditingController();
var freteTonelada = TextEditingController();
var pescoCarga = TextEditingController();
var vlrPedagio = TextEditingController();
var vlrManutencao = TextEditingController();
var qtdeViagens = TextEditingController();
var vlrRefeicao = TextEditingController();
var nomeFrete = TextEditingController();

class _CadastroTruckState extends State<CadastroTruck> {

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: EdgeInsets.only(
            //top: 60,
            left: 40,
            right: 40,
          ),
          child: ListView(children: [
            SizedBox(
              height: 20,
            ),
            SizedBox(
                width: 128,
                height: 128,
                child: Center(
                  child: Image.asset('assets/imagens/truck3.png'),
                )
            ),
            Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 10,
                      ),

                      Text(
                        'Cadastro dos valores e dados do frete',
                        style: TextStyle(
                          color: Colors.blueAccent,
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      subTitulo('Dados do Caminhão', 40, 220),
                      SizedBox(
                        height: 10,
                      ),
                      //Row com os campos Peso e Carroceria
                      Row(children: [
                        formNumval('Peso Caminhão (Ton)', pesoCaminhao),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(child: 
                          formNumval('Custo Manutenção R\$', vlrManutencao),
                          )
                      ]),

                      SizedBox(
                        height: 10,
                      ),

                      //Row com os campos Consumo e Valor do Diesel
                      Row(children: [
                        formNumval('Consumo Caminhão Km/l', consumo),

                        SizedBox(
                          width: 10,
                        ),

                        Expanded(child: 
                          formNumval('Valor Diesel R\$', vlrDiesel),       
                        )
                      ]),

                      SizedBox(
                        height: 10,
                      ),

                      subTitulo('Dados do Frete', 40, 220),

                      SizedBox(
                        height: 10,
                      ),

                      //Row com o nome do frete
                      Row(children: [
                        formTexto('Nome do Frete', nomeFrete),
                                                
                      ]),

                      SizedBox(
                        height: 10,
                      ),

                      //Row com Distancia e valor do Frete por tonelada
                      Row(children: [
                        formNumval('Distancia Total em KM', distanciaKM),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(child: 
                          formNumval('Valor Frete / Ton R\$', freteTonelada),
                        )
                      ]),
                    
                      SizedBox(
                        height: 10,
                      ),
                      //Row com o peso da carga e Pedágio (se existir)
                      Row(children: [
                        formNumval('Peso da Carga (ton)',pescoCarga),

                        SizedBox(
                          width: 10,
                        ),

                        Expanded(child: 
                          formNumval('Valor Pedagio em R\$', vlrPedagio),
                        )
                      ]),

                      SizedBox(
                        height: 10,
                      ),
                      //Row com o peso da carga e Pedágio (se existir)
                      Row(children: [
                        formNumval('Quantidade de Viagens',qtdeViagens),

                        SizedBox(
                          width: 10,
                        ),

                        Expanded(child: 
                          formNumval('Valor Refeição', vlrRefeicao),
                        )
                      ]),
                     
                      SizedBox(
                        height: 40,
                      ),
                      
                      Container(
                        //padding: EdgeInsets.symmetric(vertical: 10),
                        width: double.infinity,
                        height: 40,
                        child: ElevatedButton(
                          child: Text('Salvar os Dados', style: TextStyle(fontSize: 18)),
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              setState(() {
                                // ignore: unnecessary_null_comparison
                                if (vlrPedagio == null){
                                  vlrPedagio = 0.0 as TextEditingController;
                                }

                                // ignore: unnecessary_null_comparison
                                if (vlrManutencao == null){
                                  vlrManutencao = 0.0 as TextEditingController;
                                }

                                // ignore: unnecessary_null_comparison
                                if (qtdeViagens == null){
                                  qtdeViagens = 1 as TextEditingController;
                                }

                                // ignore: unnecessary_null_comparison
                                if (vlrRefeicao == null){
                                  vlrRefeicao = 0.0 as TextEditingController;
                                }

                                // ignore: unnecessary_null_comparison
                                if(consumo == null || vlrDiesel == null || pesoCaminhao == null || distanciaKM == null || 
                                // ignore: unnecessary_null_comparison
                                freteTonelada == null || pescoCarga == null){
                                  caixaDialogo('Campos Obrigatórios não preenchidos', 'Favor preencher todos os campos obrigatórios para continuar');

                                }
                                else{

                                  double pcaminhao =
                                      double.parse(pesoCaminhao.text.replaceFirst(',', '.'));
                                  double ccaminhao =
                                      double.parse(consumo.text.replaceFirst(',', '.'));
                                  double valordiesel =
                                      double.parse(vlrDiesel.text.replaceFirst(',', '.'));
                                  double dfrete =
                                      double.parse(distanciaKM.text.replaceFirst(',', '.'));
                                  double valorfrete =
                                      double.parse(freteTonelada.text.replaceFirst(',', '.'));
                                  double pcarga =
                                      double.parse(pescoCarga.text.replaceFirst(',', '.'));
                                  double valorpedagio =
                                      double.parse(vlrPedagio.text.replaceFirst(',', '.'));
                                  double valormanut = 
                                      double.parse(vlrManutencao.text.replaceFirst(',', '.'));
                                  double valorrefeicao = 
                                      double.parse(vlrRefeicao.text.replaceFirst(',', '.'));
                                  double qtdedeviagens = 
                                      double.parse(qtdeViagens.text.replaceFirst(',', '.')); 
                                
                                  //realiza os calculos
                                                                   
                                  double totalKm = dfrete * qtdedeviagens;
                                  double pesoTotal = pcaminhao + pcarga;
                                  double qtdeDiesel  = totalKm / ccaminhao;
                                  double custoDiesel = qtdeDiesel * valordiesel;
                                  double totalPedagio = valorpedagio * qtdedeviagens;
                                  double totalRefeicao = valorrefeicao * qtdedeviagens;                              
                                  double precoFinal = (valorfrete * pcaminhao) * qtdedeviagens;
                                  double custoFinal = totalPedagio + totalRefeicao + custoDiesel + valormanut;
                                  double lucroLiquido = precoFinal - custoFinal;
                                  
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => ConsultaFrete(pesoTotal, totalKm, qtdeDiesel, custoDiesel, totalPedagio, totalRefeicao, valormanut, custoFinal, valorfrete, precoFinal, lucroLiquido, nomeFrete.text)));

                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                  content: Text('Dados Salvos com sucesso!'),
                                  duration: Duration(seconds: 2),
                                  ));
                                }
                              });
                            }
                          }
                        )
                      ),
                    
                      SizedBox(
                        height: 20,
                      ),

                      TextButton(
                        child: Text(
                          'Menu Principal',
                          style: TextStyle(
                            color: Colors.blueAccent,
                            fontSize: 16,
                          ),
                        ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                      ),
                    ]
                )
            ),
          ]
        )
      )  
    );
  }

  //Subtitulos
  Widget subTitulo(rotulo, altura, largura) {
    return Text(
      rotulo,
      style: TextStyle(
        color: Colors.blueAccent,
        fontWeight: FontWeight.w500,
        fontSize: 16,
      ),
    );
  }

//Forms de Numero com validação
  Widget formNumval(rotulo, variavel) {
    return Container(
        width: 200,
        child: TextFormField(
            controller: variavel,
            autocorrect: true,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: rotulo),
            validator: (value) {
              value = value!.replaceFirst(',', '.');
              if (double.tryParse(value) == null) {
                return 'Entre com um valor numérico';
              } else {
                return null;
              }
            }));
  }

  Widget formTexto(rotulo, variavel) {
      return Container(
        width: 300,
        child: TextFormField(
            controller: variavel,
            autocorrect: true,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: rotulo),
        )
      );
  }

  caixaDialogo(rotulo, msg) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(rotulo),
            content: Text(msg),
            actions: [
              TextButton(
                child: Text('Fechar'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  
}
