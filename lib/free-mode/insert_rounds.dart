import 'package:flutter/material.dart';
import 'package:pde/free-mode/free_mode.dart';

class InsertRoundsPage extends StatefulWidget {
  @override
  _InsertRoundsPageState createState() => _InsertRoundsPageState();
}

class _InsertRoundsPageState extends State<InsertRoundsPage> {
  final myController = TextEditingController();
  int rounds;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
      body: Container(
      child: 
      Padding(
        padding: EdgeInsets.only(top: 300, left: 50, right: 50),
        child: Column(
        children: [
          Center(
            child: Text("Quantas jogadas serão feitas?", textAlign: TextAlign.center,style: TextStyle(color: Colors.blue, fontSize: 25)),
          ),
          SizedBox(height: 20,),
          Center(
            child: TextField(
              keyboardType: TextInputType.number,
              controller: myController,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(borderSide: const BorderSide(color: Colors.blue)),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.blue, width: 2),
                  borderRadius: BorderRadius.circular(4),
                ),
                
              ),
              onChanged: (value){
                setState((){
                  rounds = int.parse(value);
                });
              },
            ),
          ),
          SizedBox(height: 100),
          (rounds != null) ? Center( 
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
                Navigator.push(context, MaterialPageRoute(builder: (context) => FreeModePage(totalRounds: rounds,)));
              },
              
            ),
          ) : Container(),
        ],
      ),
      ),
      ),
    );
  }
}