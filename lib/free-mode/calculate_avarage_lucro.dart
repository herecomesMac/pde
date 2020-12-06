import 'package:flutter/foundation.dart';
import 'package:pde/utils/regions.dart';


class BestRound{
  String roleta_1;
  String roleta_2;
  String roleta_3;
  
  BestRound({@required this.roleta_1, @required this.roleta_2, @required this.roleta_3});

}

class CalculateAverageProfit{
  int lucro = 0;
  int round;  
  RegionOne regionOne = new RegionOne();
  RegionTwo regionTwo = new RegionTwo();
  RegionThree regionThree = new RegionThree();
  List<double> avarage_1 = [0,0];
  List<double> avarage_2 = [0,0];
  List<double> avarage_3 = [0,0];
  double avarage = 0;
  
  List<BestRound> bestOfRounds = new List<BestRound>();

  _calculateAvaregeProfit(dynamic region, double profitBefore, double profitBeforeFirstRoleta, double profitBeforeSecondRoleta){
  double a = (region.roleta_1.lucroGoTo_1+profitBefore)* region.roleta_1.probGoTo_1 + (region.roleta_1.lucroGoTo_2+profitBeforeFirstRoleta) * region.roleta_1.probGoTo_2;
  double b = (region.roleta_2.lucroGoTo_1+profitBefore) * region.roleta_2.probGoTo_1 + (region.roleta_2.lucroGoTo_2+profitBeforeSecondRoleta) * region.roleta_2.probGoTo_2;
  return [a,b];
}

_calculateNexAvarageUsed(int index, avarage_1, avarage_2, avarage_3, dynamic region){
  double profitBeforeRoleta;
  if(index == 0){
      int canGoTo = region.roleta_1.canGoTo_2;
      switch(canGoTo){
        case 1:
          profitBeforeRoleta = (avarage_1[0] > avarage_1[1]) ? avarage_1[0] : avarage_1[1];
          break;
        case 2:
          profitBeforeRoleta = (avarage_2[0] > avarage_2[1]) ? avarage_2[0] : avarage_2[1];
          break;
        case 3:
          profitBeforeRoleta = (avarage_3[0] > avarage_3[1]) ? avarage_3[0] : avarage_3[1];
          break;
      }
    }else{
      int canGoTo = region.roleta_2.canGoTo_2;
      switch(canGoTo){
        case 1:
          profitBeforeRoleta = (avarage_1[0] > avarage_1[1]) ? avarage_1[0] : avarage_1[1];
          break;
        case 2:
          profitBeforeRoleta = (avarage_2[0] > avarage_2[1]) ? avarage_2[0] : avarage_2[1];
          break;
        case 3:
          profitBeforeRoleta = (avarage_3[0] > avarage_3[1]) ? avarage_3[0] : avarage_3[1];
          break;
      }
    }
  return profitBeforeRoleta;
  
}

CalculateAverageProfit.calculateAvarageGame(int rounds){
  print("Rounds $rounds");
  round = rounds;
  double profitBefore = 0;
  double profitBeforeFirstRoleta = 0;
  double profitBeforeSecondRoleta = 0;
  for(int i=0;i<round;i++){
    print("Round $i");
    avarage_1 = _calculateAvaregeProfit(regionOne, profitBefore, profitBeforeFirstRoleta, profitBeforeSecondRoleta);
    profitBeforeFirstRoleta = _calculateNexAvarageUsed(0, avarage_2, avarage_1, avarage_3, regionTwo);
    profitBeforeSecondRoleta = _calculateNexAvarageUsed(1, avarage_2, avarage_1, avarage_3, regionTwo);
    List<double> avarageBeforeChange = avarage_2;
    avarage_2 = _calculateAvaregeProfit(regionTwo, profitBefore, profitBeforeFirstRoleta, profitBeforeSecondRoleta);
    profitBeforeFirstRoleta = _calculateNexAvarageUsed(0, avarage_3, avarageBeforeChange, avarage_1, regionThree);
    profitBeforeSecondRoleta = _calculateNexAvarageUsed(1, avarage_3, avarageBeforeChange, avarage_1, regionThree);
    avarage_3 = _calculateAvaregeProfit(regionThree, profitBefore, profitBeforeFirstRoleta, profitBeforeSecondRoleta);
    bestOfRounds.add(
      BestRound(
        roleta_1: (avarage_1[0] > avarage_1[1]) ? regionOne.roleta_1.id : regionOne.roleta_2.id,
        roleta_2: (avarage_2[0] > avarage_2[1]) ? regionTwo.roleta_1.id : regionTwo.roleta_2.id, 
        roleta_3: (avarage_3[0] > avarage_3[1]) ? regionThree.roleta_1.id : regionThree.roleta_2.id, ),
    );
    for(int j=0; j<=i;j++){
      print({bestOfRounds[j].roleta_1, bestOfRounds[j].roleta_2, bestOfRounds[j].roleta_3});
    }
    profitBefore = (avarage_1[0] > avarage_1[1]) ? avarage_1[0] : avarage_1[1];
    print({avarage_1, avarage_2, avarage_3});
    profitBeforeFirstRoleta = _calculateNexAvarageUsed(0, avarage_1, avarage_2, avarage_3, regionOne);
    profitBeforeSecondRoleta = _calculateNexAvarageUsed(1, avarage_1, avarage_2, avarage_3, regionOne);
  }
  double biggestFromAvarage_1 = (avarage_1[0] > avarage_1[1]) ? avarage_1[0] : avarage_1[1];
  double biggestFromAvarage_2 = (avarage_2[0] > avarage_2[1]) ? avarage_2[0] : avarage_2[1];
  double biggestFromAvarage_3 = (avarage_3[0] > avarage_3[1]) ? avarage_3[0] : avarage_3[1];
  avarage = ((1/3) *biggestFromAvarage_1) + ((1/3) *biggestFromAvarage_2) + ((1/3) * biggestFromAvarage_3);

}

}




