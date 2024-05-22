import 'package:flutter/material.dart';

class ChamScreenMatch extends StatefulWidget {
  @override
  _ChamScreenMatchState createState() => _ChamScreenMatchState();
}

class _ChamScreenMatchState extends State<ChamScreenMatch> {
  final List<TextEditingController> _controllers = [];
  final int _numberOfPlayers = 16; // Số lượng người chơi có thể thay đổi

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < _numberOfPlayers; i++) {
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
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => BracketScreen(players: players)),
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
                itemCount: _numberOfPlayers,
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

class BracketScreen extends StatelessWidget {
  final List<String> players;

  BracketScreen({required this.players});

  @override
  Widget build(BuildContext context) {
    // Lọc các người chơi không có tên
    List<String> validPlayers = players.where((player) => player.isNotEmpty).toList();

    // Sắp xếp các cặp đấu
    List<List<String>> matchups = [];
    for (int i = 0; i < validPlayers.length; i += 2) {
      if (i + 1 < validPlayers.length) {
        matchups.add([validPlayers[i], validPlayers[i + 1]]);
      } else {
        matchups.add([validPlayers[i], 'TBD']);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Tournament Bracket'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: matchups.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Text('Match ${index + 1}'),
                subtitle: Text('${matchups[index][0]} vs ${matchups[index][1]}'),
              ),
            );
          },
        ),
      ),
    );
  }
}
