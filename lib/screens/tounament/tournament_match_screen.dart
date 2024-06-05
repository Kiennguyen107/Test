import 'dart:math';
import 'package:flutter/material.dart';
import '../../widgets/components/consts/clb_consts/clb_constants.dart';
import '../../widgets/model/club_model.dart';
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
  final List<String> _selectedPlayers = [];
  late final List<int> setcount1 ;
  late final List<int> setcount2 ;

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
          title: Text('Thử lại'),
          content: Text('Vui lòng nhập đầy đủ tên người chơi.'),
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
      players.shuffle(Random());
      setcount1 = List<int>.filled(widget.numberOfPlayers ~/ 2, 1);
      setcount2 = List<int>.filled(widget.numberOfPlayers ~/ 2, 0);// Shuffle the players list randomly
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => TourBeginMatch(players: players, set: widget.numberOfSets, setcount1:
        setcount1, setcount2: setcount2,)),
      );
    }
  }

  void _openPlayerSelectionDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return PlayerSelectionDialog(
          onSelectedPlayers: (List<String> selectedPlayers) {
            setState(() {
              _selectedPlayers.clear();
              _selectedPlayers.addAll(selectedPlayers);
              _fillPlayerNames();
            });
          },
        );
      },
    );
  }

  void _fillPlayerNames() {
    for (int i = 0; i < _controllers.length; i++) {
      if (i < _selectedPlayers.length) {
        _controllers[i].text = _selectedPlayers[i];
      } else {
        _controllers[i].clear();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tạo Giải Đấu', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8, bottom: 8),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: _openPlayerSelectionDialog,
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 7), // Button size
                    textStyle: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  child: Text('Chọn tuyển thủ'),
                ),
              ],
            ),
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
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ElevatedButton(
                onPressed: _generateBracket,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green, // Background color
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16), // Button size
                  textStyle: TextStyle(fontSize: 20, color: Colors.white),
                ),
                child: Text('Bắt đầu giải đấu'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PlayerSelectionDialog extends StatefulWidget {
  final Function(List<String>) onSelectedPlayers;

  PlayerSelectionDialog({required this.onSelectedPlayers});

  @override
  _PlayerSelectionDialogState createState() => _PlayerSelectionDialogState();
}

class _PlayerSelectionDialogState extends State<PlayerSelectionDialog> {
  final List<String> _selectedPlayers = [];

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Chọn tuyển thủ'),
      content: SingleChildScrollView(
        child: Column(
          children: ClbConstants.MemberList.map((Member member) {
            return CheckboxListTile(
              title: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(member.image),
                  ),
                  SizedBox(width: 10),
                  Text(member.name),
                ],
              ),
              value: _selectedPlayers.contains(member.name),
              onChanged: (bool? value) {
                setState(() {
                  if (value == true) {
                    _selectedPlayers.add(member.name);
                  } else {
                    _selectedPlayers.remove(member.name);
                  }
                });
              },
            );
          }).toList(),
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Huỷ'),
        ),
        ElevatedButton(
          onPressed: () {
            widget.onSelectedPlayers(_selectedPlayers);
            Navigator.of(context).pop();
          },
          child: Text('Xác nhân'),
        ),
      ],
    );
  }
}

