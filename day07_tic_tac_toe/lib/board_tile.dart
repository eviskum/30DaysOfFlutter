import 'package:day07_tic_tac_toe/tile_state.dart';
import 'package:flutter/material.dart';

class BoardTile extends StatelessWidget {
  final double tileDimensions;
  final VoidCallback onPressed;
  final TileState tileState;

  const BoardTile({
    Key? key,
    required this.tileDimensions,
    required this.onPressed,
    required this.tileState,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: tileDimensions,
      height: tileDimensions,
      child: TextButton(
        onPressed: onPressed,
        child: widgetForTileState(),
      ),
    );
  }

  Widget widgetForTileState() {
    switch (tileState) {
      case TileState.X:
        return Image.asset('images/x.png');
      case TileState.O:
        return Image.asset('images/o.png');
      default:
        return Container();
    }
  }
}
