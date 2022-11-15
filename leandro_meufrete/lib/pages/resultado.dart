import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import 'package:leandro_meufrete/pages/model/frete.dart';

class Resultado extends StatefulWidget {
  @override
  _ResultadoState createState() => _ResultadoState();
}

class _ResultadoState extends State<Resultado> {

  //Referenciar a coleção nomeada "fretes"
  late CollectionReference fretes;

  @override
  void initState(){
    super.initState();
    fretes = FirebaseFirestore.instance.collection('fretes');
  }

  //Aparência do item do ListView
  Widget exibirDocumento(item){

    //Converter um DOCUMENTO em um OBJETO
    Frete frete = Frete.fromJson(item.data(), item.id);

    return Container(
      padding: EdgeInsets.all(5),
      child: ListTile(
        title: Text(frete.nomeFrete, style: TextStyle(fontSize: 24)),
        subtitle: Text('R\$ ${frete.valorFrete}', style: TextStyle(fontSize: 22)),
        trailing: IconButton(
          icon: Icon(Icons.delete),
          onPressed: (){
            //
            // Apagar um documento
            //
            fretes.doc(frete.id).delete();
          },
        ),

        onTap: (){
          Navigator.pushNamed(context,'/editresultado', arguments:frete.id);
        },

      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista dos Fretes Calculados'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: (){
              FirebaseAuth.instance.signOut();
              Navigator.pushReplacementNamed(context, '/login');
            }
          ),
        ],
      ),
      //backgroundColor: Colors.brown[50],

      //
      // EXIBIR os documentos da coleção de "fretes"
      //
      body: Container(
        padding: EdgeInsets.all(30),
        
        child: StreamBuilder<QuerySnapshot>(

          //fonte de dados
          stream: fretes.snapshots(),

          //definir a aparência dos documentos que serão exibidos
          builder: (context,snapshot){

            switch(snapshot.connectionState){

              case ConnectionState.none:
                return Center(child:Text('Erro ao conectar ao Firestore'));

              case ConnectionState.waiting:
                return Center(child: CircularProgressIndicator());

              default:
                final dados = snapshot.requireData;

                return ListView.builder(
                  itemCount: dados.size,
                  itemBuilder: (context, index){
                    return exibirDocumento(dados.docs[index]);
                  }
                );

            }
          }
        ),

      ),




      floatingActionButton: FloatingActionButton(
        foregroundColor: Colors.white,
        backgroundColor: Colors.black,
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, '/cadastro');
        },
      ),
    );
  }
}

