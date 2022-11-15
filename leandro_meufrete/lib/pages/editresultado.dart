import 'package:cloud_firestore/cloud_firestore.dart';
import "package:flutter/material.dart";
import 'package:leandro_meufrete/pages/resultado.dart';


class EditResultado extends StatefulWidget {
  //final String nomeFrete;
  //final String valorFrete;

  //EditResultado(this.nomeFrete, this.valorFrete);

  @override
  _EditResultadoState createState() => _EditResultadoState();
}

class _EditResultadoState extends State<EditResultado> {
  var txtNomeFrete = TextEditingController();
  var txtValorFrete = TextEditingController();


  // RECUPERAR um documento pelo ID
  void getDocumentById(String id) async{

    await FirebaseFirestore.instance
      .collection('fretes').doc(id).get()
      .then((valor) {
        txtNomeFrete.text = valor.get('nomefrete');
        txtValorFrete.text = valor.get('valorfrete');
    });

  }

  @override
  Widget build(BuildContext context) {

    // RECUPERAR o ID do frete
    var id = ModalRoute.of(context)?.settings.arguments;

    if ( id != null){
      if (txtNomeFrete.text == '' && txtValorFrete.text == ''){
        getDocumentById(id.toString());
      }
    }else{
      //txtNomeFrete.text = widget.nomeFrete;
      //txtValorFrete.text = widget.valorFrete;

      var db = FirebaseFirestore.instance;

        if ( id == null){
          //
          // ADICIONAR um novo documento
          //
          db.collection('fretes').add(
            {
              'nomefrete'  : txtNomeFrete.text,
              'valorfrete' : txtValorFrete.text,
            }
          );
        }else{
        //
        // ATUALIZAR o documento
        //
          db.collection('fretes').doc(id.toString()).update(
            {
              'nomefrete'  : txtNomeFrete.text,
              'valorfrete' : txtValorFrete.text,
            }
          );
        }

        Navigator.push(context, MaterialPageRoute(builder: (context) => Resultado()),);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Alteração dos Resultados'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        automaticallyImplyLeading: false,
      ),
      //backgroundColor: Colors.blueAccent[50],
      body: Container(
        padding: EdgeInsets.all(30),
        child: ListView(children: [
          TextField(
            controller: txtNomeFrete,
            style: TextStyle(color: Colors.black, fontSize: 36),
            decoration: InputDecoration(
              labelText: 'Nome do Frete',
              labelStyle: TextStyle(color: Colors.black, fontSize: 22),
            ),
          ),
          SizedBox(height: 30),
          TextField(
            controller: txtValorFrete,
            style: TextStyle(color: Colors.black, fontSize: 36),
            decoration: InputDecoration(
              labelText: 'Valor do Frete',
              labelStyle: TextStyle(color: Colors.black, fontSize: 22),
            ),
          ),
          SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(5),
                width: 150,
                child: OutlinedButton(
                  child: Text('Alterar'),
                  onPressed: () {

                    var db = FirebaseFirestore.instance;

                    if ( id == null){
                      //
                      // ADICIONAR um novo documento
                      //
                      db.collection('fretes').add(
                        {
                          'nomefrete'  : txtNomeFrete.text,
                          'valorfrete' : txtValorFrete.text,
                        }
                      );
                    }else{
                      //
                      // ATUALIZAR o documento
                      //
                      db.collection('fretes').doc(id.toString()).update(
                        {
                          'nomefrete'  : txtNomeFrete.text,
                          'valorfrete' : txtValorFrete.text,
                        }
                      );
                    }

                    Navigator.pop(context);


                  },
                ),
              ),
              Container(
                padding: EdgeInsets.all(5),
                width: 150,
                child: OutlinedButton(
                  child: Text('Voltar'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}