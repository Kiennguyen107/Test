import 'package:flutter/material.dart';

class InputScore extends StatefulWidget {
  @override
  _InputScoreState createState() => _InputScoreState();
}

class _InputScoreState extends State<InputScore> {
  final _formKey = GlobalKey<FormState>();
  int maxSets = 5; // Số set tối đa
  int player1SetWins = 0; // Số set thắng player 1
  int player2SetWins = 0; // Số set thắng player 2
  List<int> player1Scores = List.filled(5, 0);
  List<int> player2Scores = List.filled(5, 0);

  void _submitScores() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      String winner = _calculateWinner();
      _showMatchResultDialog(winner);
    }
  }

  String _calculateWinner() {
    for (int i = 0; i < maxSets; i++) {
      if (player1Scores[i] >= 11 && player1Scores[i] >= player2Scores[i] + 2) {
        player1SetWins++;
      } else if (player2Scores[i] >= 11 && player2Scores[i] >= player1Scores[i] + 2) {
        player2SetWins++;
      }
    }

    if (player1SetWins > player2SetWins) {
      return 'Player 1 wins the match!' ;
    } else if (player2SetWins > player1SetWins) {
      return 'Player 2 wins the match!';
    } else {
      return 'The match is a draw!';
    }
  }

  void _showMatchResultDialog(String result) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Match Result'),
        content: Text(result),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  Widget _buildScoreInput(int setIndex, int playerIndex) {
    return Container(
      width: 50,
      child: TextFormField(
        initialValue: playerIndex == 0 ? player1Scores[setIndex].toString() : player2Scores[setIndex].toString(),
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center, // Căn giữa văn bản
        decoration: InputDecoration(),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Enter score';
          }
          return null;
        },
        onSaved: (value) {
          if (playerIndex == 0) {
            player1Scores[setIndex] = int.parse(value!);
          } else {
            player2Scores[setIndex] = int.parse(value!);
          }
        },
      ),
    );
  }

  String selectedTeam1 = 'Team 1';
  String selectedTeam2 = 'Team 2';

  void _showEditDialog(String team, Function(String) onSave) {
    TextEditingController controller = TextEditingController(text: team);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Edit Team Name'),
        content: TextField(
          controller: controller,
          decoration: InputDecoration(hintText: 'Enter team name'),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              onSave(controller.text);
              Navigator.of(context).pop();
            },
            child: Text('Save'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Row(
          children: [
            CircleAvatar(
              radius: 25,
              backgroundImage: AssetImage("assets/logo.jpg"),
            ),
            SizedBox(width: 10),
            Text(
              'PingLog',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black, decoration: TextDecoration.none),
            ),
            Spacer(),
            CircleAvatar(
              radius: 15,
              backgroundImage: AssetImage("assets/logo.jpg"),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: Colors.pink.shade50,
                height: 200,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text('Đội 1', style: TextStyle(fontSize: 25, color: Colors.black)),
                          CircleAvatar(
                            radius: 25,
                            backgroundImage: AssetImage("assets/logo.jpg"),
                          ),
                          Text('Đội 2', style: TextStyle(fontSize: 25, color: Colors.black)),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () => _showEditDialog(selectedTeam1, (newName) {
                            setState(() {
                              selectedTeam1 = newName;
                            });
                          }),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            height: 125,
                            width: 138,
                            child: Center(
                              child: Text(selectedTeam1, style: TextStyle(fontSize: 25)),
                            ),
                          ),
                        ),
                        SizedBox(width: 20),
                        GestureDetector(
                          onTap: () => _showEditDialog(selectedTeam2, (newName) {
                            setState(() {
                              selectedTeam2 = newName;
                            });
                          }),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            height: 125,
                            width: 138,
                            child: Center(
                              child: Text(selectedTeam2, style: TextStyle(fontSize: 25)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Divider(),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Text(selectedTeam1, style: TextStyle(fontWeight: FontWeight.bold)),
                          for (int i = 0; i < maxSets; i++)
                            _buildScoreInput(i, 0),
                        ],
                      ),
                    ),
                    VerticalDivider(),
                    Expanded(
                      child: Column(
                        children: [
                          Text(selectedTeam2, style: TextStyle(fontWeight: FontWeight.bold)),
                          for (int i = 0; i < maxSets; i++)
                            _buildScoreInput(i, 1),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.centerRight, // Canh nút bấm sang phải
                child: ElevatedButton(
                  onPressed: _submitScores,
                  child: Text('Submit Scores'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
