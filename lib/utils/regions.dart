import 'package:flutter/foundation.dart';

class Region{
  int countRegions = 3;
}

class Roleta{
  String id;
  int canGoTo_1;
  int canGoTo_2;
  double probGoTo_1;
  double probGoTo_2;
  int lucroGoTo_1;
  int lucroGoTo_2;

  Roleta({
    @required this.id,
    @required this.canGoTo_1,
    @required this.canGoTo_2,
    @required this.probGoTo_1,
    @required this.probGoTo_2,
    @required this.lucroGoTo_1,
    @required this.lucroGoTo_2,
  });

}


class RegionOne{
  int id = 1;
  Roleta roleta_1 = new Roleta(
    id: "A",
    canGoTo_1: 1,
    canGoTo_2: 2,
    probGoTo_1 :  1/4,
    probGoTo_2 : 3/4,
    lucroGoTo_1  : 12,
    lucroGoTo_2 : 4,
  );
  Roleta roleta_2 = new Roleta(
      id: "B",
      canGoTo_1 : 1,
      canGoTo_2 : 3,
      probGoTo_1 :  1/6,
      probGoTo_2 : 5/6,
      lucroGoTo_1 : 0,
      lucroGoTo_2 : 6,
  );
}

class RegionTwo{
  int id = 2;
  Roleta roleta_1 = new Roleta(
      id : "C",
      canGoTo_1 : 2,
      canGoTo_2 : 1,
      probGoTo_1 :  1/2,
      probGoTo_2 : 1/2,
      lucroGoTo_1 : 10,
      lucroGoTo_2 : 10,
  );
  Roleta roleta_2 = new Roleta(
      id : "D",
      canGoTo_1 : 2,
      canGoTo_2 : 3,
      probGoTo_1 :  1/4,
      probGoTo_2 : 3/4,
      lucroGoTo_1 : 0,
      lucroGoTo_2 : 12,
  );
}

class RegionThree{
  int id = 3;
  Roleta roleta_1 = new Roleta(
    id : "E",
    canGoTo_1 : 3,
    canGoTo_2 : 1,
    probGoTo_1 :  1/4,
    probGoTo_2 : 3/4,
    lucroGoTo_1 : 36,
    lucroGoTo_2 : 8,
  );
  Roleta roleta_2 = new Roleta(
    id : "F",
    canGoTo_1 : 3,
    canGoTo_2 : 2,
    probGoTo_1 :  1/2,
    probGoTo_2 : 1/2,
    lucroGoTo_1 : 16,
    lucroGoTo_2 : 10,
  );
}