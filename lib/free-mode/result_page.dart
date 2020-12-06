import 'package:flutter/material.dart';
import 'package:pde/home.dart';
import 'package:pde/free-mode/calculate_avarage_lucro.dart';


class ResultPage extends StatefulWidget {
  final double avarage;
  final int total;
  final List<BestRound> rounds;
  final List<int> roundsGotten;
  ResultPage({@required this.avarage, @required this.total, @required this.rounds, @required this.roundsGotten, Key key}) : super(key: key);

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  bool _visible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body:  Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).size.height/5, left: 50, right: 50),
        child:Center(
           child: Column(
             children: [
               Text("O lucro esperado ótimo era de " + widget.avarage.toStringAsFixed(2),softWrap: true, textAlign: TextAlign.center, style: TextStyle(fontSize: 20),),
               _buildTotal(),
               (_visible) ? _buildFinal() : Container(width: 0.0, height: 0.0,),
               (_visible) ? _buildBestWays() : Container(width: 0.0, height: 0.0),
               (_visible) ? 
               Padding(
                 padding: EdgeInsets.only(top: 80),
                 child: 
                GestureDetector(
                  child: Container( 
                    width: 200,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      border: Border.all(color: Colors.blue, width: 1),
                      borderRadius: BorderRadius.circular(4),
                      boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.4), spreadRadius: 3, blurRadius: 5,offset: Offset(0, 3))],
                    ),
                    child: Center(child: Text("Voltar ao início".toUpperCase(), style: TextStyle(color: Colors.white),)),
                  ),
                  onTap: (){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyHomePage()));
                  },
                )
               )
                : Container(width: 0.0, height: 0.0,),
             ],
           ),),
       ),
    );
  }

  _buildBestWays(){
    print(widget.roundsGotten.length);
    print(widget.rounds.length);
    List<String> bestWays = [];
    for(int i=0;i<widget.roundsGotten.length;i++){
      if(widget.roundsGotten[i] == 1){
        bestWays.add(widget.rounds[i].roleta_1);
      }else if(widget.roundsGotten[i] == 2){
        bestWays.add(widget.rounds[i].roleta_2);
      }else{
        bestWays.add(widget.rounds[i].roleta_3);
      }
    } 
    print(bestWays);
    return Column(
      children:[
        Padding(
          padding: EdgeInsets.only(top: 20),
          child: Text("O melhor caminho possível para suas jogadas eram: ", softWrap: true, textAlign: TextAlign.center, style: TextStyle(fontSize: 20),),
        ),
      Padding(
        padding: EdgeInsets.only(top: 20),
        child: Row(  
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //SizedBox(height: 20),
            Text(bestWays[0].toString(), softWrap: true, textAlign: TextAlign.center, style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
            Text(bestWays[1].toString(), softWrap: true, textAlign: TextAlign.center, style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
            Text(bestWays[2].toString(), softWrap: true, textAlign: TextAlign.center, style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
          ],
        ),
      ),
      ],
    );

  }

  _buildFinal(){
    if(widget.total.toDouble() < widget.avarage){
      return 
      Padding(
      padding: EdgeInsets.only(top: 30),
      child: 
      Center(
        child: Text("Você ficou abaixo do esperado! Mais sorte na próxima vez", softWrap: true, textAlign: TextAlign.center,style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 20),),
      ),
      );
    }else{
      return 
      Padding(
      padding: EdgeInsets.only(top: 30),
      child: 
      Center(
        child: Text("PARABÉNS! Seu lucro foi acima da média!", softWrap: true, textAlign: TextAlign.center, style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 20),),
      ),
      );
    }
  }

  _delayedAnimation() async {
    await Future.delayed(const Duration(seconds:3), (){
      setState((){
        _visible = true;
        });
    });
  }

  _buildTotal(){
    _delayedAnimation();
    return AnimatedOpacity(
      opacity: _visible ? 1.0 : 0.0,
      duration: Duration(milliseconds: 500),
      child:Center(
        child: Column( children: [
          Text("Seu total foi de: ", softWrap: true, textAlign: TextAlign.center,style: TextStyle(fontSize: 20)),
          Text(widget.total.toString(), softWrap: true, textAlign: TextAlign.center,style: TextStyle(fontSize: 80, fontWeight: FontWeight.bold)),
        ],
        ),
      ),
  );


  }
}