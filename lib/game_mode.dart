import 'package:flutter/material.dart';
import 'package:pde/free-mode/insert_rounds.dart';

class GameMode extends StatefulWidget {
  GameMode({Key key}) : super(key: key);

  @override
  _GameModeState createState() => _GameModeState();
}

class _GameModeState extends State<GameMode> {


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    print({width, height});
    return Scaffold(
      body: Padding( 
        padding: EdgeInsets.only(left: 100, right: 100, top: 200),
        child: Column(
            children: [
              Center(
                child: Container( 
                  height: 150, 
                  width: 150,
                  child: Hero(tag: 'dash',child: Image.asset('assets/images/stats.png'))), 
              ),
              SizedBox(height: 100),
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
                    child: Center(child: Text("Modo Livre".toUpperCase(), style: TextStyle(color: Colors.white),)),
                  ),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => InsertRoundsPage()));
                  },
                  
                ),
              ),
              SizedBox(height: 20),
              Center( 
                child: GestureDetector(
                  child: Container(
                    
                    width: 200,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.blue.withOpacity(.2),
                      border: Border.all(color: Colors.blue.withOpacity(.2), width: 1),
                      borderRadius: BorderRadius.circular(4),
                      boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.4), spreadRadius: 3, blurRadius: 5,offset: Offset(0, 3))],
                    ),
                    child: Center(child: Text("Jogador Sortudo".toUpperCase(), style: TextStyle(color: Colors.white),)),
                  ),
                  
                ),
                
              ),
              SizedBox(height: 20),
              Center( 
                child: GestureDetector(
                  child: Container(
                    
                    width: 200,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.blue.withOpacity(0.2),
                      border: Border.all(color: Colors.blue.withOpacity(.2), width: 1),
                      borderRadius: BorderRadius.circular(4),
                      boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.4), spreadRadius: 3, blurRadius: 5,offset: Offset(0, 3))],
                    ),
                    child: Center(child: Text("Jogador Azarado".toUpperCase(), style: TextStyle(color: Colors.white),)),
                  ),
                  onTap: (){

                  },
                  
                ),
              ),
            ],
      ),
      ),
      
    );
  }
}