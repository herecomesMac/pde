import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pde/free-mode/calculate_avarage_lucro.dart';
import 'package:pde/free-mode/current_round.dart';
import 'package:pde/free-mode/result_page.dart';


class FreeModePage extends StatefulWidget {
  final int totalRounds;

  FreeModePage({@required this.totalRounds});

  @override
  _FreeModePageState createState() => _FreeModePageState();
}

class _FreeModePageState extends State<FreeModePage> {
  List<int> roundsGotten = [];
  int lno = 1;
  int rounds = 0;
  int changingRound = 0;
  bool changed = false;
  Timer _timer;
  int _pos = 1;
  int currentRound = 0;
  bool dices = false;
  int lucro;
  int region; 

  @override
  void initState() {
    lucro = 0;
    super.initState();
  }

   @override
  void dispose() {
    _timer.cancel();
    _timer = null;
    super.dispose();
  }

  
  void change() async {
    await Future.delayed(const Duration(seconds: 1), (){
      setState((){
         lno = Random().nextInt(3) + 1;
         roundsGotten.add(lno);
         region = lno;
        });
    });
  }



  @override
  Widget build(BuildContext context) {
    CalculateAverageProfit profit = CalculateAverageProfit.calculateAvarageGame(widget.totalRounds);
    print(profit.avarage);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 150, left: 50, right: 50),
        child:
         (rounds < widget.totalRounds) ? Column(
          children: [
            Center(
              child: _buildRound(),
            ),
            SizedBox(height: 50),
            Center(
              child: _buildDice(),
            ),
            SizedBox(height: 100),
            AnimatedOpacity(opacity: changed ? 1.0 : 0.0 , 
            duration: Duration(milliseconds: 300),
            child: Center(
              child: Text("Região "+ lno.toString(), style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 30)),
            ),),
            SizedBox(height: 50),
            (rounds > 0) 
            ? Center( 
                child: GestureDetector(
                  child: Container( 
                    width: 200,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      border: Border.all(color: Colors.blue, width: 1),
                      borderRadius: BorderRadius.circular(4),
                      boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.4), spreadRadius: 3, blurRadius: 5,offset: Offset(0, 3))],
                    ),
                    child: Center(child: Text("Continuar".toUpperCase(), style: TextStyle(color: Colors.white),)),
                  ),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => CurrentRound(region: lno, currentLucro: lucro, updateLucro: _updateLucro,)));
                  },
                  
                ),
              ) : Container(width: 0.0, height: 0.0), 
          ],
        ) : 
        Padding(
          padding: EdgeInsets.only(top: 100),
          child: 
        Column(
          children: [
            Center(
              child: Text("Vamos ver seu resultado?!", textAlign: TextAlign.center, overflow: TextOverflow.clip, style: TextStyle(color: Color.fromRGBO(86, 0, 232, 1), fontWeight: FontWeight.bold, fontSize: 40),),
            ),
            SizedBox(height: 30,),
            Center(

          child: GestureDetector(
                  child: Container( 
                    width: 200,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      border: Border.all(color: Colors.blue, width: 1),
                      borderRadius: BorderRadius.circular(4),
                      boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.4), spreadRadius: 3, blurRadius: 5,offset: Offset(0, 3))],
                    ),
                    child: Center(child: Text("resultado".toUpperCase(), style: TextStyle(color: Colors.white),)),
                  ),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => 
                    ResultPage(total: lucro, avarage: profit.avarage, rounds: profit.bestOfRounds, roundsGotten: roundsGotten,)));
                  },
                  
                ),
          ),
        
          ],
        ),
        ),
      ),
    );
  }

  Widget _buildRound(){
    currentRound = rounds + 1;
    return Column(
      children: [
        Text(currentRound.toString() +"ª  JOGADA", textAlign: TextAlign.center, style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 50)),
        SizedBox(height: 10,),
        (rounds == 0) ? Text("Toque no dado para sortear sua região", textAlign: TextAlign.center,style: TextStyle(color: Colors.blue)) : Container(width: 0.0, height: 0.0),
      ],
    );
  }
  _delayedAnimation() async {
    await Future.delayed(const Duration(seconds:2), (){
      setState((){
        changed = true;
        changingRound += 1;
        });
    });
  }
  void _delayAnimationDissapear() async {
     setState(() {
      changed = false;
    });
  }

  _changingDices() async{
    setState(() {
      dices = true;
    });
    _timer = Timer.periodic(new Duration(milliseconds: 100), (Timer t) {
      setState(() {
        print("---------");
        print(_pos);
        _pos = Random().nextInt(3) + 1;
      });
    });
    await Future.delayed(const Duration(seconds: 2), (){
      setState((){
        dices = false;
        _timer.cancel();
        _timer = null;
        });
    });
  }
  _updateLucro(int l, int next){
    print("LUCRO QUE VOU SOMAR");
    print(l);
    setState((){
      lucro += l;
      rounds += 1;
      if(rounds < widget.totalRounds){roundsGotten.add(next);}  
      print("LUCRO AUMENTOU");
      print(lucro);
      lno = next;
    });
  }


  _goToRound() async {
     await Future.delayed(const Duration(seconds: 4), (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => CurrentRound(region: lno, currentLucro: lucro, updateLucro: _updateLucro,)));
    });
  }

  Widget _buildDice(){
    return Container(
      height: 150,
      width: 150,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue, width: 5),
        borderRadius: BorderRadius.circular(30),
      ),
      child:
      (rounds == 0) ?
       GestureDetector(
        child:  (dices) ? Image.asset('assets/images/dice$_pos.png', width: 20, height: 20,) : Image.asset('assets/images/dice$lno.png', width: 20, height: 20,),  
        onTap: () {
          _changingDices();
          _delayAnimationDissapear();
          print("Change");
          change();
          _delayedAnimation();
          _goToRound();
        },
    ) : 
    Image.asset('assets/images/dice$lno.png', width: 20, height: 20,),  
    ); 
  }
}