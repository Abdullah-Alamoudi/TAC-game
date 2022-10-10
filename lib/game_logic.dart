import 'dart:math';

class Player{
    // static const x='X';
    // static const o='O';
    // static const empty='';

    static List<int> playerX=[];
    static List<int> playerO=[];
}

 extension ContainsAll on List{
  bool containsAll(int x, int y, int z){
  //return  this.contains(x)&&this.contains(y)&&this.contains(z); //this => th same object player.playerX or O
   return  contains(x)&&contains(y)&&contains(z);
   }
 }
extension Containstwo on List{
  bool containstwo(int x, int y){
  //return  this.contains(x)&&this.contains(y)&&this.contains(z); //this => th same object player.playerX or O
   return  contains(x)&&contains(y);
   }
 }

class Game{
  
  void PlayGame(int index, String activePalyer) {
    if(activePalyer=='X')
      {Player.playerX.add(index);}
    else
      {Player.playerO.add(index);}
  }

  String CheckWinner(){
    String winner='';
    if (Player.playerX.containsAll(0, 1, 2)||
        Player.playerX.containsAll(3, 4, 5)||
        Player.playerX.containsAll(6, 7, 8)||
        Player.playerX.containsAll(0, 3, 6)||
        Player.playerX.containsAll(1, 4, 7)||
        Player.playerX.containsAll(2, 5, 8)||
        Player.playerX.containsAll(0, 4, 8)||
        Player.playerX.containsAll(2, 4, 6)) winner='X';

else if (Player.playerO.containsAll(0, 1, 2)||
        Player.playerO.containsAll(3, 4, 5)||
        Player.playerO.containsAll(6, 7, 8)||
        Player.playerO.containsAll(0, 3, 6)||
        Player.playerO.containsAll(1, 4, 7)||
        Player.playerO.containsAll(2, 5, 8)||
        Player.playerO.containsAll(0, 4, 8)||
        Player.playerO.containsAll(2, 4, 6)) winner='O';

      else  winner='';
      
        return winner;
    
  }

  Future<void> autoPlay(activePlayer)async{
    int index=0;
    List<int> emptycell=[];
    for (var i = 0; i < 9; i++) {
      if(Player.playerX.contains(i)||Player.playerO.contains(i)){
        continue;
        //(!(Player.playerX.contains(i)||Player.playerO.contains(i)))
      }else{
        emptycell.add(i);
      }
      
    }
    //start and center
         if(Player.playerO.containstwo(0, 1)&&emptycell.contains(2)){index=2;}
    else if(Player.playerO.containstwo(3, 4)&&emptycell.contains(5)){index=5;}
    else if(Player.playerO.containstwo(6, 7)&&emptycell.contains(8)){index=8;}
    else if(Player.playerO.containstwo(0, 3)&&emptycell.contains(6)){index=6;}
    else if(Player.playerO.containstwo(1, 4)&&emptycell.contains(7)){index=7;}
    else if(Player.playerO.containstwo(2, 5)&&emptycell.contains(8)){index=8;}
    //center and end
    else if(Player.playerO.containstwo(1, 2)&&emptycell.contains(0)){index=0;}
    else if(Player.playerO.containstwo(4, 5)&&emptycell.contains(3)){index=3;}
    else if(Player.playerO.containstwo(7, 8)&&emptycell.contains(6)){index=6;}
    else if(Player.playerO.containstwo(3, 6)&&emptycell.contains(0)){index=0;}
    else if(Player.playerO.containstwo(4, 7)&&emptycell.contains(1)){index=1;}
    else if(Player.playerO.containstwo(5, 8)&&emptycell.contains(2)){index=2;}
    //start and end
    else if(Player.playerO.containstwo(0, 2)&&emptycell.contains(1)){index=1;}
    else if(Player.playerO.containstwo(3, 5)&&emptycell.contains(4)){index=4;}
    else if(Player.playerO.containstwo(6, 8)&&emptycell.contains(7)){index=7;}
    else if(Player.playerO.containstwo(0, 6)&&emptycell.contains(3)){index=3;}
    else if(Player.playerO.containstwo(1, 7)&&emptycell.contains(4)){index=4;}
    else if(Player.playerO.containstwo(2, 8)&&emptycell.contains(5)){index=5;}
    // shape cross
    else if(Player.playerO.containstwo(0, 4)&&emptycell.contains(8)){index=8;}
    else if(Player.playerO.containstwo(4, 8)&&emptycell.contains(0)){index=0;}
    else if(Player.playerO.containstwo(0, 8)&&emptycell.contains(4)){index=4;}
    else if(Player.playerO.containstwo(2, 4)&&emptycell.contains(6)){index=6;}
    else if(Player.playerO.containstwo(4, 6)&&emptycell.contains(2)){index=2;}
    else if(Player.playerO.containstwo(2, 6)&&emptycell.contains(4)){index=4;}

    //start and center
    else if(Player.playerX.containstwo(0, 1)&&emptycell.contains(2)){index=2;}
    else if(Player.playerX.containstwo(3, 4)&&emptycell.contains(5)){index=5;}
    else if(Player.playerX.containstwo(6, 7)&&emptycell.contains(8)){index=8;}
    else if(Player.playerX.containstwo(0, 3)&&emptycell.contains(6)){index=6;}
    else if(Player.playerX.containstwo(1, 4)&&emptycell.contains(7)){index=7;}
    else if(Player.playerX.containstwo(2, 5)&&emptycell.contains(8)){index=8;}
    //center and end
    else if(Player.playerX.containstwo(1, 2)&&emptycell.contains(0)){index=0;}
    else if(Player.playerX.containstwo(4, 5)&&emptycell.contains(3)){index=3;}
    else if(Player.playerX.containstwo(7, 8)&&emptycell.contains(6)){index=6;}
    else if(Player.playerX.containstwo(3, 6)&&emptycell.contains(0)){index=0;}
    else if(Player.playerX.containstwo(4, 7)&&emptycell.contains(1)){index=1;}
    else if(Player.playerX.containstwo(5, 8)&&emptycell.contains(2)){index=2;}
    //start and end
    else if(Player.playerX.containstwo(0, 2)&&emptycell.contains(1)){index=1;}
    else if(Player.playerX.containstwo(3, 5)&&emptycell.contains(4)){index=4;}
    else if(Player.playerX.containstwo(6, 8)&&emptycell.contains(7)){index=7;}
    else if(Player.playerX.containstwo(0, 6)&&emptycell.contains(3)){index=3;}
    else if(Player.playerX.containstwo(1, 7)&&emptycell.contains(4)){index=4;}
    else if(Player.playerX.containstwo(2, 8)&&emptycell.contains(5)){index=5;}
    // shape cross
    else if(Player.playerX.containstwo(0, 4)&&emptycell.contains(8)){index=8;}
    else if(Player.playerX.containstwo(4, 8)&&emptycell.contains(0)){index=0;}
    else if(Player.playerX.containstwo(0, 8)&&emptycell.contains(4)){index=4;}
    else if(Player.playerX.containstwo(2, 4)&&emptycell.contains(6)){index=6;}
    else if(Player.playerX.containstwo(4, 6)&&emptycell.contains(2)){index=2;}
    else if(Player.playerX.containstwo(2, 6)&&emptycell.contains(4)){index=4;}
    else{
      Random random=Random();
    int randomindex=random.nextInt(emptycell.length);
    print(emptycell);
    index=emptycell[randomindex];
    //print(index);
    }
    
    PlayGame(index, activePlayer);
  }

}