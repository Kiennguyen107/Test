import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SelectionScreen(),
    );
  }
}

class SelectionScreen extends StatefulWidget {
  @override
  _SelectionScreenState createState() => _SelectionScreenState();
}

class _SelectionScreenState extends State<SelectionScreen> {
  int _numberOfPlayers = 8; // Default number of players
  DateTime _selectedDate = DateTime.now();
  TimeOfDay _selectedTime = TimeOfDay.now();
  int _numberOfSets = 3; // Default number of sets

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != _selectedDate)
      setState(() {
        _selectedDate = picked;
      });
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );
    if (picked != null && picked != _selectedTime)
      setState(() {
        _selectedTime = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tournament Setup'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('Select Number of Players'),
            NumberInputDropdown(
              value: _numberOfPlayers,
              onChanged: (int newValue) {
                setState(() {
                  _numberOfPlayers = newValue;
                });
              },
              items: [4, 8, 16, 32],
            ),
            SizedBox(height: 16),
            Text('Select Date'),
            ElevatedButton(
              onPressed: () => _selectDate(context),
              child: Text("${_selectedDate.toLocal()}".split(' ')[0]),
            ),
            SizedBox(height: 16),
            Text('Select Time'),
            ElevatedButton(
              onPressed: () => _selectTime(context),
              child: Text("${_selectedTime.format(context)}"),
            ),
            SizedBox(height: 16),
            Text('Select Number of Sets'),
            DropdownButton<int>(
              value: _numberOfSets,
              onChanged: (int? newValue) {
                setState(() {
                  _numberOfSets = newValue!;
                });
              },
              items: <int>[1, 3, 5]
                  .map<DropdownMenuItem<int>>((int value) {
                return DropdownMenuItem<int>(
                  value: value,
                  child: Text(value.toString()),
                );
              }).toList(),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PlayerInputScreen(
                      numberOfPlayers: _numberOfPlayers,
                      selectedDate: _selectedDate,
                      selectedTime: _selectedTime,
                      numberOfSets: _numberOfSets,
                    ),
                  ),
                );
              },
              child: Text('Next'),
            ),
          ],
        ),
      ),
    );
  }
}

class NumberInputDropdown extends StatefulWidget {
  final int value;
  final ValueChanged<int> onChanged;
  final List<int> items;

  NumberInputDropdown({
    required this.value,
    required this.onChanged,
    required this.items,
  });

  @override
  _NumberInputDropdownState createState() => _NumberInputDropdownState();
}

class _NumberInputDropdownState extends State<NumberInputDropdown> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.value.toString());
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerRight,
      children: [
        TextField(
          controller: _controller,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
          ),
          onChanged: (value) {
            final int? newValue = int.tryParse(value);
            if (newValue != null) {
              widget.onChanged(newValue);
            }
          },
        ),
        DropdownButton<int>(
          value: widget.value,
          onChanged: (int? newValue) {
            if (newValue != null) {
              _controller.text = newValue.toString();
              widget.onChanged(newValue);
            }
          },
          items: widget.items.map<DropdownMenuItem<int>>((int value) {
            return DropdownMenuItem<int>(
              value: value,
              child: Text(value.toString()),
            );
          }).toList(),
        ),
      ],
    );
  }
}

class PlayerInputScreen extends StatefulWidget {
  final int numberOfPlayers;
  final DateTime selectedDate;
  final TimeOfDay selectedTime;
  final int numberOfSets;

  PlayerInputScreen({
    required this.numberOfPlayers,
    required this.selectedDate,
    required this.selectedTime,
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

  void _showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text('Please enter names for all players.'),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _generateBracket() {
    List<String> players = _controllers.map((controller) => controller.text).toList();

    if (players.contains('')) {
      _showAlertDialog(context);
    } else {
      players.shuffle(Random()); // Shuffle the players list randomly
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => BracketScreen(players: players)),
      );
    }
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

class BracketScreen extends StatefulWidget {
  final List<String> players;

  BracketScreen({required this.players});

  @override
  _BracketScreenState createState() => _BracketScreenState();
}

class _BracketScreenState extends State<BracketScreen> {
  late List<List<String>> matchups;
  late List<String> winners;
  String roundName = 'Group Stage';
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _initializeBracket();
  }

  void _initializeBracket() {
    matchups = _generateMatchups(widget.players);
    winners = List.filled(matchups.length, '');
  }

  List<List<String>> _generateMatchups(List<String> players) {
    List<List<String>> generatedMatchups = [];
    for (int i = 0; i < players.length; i += 2) {
      if (i + 1 < players.length) {
        generatedMatchups.add([players[i], players[i + 1]]);
      } else {
        generatedMatchups.add([players[i], 'TBD']);
      }
    }
    return generatedMatchups;
  }

  void _nextRound() {
    List<String> advancingPlayers = [];
    for (int i = 0; i < winners.length; i++) {
      if (winners[i] != '') {
        advancingPlayers.add(winners[i]);
      }
    }

    if (advancingPlayers.length == 1) {
      // Winner found, display winner screen or end of tournament message
      setState(() {
        roundName = 'Winner';
      });
    } else {
      // Generate next round matchups
      setState(() {
        roundName = 'Round ${matchups.length ~/ 2 + 1}';
        matchups = _generateMatchups(advancingPlayers);
        winners = List.filled(matchups.length, '');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tournament Bracket'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              roundName,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                controller: _scrollController,
                itemCount: matchups.length,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Match ${index + 1}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text('${matchups[index][0]} vs ${matchups[index][1]}'),
                      SizedBox(height: 16),
                      TextField(
                        onChanged: (value) {
                          winners[index] = value;
                        },
                        decoration: InputDecoration(
                          labelText: 'Winner',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 24),
                    ],
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: _nextRound,
              child: Text('Next Round'),
            ),
          ],
        ),
      ),
    );
  }
}
