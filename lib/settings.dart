import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: GestureDetector(
          child: Icon(Icons.arrow_back, color: Color.fromRGBO(86, 0, 232, 1),),
          onTap: (){
            Navigator.pop(context);
          },
        ),

      ),
      body: 
      Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(20), 
              child: Text("Configurações do Jogo", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40, color: Color.fromRGBO(86, 0, 232, 1),)),                 
              ),
            Padding(padding: EdgeInsets.only(top: 20, left: 5, right: 5), child: _buildTable()),
            ],
            ),
    );
  }
  Widget _buildTable(){
    List<TableRow> rows = [];
    rows.add(TableRow(children: [
      Center(child: Text("Região".toUpperCase(), style: TextStyle(fontWeight: FontWeight.bold,color: Color.fromRGBO(86, 0, 232, 1))),),
      Center(child: Text("Roleta".toUpperCase(), style: TextStyle(fontWeight: FontWeight.bold,color: Color.fromRGBO(86, 0, 232, 1),)),),
      Center(child: Text("Prox. Região".toUpperCase(), textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,color: Color.fromRGBO(86, 0, 232, 1)),),),
      Center(child: Text("Chances ".toUpperCase(), style: TextStyle(fontWeight: FontWeight.bold,color: Color.fromRGBO(86, 0, 232, 1),),),),
      Center(child: Text("Lucro".toUpperCase(), style: TextStyle(fontWeight: FontWeight.bold,color: Color.fromRGBO(86, 0, 232, 1),),),),
    ]),);
    rows.add( TableRow(children: [ Center(child: Padding(padding: EdgeInsets.only(top:5), child: Text("I"))), Padding(padding: EdgeInsets.only(top:5), child: Center(child: Text("A"))), Padding(padding: EdgeInsets.only(top:5), child: Center(child: Text("I"))), Padding(padding: EdgeInsets.only(top:5), child: Center(child: Text('25%'))), Padding(padding: EdgeInsets.only(top:5), child: Center(child: Text('12'))),]),);
    rows.add( TableRow(children: [ Container(width: 0.0, height: 0.0,), Container(width: 0.0, height: 0.0,), Padding(padding: EdgeInsets.only(top:5), child: Center(child:Text("II"))), Padding(padding: EdgeInsets.only(top:5), child: Center(child:Text('75%'))), Padding(padding: EdgeInsets.only(top:5), child: Center(child:Text('4'))),]),);
    rows.add( TableRow(children: [ Container(width: 0.0, height: 0.0,), Padding(padding: EdgeInsets.only(top:5), child: Center(child:Text("B"))), Padding(padding: EdgeInsets.only(top:5), child: Center(child:Text("I"))), Padding(padding: EdgeInsets.only(top:5), child: Center(child:Text('16.5%'))), Padding(padding: EdgeInsets.only(top:5), child: Center(child:Text('0'))),]),);
    rows.add( TableRow(children: [ Container(width: 0.0, height: 0.0,), Container(width: 0.0, height: 0.0,), Padding(padding: EdgeInsets.only(top:5), child: Center(child:Text("III"))), Padding(padding: EdgeInsets.only(top:5), child: Center(child:Text('83.5%'))), Padding(padding: EdgeInsets.only(top:5), child: Center(child:Text('6'))),]),);
    rows.add( TableRow(children: [ Padding(padding: EdgeInsets.only(top:5), child: Center(child: Text("II"))), Padding(padding: EdgeInsets.only(top:5), child: Center(child: Text("C"))),Padding(padding: EdgeInsets.only(top:5), child: Center(child: Text("II"))), Padding(padding: EdgeInsets.only(top:5), child: Center(child: Text('50%'))), Padding(padding: EdgeInsets.only(top:5), child: Center(child: Text('10'))),]),);
    rows.add( TableRow(children: [ Container(width: 0.0, height: 0.0,), Container(width: 0.0, height: 0.0,), Padding(padding: EdgeInsets.only(top:5), child: Center(child:Text("I"))), Padding(padding: EdgeInsets.only(top:5), child: Center(child:Text('50%'))), Padding(padding: EdgeInsets.only(top:5), child: Center(child:Text('10'))),]),);
    rows.add( TableRow(children: [ Container(width: 0.0, height: 0.0,), Padding(padding: EdgeInsets.only(top:5), child: Center(child:Text("D"))), Padding(padding: EdgeInsets.only(top:5), child: Center(child:Text("II"))), Padding(padding: EdgeInsets.only(top:5), child: Center(child:Text('25%'))), Padding(padding: EdgeInsets.only(top:5), child: Center(child:Text('0'))),]),);
    rows.add( TableRow(children: [ Container(width: 0.0, height: 0.0,), Container(width: 0.0, height: 0.0,), Padding(padding: EdgeInsets.only(top:5), child: Center(child:Text("III"))), Padding(padding: EdgeInsets.only(top:5), child: Center(child:Text('75%'))), Padding(padding: EdgeInsets.only(top:5), child: Center(child:Text('12'))),]),);
    rows.add( TableRow(children: [ Center(child: Text("III")), Padding(padding: EdgeInsets.only(top:5), child: Center(child: Text("E"))),Padding(padding: EdgeInsets.only(top:5), child: Center(child: Text("III"))),Padding(padding: EdgeInsets.only(top:5), child:  Center(child: Text('75%'))), Padding(padding: EdgeInsets.only(top:5), child: Center(child: Text('8'))),]),);
    rows.add( TableRow(children: [ Container(width: 0.0, height: 0.0,), Container(width: 0.0, height: 0.0,), Padding(padding: EdgeInsets.only(top:5), child: Center(child:Text("I"))), Padding(padding: EdgeInsets.only(top:5), child: Center(child:Text('25%'))),Padding(padding: EdgeInsets.only(top:5), child:  Center(child:Text('36'))),]),);
    rows.add( TableRow(children: [ Container(width: 0.0, height: 0.0,), Padding(padding: EdgeInsets.only(top:5), child: Center(child:Text("F"))), Center(child:Text("III")), Padding(padding: EdgeInsets.only(top:5), child: Center(child:Text('50%'))), Padding(padding: EdgeInsets.only(top:5), child: Center(child:Text('16'))),]),);
    rows.add( TableRow(children: [ Container(width: 0.0, height: 0.0,), Container(width: 0.0, height: 0.0,), Padding(padding: EdgeInsets.only(top:5), child: Center(child:Text("II"))), Padding(padding: EdgeInsets.only(top:5), child: Center(child:Text('50%'))), Padding(padding: EdgeInsets.only(top:5), child: Center(child:Text('10'))),]),);



    return Table(
      border: TableBorder(
        verticalInside: BorderSide(
          color: Color.fromRGBO(86, 0, 232, 1),
          width: 1,
          style: BorderStyle.solid,
        ),
      ),
      children: rows,
    );
  }
}