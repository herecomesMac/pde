
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pde/utils/regions.dart';
import 'package:pde/utils/roletas_enum.dart';


class CurrentRound extends StatefulWidget {

  final int region;
  final int currentLucro;
  final Function(int, int) updateLucro;

  CurrentRound({@required this.region, @required this.currentLucro, @required this.updateLucro});

  @override
  _CurrentRoundState createState() => _CurrentRoundState();
}

class _CurrentRoundState extends State<CurrentRound> {

  String first_roleta;
  String second_roleta;
  double avarage2;
  double avarage1;
  int lucro_1;
  int lucro_2;
  List<String> roleta_1 = [];
  int roleta_2;
  double prob1_rolet1;
  double prob2_rolet1;
  double prob1_rolet2;
  double prob2_rolet2;

  _getInfo(){
  if(widget.region == 1){
      RegionOne regiao = new RegionOne();
      first_roleta = regiao.roleta_1.id;
      second_roleta = regiao.roleta_2.id;
    }else if(widget.region == 2){
      RegionTwo regiao = new RegionTwo();
      first_roleta = regiao.roleta_1.id;
      second_roleta = regiao.roleta_2.id;
    }else{
      RegionThree regiao = new RegionThree();      
      first_roleta = regiao.roleta_1.id;
      second_roleta = regiao.roleta_2.id;
    }
  }

  _calculateAvarage_2CurrentRound(){
    double avarage_2;
    double rolet1;
    double rolet2;
    if(widget.region == 1){
      RegionOne regiao = new RegionOne();
      rolet1 = regiao.roleta_2.probGoTo_1;
      rolet2 = regiao.roleta_2.probGoTo_2;
      avarage_2 = regiao.roleta_2.lucroGoTo_1 * regiao.roleta_2.probGoTo_1 + regiao.roleta_2.lucroGoTo_2 * regiao.roleta_2.probGoTo_2;
    }else if(widget.region == 2){
      RegionTwo regiao = new RegionTwo();
      rolet1 = regiao.roleta_2.probGoTo_1;
      rolet2 = regiao.roleta_2.probGoTo_2;
      avarage_2 = regiao.roleta_2.lucroGoTo_1 * regiao.roleta_2.probGoTo_1 + regiao.roleta_2.lucroGoTo_2 * regiao.roleta_2.probGoTo_2;
    }else{
      RegionThree regiao = new RegionThree();     
      rolet1 = regiao.roleta_2.probGoTo_1;
      rolet2 = regiao.roleta_2.probGoTo_2;
      avarage_2 = regiao.roleta_2.lucroGoTo_1 * regiao.roleta_2.probGoTo_1 + regiao.roleta_2.lucroGoTo_2 * regiao.roleta_2.probGoTo_2;
    }
    print("------------");
    print(avarage_2);
    setState((){
      prob1_rolet2 = rolet1;
      prob2_rolet2 = rolet2;
      avarage2 = (avarage_2 + widget.currentLucro); 
    });

  }
  _calculateAvarage_1CurrentRound(){
    double avarage_1;
    double rolet1;
    double rolet2;
    if(widget.region == 1){
      print("REGIÃO 1");
      RegionOne regiao = new RegionOne();
      rolet1 = regiao.roleta_1.probGoTo_1;
      rolet2 = regiao.roleta_1.probGoTo_2;
      avarage_1 = regiao.roleta_1.lucroGoTo_1 * regiao.roleta_1.probGoTo_1 + regiao.roleta_1.lucroGoTo_2 * regiao.roleta_1.probGoTo_2;
    }else if(widget.region == 2){
      RegionTwo regiao = new RegionTwo();
      rolet1 = regiao.roleta_1.probGoTo_1;
      rolet2 = regiao.roleta_1.probGoTo_2;
      avarage_1 = regiao.roleta_1.lucroGoTo_1 * regiao.roleta_1.probGoTo_1 + regiao.roleta_1.lucroGoTo_2 * regiao.roleta_1.probGoTo_2;
    }else{
      RegionThree regiao = new RegionThree();
      rolet1 = regiao.roleta_1.probGoTo_1;
      rolet2 = regiao.roleta_1.probGoTo_2;
      avarage_1 = regiao.roleta_1.lucroGoTo_1 * regiao.roleta_1.probGoTo_1 + regiao.roleta_1.lucroGoTo_2 * regiao.roleta_1.probGoTo_2;
    }
    print("------------");
    print(avarage_1);
    setState((){
      prob1_rolet1 = rolet1;
      prob2_rolet1 = rolet2;
      avarage1 = (avarage_1 + widget.currentLucro); 
    });
  }

