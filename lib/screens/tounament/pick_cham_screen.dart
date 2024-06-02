import 'package:flutter/material.dart';
import 'package:test_project/screens/tounament/tournament_match_screen.dart';

class ControlTourScreen extends StatefulWidget {
  @override
  _ControlTourScreenState createState() => _ControlTourScreenState();
}

enum num_match_Selection { single, triple, penta }

class _ControlTourScreenState extends State<ControlTourScreen> {
  int _numberOfPlayers = 8; // Default number of players
  DateTime _selectedDate = DateTime.now();
  int _numberOfSets = 3; // Default number of sets
  TextEditingController _playerController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _playerController.text = _numberOfPlayers.toString(); // Initialize the controller with the default value
  }

  @override
  void dispose() {
    _playerController.dispose(); // Dispose the controller when the widget is disposed
    super.dispose();
  }

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

  int? numberMatch;

  num_match_Selection selected_match = num_match_Selection.single;

  String getText(num_match_Selection type) {
    switch (type) {
      case num_match_Selection.single:
        return '1 Séc';
      case num_match_Selection.triple:
        return '3 Séc';
      case num_match_Selection.penta:
        return '5 Séc';
    }
  }

  Widget buildCardMatch(num_match_Selection type) {
    return Container(
      width: 85,
      height: 85,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
        color: selected_match == type ? Colors.green : Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                getText(type),
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tournament Setup', style: TextStyle(fontSize: 28)),
      ),
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () => _selectDate(context),
                            child: Text("${_selectedDate.toLocal()}".split(' ')[0]),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selected_match = num_match_Selection.single;
                              numberMatch = 1;
                            });
                          },
                          child: buildCardMatch(num_match_Selection.single),
                        ),
                        SizedBox(width: 15),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selected_match = num_match_Selection.triple;
                              numberMatch = 3;
                            });
                          },
                          child: buildCardMatch(num_match_Selection.triple),
                        ),
                        SizedBox(width: 15),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selected_match = num_match_Selection.penta;
                              numberMatch = 5;
                            });
                          },
                          child: buildCardMatch(num_match_Selection.penta),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Text('Select Number of Players'),
                    TextField(
                      controller: _playerController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) {
                        final int? newValue = int.tryParse(value);
                        if (newValue != null && newValue >= 2) {
                          setState(() {
                            _numberOfPlayers = newValue;
                          });
                        }
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                      child: Column(
                        children: [
                          SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.only(right: 12),
                                height: 55,
                                width: 200,
                                decoration: BoxDecoration(
                                  color: Colors.red.shade200,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => PlayerInputScreen(
                                          numberOfPlayers: _numberOfPlayers,
                                          selectedDate: _selectedDate,
                                          numberOfSets: _numberOfSets,
                                        ),
                                      ),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.red.shade200, // Background color
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15), // Rounded corners
                                    ),
                                    elevation: 0, // Remove shadow/elevation
                                  ),
                                  child: const Center(
                                    child: Text(
                                      'Bắt đầu tạo',
                                      style: TextStyle(fontSize: 25),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                          ,
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
