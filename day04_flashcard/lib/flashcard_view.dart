import 'package:flutter/material.dart';

class FlashcardView extends StatelessWidget {
  final String cardText;

  const FlashcardView(this.cardText, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Center(
        child: Text(
          cardText,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
