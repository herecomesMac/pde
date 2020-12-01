import 'dart:math';

import 'package:flutter/material.dart';


class FreeModePage extends StatefulWidget {
  final int totalRounds;

  FreeModePage({@required this.totalRounds});

  @override
  _FreeModePageState createState() => _FreeModePageState();
}

class _FreeModePageState extends State<FreeModePage> {
  int lno = 1;
  int rounds = 0;
  bool changed = false;
  void change(){
    setState(() {
      lno = Random().nextInt(3) + 1;
      changed = true;
    });
  }
  void changeRound(){
    setState((){
      rounds += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 150, left: 50, right: 50),
        child: Column(
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
            ),)
          ],
        ),
      ),
    );
  }

  Widget _buildRound(){
    int currentRound = rounds + 1;
    return Column(
      children: [
        Text(currentRound.toString() +"ª  JOGADA", textAlign: TextAlign.center, style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 50)),
        SizedBox(height: 10,),
        Text("Toque no dado para sortear sua região", textAlign: TextAlign.center,style: TextStyle(color: Colors.blue))
      ],
    );
  }
  //await Future.delayed(const Duration(seconds: 2), (){});

  /*_delayedAnimation() async {
    await Future.delayed(const Duration(seconds: 2), (){
      setState((){
        changed = true;
        });
    });
  }*/

  Widget _buildDice(){
    return Container(
      height: 150,
      width: 150,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue, width: 5),
        borderRadius: BorderRadius.circular(30),
      ),
      child: GestureDetector(
        child:  Image.asset('assets/images/dice$lno.png', width: 20, height: 20,),
        onTap: () {
          print("Change");
          change();
          //_delayedAnimation();
        },
    ));
  }

}