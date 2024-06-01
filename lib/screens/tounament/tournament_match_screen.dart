import 'dart:math';

import 'package:flutter/material.dart';

import 'Tour_begin_match.dart';

class PlayerInputScreen extends StatefulWidget {
  final int numberOfPlayers;
  final DateTime selectedDate;
  final int numberOfSets;

  PlayerInputScreen({
    required this.numberOfPlayers,
    required this.selectedDate,
    required this.numberOfSets,
  });

  @override
  _PlayerInputScreenState createState() => _PlayerInputScreenState();
}

class _PlayerInputScreenState extends State<PlayerInputScreen> {
  final List<TextEditingController> _controllers = [];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < widget.numberOfPlayers; i++) {
      _controllers.add(TextEditingController());
    }
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _generateBracket() {
    List<String> players = _controllers.map((controller) => controller.text).toList();
    players.shuffle(Random()); // Shuffle the players list randomly
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => TourBeginMatch(players: players)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Enter Player Names'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: widget.numberOfPlayers,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: TextField(
                      controller: _controllers[index],
                      decoration: InputDecoration(
                        labelText: 'Player ${index + 1}',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: _generateBracket,
              child: Text('Generate Bracket'),
            ),
          ],
        ),
      ),
    );
  }
}

