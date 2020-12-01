import 'dart:async';
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
  Timer _timer;
  int _pos = 1;
  bool dices = false;

  @override
  void initState() {
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
        });
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

  _delayedAnimation() async {
    await Future.delayed(const Duration(seconds:2), (){
      setState((){
        changed = true;
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

  Widget _buildDice(){
    return Container(
      height: 150,
      width: 150,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue, width: 5),
        borderRadius: BorderRadius.circular(30),
      ),
      child: GestureDetector(
        child:  (dices) ? Image.asset('assets/images/dice$_pos.png', width: 20, height: 20,) : Image.asset('assets/images/dice$lno.png', width: 20, height: 20,),  
        onTap: () {
          _changingDices();
          _delayAnimationDissapear();
          print("Change");
          change();
          _delayedAnimation();
        },
    ));
  }
}