class Frete{

  late String id;
  late String nomeFrete;
  late String valorFrete;


  //Construtor
  Frete(this.id, this.nomeFrete, this.valorFrete);

  //Converter um DOCUMENTO em um OBJETO
  Frete.fromJson(Map<String,dynamic>mapa, String id){
    this.id = id;
    this.nomeFrete = mapa["nomefrete"];
    this.valorFrete = mapa['valorfrete'];
  }

  //Converter um OBJETO em um DOCUMENTO
  Map<String,dynamic> toJson(){
    return {
      'id'    : this.id,
      'nomefrete'  : this.nomeFrete,
      'valorfrete' : this.valorFrete
    };
  }

}
