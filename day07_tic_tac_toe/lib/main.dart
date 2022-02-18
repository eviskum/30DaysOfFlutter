import 'package:day07_tic_tac_toe/board_tile.dart';
import 'package:day07_tic_tac_toe/tile_state.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final navigatorKey = GlobalKey<NavigatorState>();
  List<TileState> _boardState = List.filled(9, TileState.EMPTY);

  TileState _currentTurn = TileState.X;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      home: Scaffold(
        body: Center(
          child: Stack(
            children: [
              Image.asset('images/board.png'),
              _boardTiles(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _boardTiles() {
    return Builder(builder: (context) {
      final boardDimensions = MediaQuery.of(context).size.width;
      final tileDimensions = boardDimensions / 3;

      return Container(
        width: boardDimensions,
        height: boardDimensions,
        child: Column(
          children: chunk(_boardState, 3).asMap().entries.map((e) {
            final chunkIndex = e.key;
            final tileStateChunk = e.value;
            return Row(
              children: tileStateChunk.asMap().entries.map((innerE) {
                final innerIndex = innerE.key;
                final tileState = innerE.value;
                final tileIndex = chunkIndex * 3 + innerIndex;
                return BoardTile(
                    tileDimensions: tileDimensions,
                    onPressed: () {
                      _updateTileStateForIndex(tileIndex);
                    },
                    tileState: tileState);
              }).toList(),
            );
          }).toList(),
          // children: [
          //   Row(
          //     children: [
          //       BoardTile(tileDimensions: tileDimensions, tileState: TileState.X, onPressed: () {}),
          //       BoardTile(tileDimensions: tileDimensions, tileState: TileState.O, onPressed: () {}),
          //       BoardTile(tileDimensions: tileDimensions, tileState: TileState.X, onPressed: () {}),
          //     ],
          //   ),
          //   Row(
          //     children: [
          //       BoardTile(tileDimensions: tileDimensions, tileState: TileState.X, onPressed: () {}),
          //       BoardTile(tileDimensions: tileDimensions, tileState: TileState.X, onPressed: () {}),
          //       BoardTile(tileDimensions: tileDimensions, tileState: TileState.X, onPressed: () {}),
          //     ],
          //   ),
          //   Row(
          //     children: [
          //       BoardTile(tileDimensions: tileDimensions, tileState: TileState.X, onPressed: () {}),
          //       BoardTile(tileDimensions: tileDimensions, tileState: TileState.X, onPressed: () {}),
          //       BoardTile(tileDimensions: tileDimensions, tileState: TileState.X, onPressed: () {}),
          //     ],
          //   ),
          // ],
        ),
      );
    });
  }

  void _updateTileStateForIndex(int selectedIndex) {
    if (_boardState[selectedIndex] == TileState.EMPTY) {
      setState(() {
        _boardState[selectedIndex] = _currentTurn;
        _currentTurn = _currentTurn == TileState.X ? TileState.O : TileState.X;
      });
    }

    final winner = _findWinner();
    if (winner != null) {
      print('Winner is: $winner');
      _showWinnerDialog(winner);
    }
  }

  TileState? _findWinner() {
    TileState? winnerForMatch(int a, int b, int c) {
      if (_boardState[a] != TileState.EMPTY) {
        if ((_boardState[a] == _boardState[b]) && (_boardState[a] == _boardState[c])) return _boardState[a];
      }
      return null;
    }

    final checks = [
      winnerForMatch(0, 1, 2),
      winnerForMatch(3, 4, 5),
      winnerForMatch(6, 7, 8),
      winnerForMatch(0, 3, 6),
      winnerForMatch(1, 4, 7),
      winnerForMatch(2, 5, 8),
      winnerForMatch(0, 4, 8),
      winnerForMatch(2, 4, 6),
    ];

    for (int i = 0; i < checks.length; i++) {
      if (checks[i] != null) return checks[i];
    }
    return null;
  }

  void _showWinnerDialog(TileState tileState) {
    final context = navigatorKey.currentState!.overlay!.context;
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: Text('Winner'),
            content: Image.asset(tileState == TileState.X ? 'images/x.png' : 'images/o.png'),
            actions: [
              TextButton(
                  onPressed: () {
                    _resetGame();
                    Navigator.of(context).pop();
                  },
                  child: Text('New game'))
            ],
          );
        });
  }

  void _resetGame() {
    setState(() {
      _boardState = List.filled(9, TileState.EMPTY);
      _currentTurn = TileState.X;
    });
  }
}
