import 'package:flutter/material.dart';

import 'game_logic.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String ActivePalyer = 'X';
  bool GameOver = false;
  int turn = 0;
  String result = '';
  var game = Game();
  bool IsSwtched = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child:MediaQuery.of(context).orientation==Orientation.portrait? Column(
          children: [
           ... firstblock(),
            _expanded(context),
           ... lastblock()
          ],
        ):Row(
          children: [
              Expanded(
                child: Column(
                  children: [
                    ... firstblock(),
                    ... lastblock()
                  ],
                ),
              ),
               _expanded(context)
          ],
        ),
      ),
    );
  }
  List<Widget>  firstblock(){
    return[
SwitchListTile.adaptive(
                title: const Text('Turn on / off two player',
                    style: TextStyle(color: Colors.white, fontSize: 28),
                    textAlign: TextAlign.center),
                value: IsSwtched,
                onChanged: (val) {
                  setState(() {
                    IsSwtched = val;
                  });
                }),
            Text("It's $ActivePalyer turn".toUpperCase(),
                style: const TextStyle(color: Colors.white, fontSize: 52),
                textAlign: TextAlign.center),
    ];
  }

  Expanded _expanded(BuildContext context) {
    return Expanded(
              child: GridView.count(
            padding: const EdgeInsets.all(16),
            mainAxisSpacing: 8.0,
            crossAxisSpacing: 8.0,
            childAspectRatio: 1.0,
            crossAxisCount: 3,
            children: List.generate(
                9,
                (index) => InkWell(
                      borderRadius: BorderRadius.circular(16),
                      onTap: GameOver ? null : () => onTap(index),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Theme.of(context).shadowColor,
                            borderRadius: BorderRadius.circular(16)),
                        child: Center(
                          child: Text(
                              Player.playerX.contains(index)
                                  ? 'X'
                                  : Player.playerO.contains(index)
                                      ? 'O'
                                      : '',
                              style: TextStyle(
                                  color: Player.playerX.contains(index)
                                      ? Colors.blue
                                      : Colors.pink,
                                  fontSize: 52)),
                        ),
                      ),
                    )),
          ));
  }

List<Widget>  lastblock(){
    return[
        Text(result,
                style: TextStyle(color: Colors.white, fontSize: 28),
                textAlign: TextAlign.center),
            ElevatedButton.icon(
              onPressed: () {
                setState(() {
                  Player.playerX=[];
                  Player.playerO=[];
                  ActivePalyer = 'X';
                  GameOver = false;
                  turn = 0;
                  result = '';
                });
              },
              icon: Icon(Icons.replay),
              label: Text('Repeat the game'),
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Theme.of(context).splashColor)),
            )
    ];
  }

  onTap(int index) async{
    
    if((Player.playerX.isEmpty||!Player.playerX.contains(index))&&
        (Player.playerO.isEmpty||!Player.playerO.contains(index))){
          game.PlayGame(index, ActivePalyer);
          UpdateState();

          if(!IsSwtched && !GameOver&&turn!=9){
            await  game.autoPlay(ActivePalyer);
            UpdateState();
          }
        }

    
  }

  void UpdateState() {
    return setState(() {
    ActivePalyer = ActivePalyer == 'X' ? 'O' : 'X';
    turn++;

    dynamic playerWin=game.CheckWinner();
    if(playerWin!=''){
      GameOver=true;
      result='$playerWin is the winner';
    }
    else if(!GameOver&&turn==9){
      result="It's Draw!";
    }
  });
  }
}
