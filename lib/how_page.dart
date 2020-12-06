

import 'package:flutter/material.dart';

class HowPage extends StatefulWidget {
  HowPage({Key key}) : super(key: key);

  @override
  _HowPageState createState() => _HowPageState();
}

class _HowPageState extends State<HowPage> {
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
       SingleChildScrollView(
         physics: BouncingScrollPhysics(),
         child: 
       Column(
         mainAxisAlignment: MainAxisAlignment.start,
         crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(padding:EdgeInsets.only(top: 20, left: 20), child: Text("O Início", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40, color: Color.fromRGBO(86, 0, 232, 1),),)),
          Padding(padding: EdgeInsets.all(20), child: Text("Haverá 3 regiões: Região I, Região II e Região III. Dentro de cada região há duas Roletas. Dentro da Região I, há a Roleta A e a Roleta B, por exemplo. Você começará jogando um dado para saber em qual região irá cair inicialmente, depois você terá que escolher uma das Roletas da Região sorteada. Embaixo do nome da Roleta haverá a média de lucro que você poderá ganhar escolhendo-a. Mas isso não quer dizer que você ganhará a média, pois em cada Roleta há duas opções: Você pode continuar na Região em que se encontra ou ir para uma Região diferente, mas isso fica ao acaso! Você não vai poder escolher para qual Região ir. Cada opção de destino há uma probabilidade! Se você cair na Região I e escolher a Roleta A, você terá 25% de chance de continuar na Região I ou 75% de chance de ir para a Região II.", 
          softWrap: true, textAlign: TextAlign.left, overflow: TextOverflow.clip,),),
          Padding(padding: EdgeInsets.all(20), child: Text("Para melhorar o jogo (e não deixá-lo rolando para sempre), antes de tudo você escolherá quantas rodadas vai querer jogar e isso fica a seu critério. Se quiser jogar 100 rodadas, boa sorte!", 
          softWrap: true, textAlign: TextAlign.left, overflow: TextOverflow.clip,),),
          Padding(padding:EdgeInsets.only(top: 20, left: 20), child: Text("Acabou o jogo", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40, color: Color.fromRGBO(86, 0, 232, 1),),)),
          Padding(padding: EdgeInsets.all(20), child: Text("Quando todas as rodadas acabarem, você poderá ver qual era o lucro médio ótimo para o cenário em que se encontra, e verá o lucro que você conseguiu. Além disso, também poderá ver quais eram as melhores roletas a serem escolhidas para o seu caso específico! E claro, te diremos se você é uma pessoa azarada por ficar abaixo da média ou uma pessoa sortuda que está rica!", 
          softWrap: true, textAlign: TextAlign.left, overflow: TextOverflow.clip,),),
          Padding(padding:EdgeInsets.only(top: 20, left: 20), child: Text("Como?!", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40, color: Color.fromRGBO(86, 0, 232, 1),),)),
          Padding(padding: EdgeInsets.only(top: 20, left:20, right: 20), child: Text("Antes do jogo começar, através da Programação Dinâmica Estocástica, as melhores escolhas e a média do lucro ótimo são calculados para a quantidade de rodadas que você setou. A Programação Dinâmica Estocástica (PDE) consiste em um processo sequencial de tomada de decisões, onde uma decisão ótima global pode ser obtida através da otimização de subproblemas (ou ótimos locais) individuais, isto é, a PDE pode ter alguns elementos determinísticos, tais como o estado inicial ou o resultado de algumas decisões. Uma mudança de estado no PDE envolve duas fases:", 
          softWrap: true, textAlign: TextAlign.left, overflow: TextOverflow.clip,),),
          Padding(padding: EdgeInsets.only(left: 30, right: 20), child: Text("Decisão", 
          softWrap: true, textAlign: TextAlign.left, overflow: TextOverflow.clip,),),
          Padding(padding: EdgeInsets.only(left: 30, right: 20), child: Text("Resultado aleatório de decisão tomada", 
          softWrap: true, textAlign: TextAlign.left, overflow: TextOverflow.clip,),),
          Padding(padding: EdgeInsets.only(left: 20, right: 20), child: Text("Logo, a Decisão é a sua escolha de Roleta e o Resultado Aleatório é para qual Região tal Roleta irá te levar (lembre, é um sorteio!).", 
          softWrap: true, textAlign: TextAlign.left, overflow: TextOverflow.clip,),),
          Padding(padding: EdgeInsets.only(left: 20, right: 20, bottom: 40), child: Text("Com isso, fazendo um processo Backwards, isto é, começando na última Rodada, fazemos o caminho inverso calculando sempre qual é a maior média de lucro para cada Roleta e com tal lucro, voltamos mais uma rodada e calculamos a média do lucro atual com o lucro da rodada predecessora (mas como estamos indo de trás pra frente, seria a rodada sucessora. Confuso, né?). Até que então chegamos à primeira rodada e sabemos quais foram as melhores decisões até então. Assim, se olharmos os caminhos ao contrário, temos os melhores caminhos desde a primeira rodada, até a última!", 
          softWrap: true, textAlign: TextAlign.left, overflow: TextOverflow.clip,),),
        ],
       ),
       ),
    );
  }
}