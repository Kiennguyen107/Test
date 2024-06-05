import 'package:flutter/material.dart';
import 'package:test_project/screens/tounament/on_match_tour_screen.dart';

class TourBeginMatch extends StatefulWidget {
  final List<String> players;
  final int set;
  final List<int> setcount1;
  final List<int> setcount2;

  TourBeginMatch({super.key, required this.players, required this.set, required this.setcount1, required this.setcount2});

  @override
  _TourBeginMatchState createState() => _TourBeginMatchState();
}

class _TourBeginMatchState extends State<TourBeginMatch> {
  late List<List<String>> matchups;
  late List<String> winners;
  late List<bool> navigatedMatches;
  String roundName = 'Group Stage';
  bool canProceedToNextRound = false;

  @override
  void initState() {
    super.initState();
    _initializeBracket();
  }

  void _initializeBracket() {
    matchups = _generateMatchups(widget.players);
    winners = List.filled(matchups.length, '');
    navigatedMatches = List.filled(matchups.length, false);

    for (int i = 0; i < matchups.length; i++) {
      if (widget.setcount1.length > i && widget.setcount2.length > i) {
        if (widget.setcount1[i] > widget.setcount2[i]) {
          winners[i] = matchups[i][0];
        } else if (widget.setcount2[i] > widget.setcount1[i]) {
          winners[i] = matchups[i][1];
        }
      } else if (matchups[i][1] == '') {
        winners[i] = matchups[i][0]; // Automatically set the winner if no opponent
      }
    }

    _checkIfCanProceed();
  }

  List<List<String>> _generateMatchups(List<String> players) {
    List<String> validPlayers = players.where((player) => player.isNotEmpty).toList();
    List<List<String>> generatedMatchups = [];
    for (int i = 0; i < validPlayers.length; i += 2) {
      if (i + 1 < validPlayers.length) {
        generatedMatchups.add([validPlayers[i], validPlayers[i + 1]]);
      } else {
        generatedMatchups.add([validPlayers[i], '']);
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
      setState(() {
        roundName = 'Winner';
      });
    } else {
      setState(() {
        matchups = _generateMatchups(advancingPlayers);
        winners = List.filled(matchups.length, '');
        navigatedMatches = List.filled(matchups.length, false);
        canProceedToNextRound = false;
        _checkIfCanProceed();
      });
    }
  }

  void _validateWinner(int index, String value) {
    if (value == matchups[index][0] || value == matchups[index][1]) {
      winners[index] = value;
    } else {
      winners[index] = '';
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Winner must be either ${matchups[index][0]} or ${matchups[index][1]}'),
        ),
      );
    }
    _checkIfCanProceed();
  }

  void _checkIfCanProceed() {
    setState(() {
      canProceedToNextRound = winners.every((winner) => winner != '') || matchups.any((match) => match[1] == '' && winners[matchups.indexOf(match)] != '');
    });
  }

  void _navigateToMatch(int index) {
    if (!navigatedMatches[index]) {
      setState(() {
        navigatedMatches[index] = true;
      });
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => OnMatchTourScreen(
            selectedTeam1: matchups[index][0],
            selectedTeam2: matchups[index][1],
            numberMatch: widget.set,
          ),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Trận đấu đã kết thúc'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tournament', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              roundName,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: matchups.length,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (index % 2 == 0) // Every two matchups, add the group stage label
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Text(
                            'Vòng bảng ${index ~/ 2 + 1}',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      InkWell(
                        onTap: () => _navigateToMatch(index),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              Flexible(
                                child: Container(
                                  height: 80,
                                  color: Colors.white54,
                                  child: Center(
                                    child: Text('Trận ${index + 1}'),
                                  ),
                                ),
                              ),
                              Flexible(
                                flex: 2,
                                child: Container(
                                  height: 80,
                                  color: Colors.white54,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            width: 15,
                                            height: 15,
                                            color: Colors.green,
                                          ),
                                          const SizedBox(width: 5),
                                          Expanded(
                                            child: Text(
                                              matchups[index][0],
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 10),
                                      if (matchups[index][1].isNotEmpty)
                                        Row(
                                          children: [
                                            Container(
                                              width: 15,
                                              height: 15,
                                              color: Colors.green,
                                            ),
                                            const SizedBox(width: 5),
                                            Expanded(
                                              child: Text(
                                                matchups[index][1],
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ],
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                              Flexible(
                                child: Container(
                                  height: 80,
                                  color: Colors.white54,
                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Center(
                                                child: Text(
                                                  widget.setcount1.length > index ? widget.setcount1[index].toString() : '',
                                                  style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        const SizedBox(height: 10),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Center(
                                                child: Text(
                                                  widget.setcount2.length > index ? widget.setcount2[index].toString() : '',
                                                  style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                                                ),
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              // Flexible(
                              //   child: Container(
                              //     height: 80,
                              //     color: Colors.white54,
                              //     child: Center(
                              //       child: matchups[index][1].isEmpty
                              //           ? Text(
                              //         matchups[index][0],
                              //         style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green),
                              //       )
                              //           : TextField(
                              //         onChanged: (value) {
                              //           _validateWinner(index, value);
                              //         },
                              //         decoration: const InputDecoration(
                              //           labelText: 'Winner',
                              //           border: OutlineInputBorder(),
                              //         ),
                              //       ),
                              //     ),
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.centerRight,  // Đặt nút ở bên phải màn hình
                child: SizedBox(
                  width: 150,  // Chiều rộng của nút
                  height: 60,  // Chiều cao của nút
                  child: ElevatedButton(
                    onPressed: canProceedToNextRound ? _nextRound : null,
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.green),  // Đổi màu nền thành xanh lá cây
                      textStyle: MaterialStateProperty.all<TextStyle>(
                          TextStyle(fontSize: 18)  // Tăng kích thước chữ
                      ),
                    ),
                    child: const Text('Next Round', style: TextStyle(fontSize: 18)),  // Tăng kích thước chữ
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
