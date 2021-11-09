class Emergence{

   String emergence;
  final String emergenceId;

  Emergence({this.emergence,this.emergenceId});


  Map<String, dynamic>toMap(){
    return{
      "emergenceId":emergenceId,
      'emergence':emergence,
    };
  }

 

}