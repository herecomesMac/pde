import 'package:flutter/material.dart';
import 'package:pde/game_mode.dart';
import 'package:pde/how_page.dart';
import 'package:pde/settings.dart';


class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
      

    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(padding: EdgeInsets.only(right: 15), 
            child: GestureDetector(child: Icon(Icons.settings, color: Colors.blue,), onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsPage()));
            },),),
        ],
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
      body: Padding( 
        padding: EdgeInsets.all(100),
        child: Column(
            children: [
              Center(
                child: Container( 
                  height: 300,
                  width: 300,
                  child: Hero(tag: 'dash',child: Image.asset('assets/images/stats.png'))), 
              ),
              SizedBox(height: 50),
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
                    child: Center(child: Text("Começar".toUpperCase(), style: TextStyle(color: Colors.white),)),
                  ),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => GameMode()));
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
                      color: Colors.blue,
                      border: Border.all(color: Colors.blue, width: 1),
                      borderRadius: BorderRadius.circular(4),
                      boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.4), spreadRadius: 3, blurRadius: 5,offset: Offset(0, 3))],
                    ),
                    child: Center(child: Text("Como funciona".toUpperCase(), style: TextStyle(color: Colors.white),)),
                  ),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => HowPage()));
                  },
                  
                ),
              ),
            ],
      ),
      ),
      
    );
  }
}