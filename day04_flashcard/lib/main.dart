import 'package:day04_flashcard/flashcard.dart';
import 'package:day04_flashcard/flashcard_view.dart';
import 'package:flip_card/flip_card.dart';
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
  List<Flashcard> _flashcards = [
    Flashcard(question: 'What programming language does Flutter use?', answer: 'Dart'),
    Flashcard(question: 'Who you gonna call?', answer: 'Ghostbusters'),
    Flashcard(question: 'Who teaches you how to write sexy code?', answer: 'Ya boi Kilo Loco!'),
  ];

  int _currentCard = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 250,
                height: 250,
                child: FlipCard(
                  front: FlashcardView(_flashcards[_currentCard].question),
                  back: FlashcardView(_flashcards[_currentCard].answer),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  OutlinedButton.icon(
                      onPressed: () {
                        setState(() {
                          _currentCard = _currentCard == 0 ? _flashcards.length - 1 : _currentCard - 1;
                        });
                      },
                      icon: Icon(Icons.chevron_left),
                      label: Text('Prev')),
                  OutlinedButton.icon(
                      onPressed: () {
                        setState(() {
                          _currentCard = _currentCard == (_flashcards.length - 1) ? 0 : _currentCard + 1;
                        });
                      },
                      icon: Icon(Icons.chevron_right),
                      label: Text('Next')),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
