import 'package:flutter/material.dart';

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
            DropdownButton<int>(
              value: _numberOfPlayers,
              onChanged: (int? newValue) {
                setState(() {
                  _numberOfPlayers = newValue!;
                });
              },
              items: <int>[4, 8, 16, 32]
                  .map<DropdownMenuItem<int>>((int value) {
                return DropdownMenuItem<int>(
                  value: value,
                  child: Text(value.toString()),
                );
              }).toList(),
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
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => PlayerInputScreen(
                //       numberOfPlayers: _numberOfPlayers,
                //       selectedDate: _selectedDate,
                //       selectedTime: _selectedTime,
                //       numberOfSets: _numberOfSets,
                //     ),
                //   ),
                // );
              },
              child: Text('Next'),
            ),
          ],
        ),
      ),
    );
  }
}