  _calculateNextRegion(int roletaChosen){
    print("---------------------");
    print("SORTEIO");
    Random r = new Random();
    double minorProbability;
    if(roletaChosen == 1){
      minorProbability = (prob1_rolet1 < prob2_rolet1) ? prob1_rolet1 : prob2_rolet1;
    }else{
      minorProbability = (prob1_rolet2 < prob2_rolet2) ? prob1_rolet2 : prob2_rolet2;
    }
    print(minorProbability);
    double sorteio = r.nextDouble();
    print(sorteio);
    bool booleanResult = sorteio > minorProbability; 
    dynamic regiao;
    if(widget.region == 1){
       regiao = new RegionOne();
    }else if(widget.region == 2){
      regiao = new RegionTwo();
    }else{
      regiao = new RegionThree();
    }
    if(!booleanResult){
      print("HERE");
      int nextRegion;
      int lucro;
      if(roletaChosen == 1){
        nextRegion = (regiao.roleta_1.probGoTo_1 == minorProbability) ? regiao.roleta_1.canGoTo_1 : regiao.roleta_1.canGoTo_2;
        lucro = (regiao.roleta_1.probGoTo_1 == minorProbability) ? regiao.roleta_1.lucroGoTo_1 : regiao.roleta_1.lucroGoTo_2;
      }else{
        nextRegion = (regiao.roleta_2.probGoTo_1 == minorProbability) ? regiao.roleta_2.canGoTo_1 : regiao.roleta_2.canGoTo_2;
        lucro = (regiao.roleta_2.probGoTo_1 == minorProbability) ? regiao.roleta_2.lucroGoTo_1 : regiao.roleta_2.lucroGoTo_2;
      }
      print(lucro);
      print(nextRegion);
      widget.updateLucro(lucro, nextRegion);
    }else{
      int nextRegion;
      int lucro;
      print("ICI");
      if(roletaChosen == 1){
        nextRegion = (regiao.roleta_1.probGoTo_1 != minorProbability) ? regiao.roleta_1.canGoTo_1 : regiao.roleta_1.canGoTo_2;
        lucro = (regiao.roleta_1.probGoTo_1 != minorProbability) ? regiao.roleta_1.lucroGoTo_1 : regiao.roleta_1.lucroGoTo_2;
      }else{
        nextRegion = (regiao.roleta_2.probGoTo_1 != minorProbability) ? regiao.roleta_2.canGoTo_1 : regiao.roleta_2.canGoTo_2;
        lucro = (regiao.roleta_2.probGoTo_1 != minorProbability) ? regiao.roleta_2.lucroGoTo_1 : regiao.roleta_2.lucroGoTo_2;
      }
      print(lucro);
      print(nextRegion);
      widget.updateLucro(lucro, nextRegion);
    }
  
    print("---------------------");
    
  }

  @override
  Widget build(BuildContext context) {
    _getInfo();
    _calculateAvarage_2CurrentRound();
    _calculateAvarage_1CurrentRound();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
      body: Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [ 
          Align(
            alignment: Alignment.bottomCenter,
            child:
          Image.asset('assets/images/background.png'),),
          Positioned(
              left: 50,
              top: 100,
              child: 
          GestureDetector(
            onTap: (){
              //widget.updateLucro(avarage1);
              _calculateNextRegion(1);
              Navigator.pop(context);
            },
              child: Column(
                children: [
                  Text("Roleta " + first_roleta, style: TextStyle(color: Color.fromRGBO(86, 0, 232, 1), fontSize: 40),),
                  Text(avarage1.toString(), style: TextStyle(color: Color.fromRGBO(86, 0, 232, 1), fontWeight: FontWeight.bold, fontSize: 35),),
                  ]
                ),
            ),
          ),
          Positioned(
            right:50,
            bottom: 100,
            child:
          GestureDetector(
            onTap: (){
              //widget.updateLucro(avarage2);
              _calculateNextRegion(2);
              Navigator.pop(context);
            },
            child:
           Column(
              children: [
                Text("Roleta " + second_roleta, style: TextStyle(color:Colors.white, fontSize: 40),),
                Text(avarage2.toString(), style: TextStyle(color:Colors.white, fontWeight: FontWeight.bold, fontSize: 35),),
                ]
              ),
          ),
          ),
        ],
      ),
      ),
    );
  }
}