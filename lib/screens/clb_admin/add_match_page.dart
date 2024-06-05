// // ignore_for_file: library_private_types_in_public_api
//
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
//
// class AddMatchPage extends StatefulWidget {
//   const AddMatchPage({super.key});
//
//   @override
//   _AddMatchPageState createState() => _AddMatchPageState();
// }
//
// class _AddMatchPageState extends State<AddMatchPage> {
//   bool isDoubleMatch = false;
//   List<String> players = ["Player 1", "Player 2", "Player 3", "Player 4"];
//   late String team1Player1, team1Player2, team2Player1, team2Player2;
//   DateTime matchDate = DateTime.now();
//   List<Map<String, int>> sets = [];
//   int setNumber = 0;
//
//   void _addSet() {
//     setState(() {
//       sets.add({'team1': 0, 'team2': 0});
//       setNumber++;
//     });
//   }
//
//   void _saveMatch() {
//     final matchData = {
//       'isDoubleMatch': isDoubleMatch,
//       'team1': isDoubleMatch
//           ? {'player1': team1Player1, 'player2': team1Player2}
//           : {'player1': team1Player1},
//       'team2': isDoubleMatch
//           ? {'player1': team2Player1, 'player2': team2Player2}
//           : {'player1': team2Player1},
//       'sets': sets,
//       'setNumber': setNumber
//     };
//
//     FirebaseFirestore.instance
//         .collection('clubs')
//         .doc('cho')
//         .collection('matches')
//         .doc('${matchDate.month}')
//         .collection('${matchDate.day}')
//         .add(matchData)
//         .then((_) {
//       // Show success message or navigate back
//     }).catchError((error) {
//       // Show error message
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Add Match'),
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             SwitchListTile(
//               title: const Text('Double Match'),
//               value: isDoubleMatch,
//               onChanged: (bool value) {
//                 setState(() {
//                   isDoubleMatch = value;
//                 });
//               },
//             ),
//             DropdownButtonFormField<String>(
//               decoration: const InputDecoration(labelText: 'Team 1 Player 1'),
//               items: players.map((String player) {
//                 return DropdownMenuItem<String>(
//                   value: player,
//                   child: Text(player),
//                 );
//               }).toList(),
//               onChanged: (String? newValue) {
//                 setState(() {
//                   team1Player1 = newValue!;
//                 });
//               },
//             ),
//             if (isDoubleMatch)
//               DropdownButtonFormField<String>(
//                 decoration: const InputDecoration(labelText: 'Team 1 Player 2'),
//                 items: players.map((String player) {
//                   return DropdownMenuItem<String>(
//                     value: player,
//                     child: Text(player),
//                   );
//                 }).toList(),
//                 onChanged: (String? newValue) {
//                   setState(() {
//                     team1Player2 = newValue!;
//                   });
//                 },
//               ),
//             DropdownButtonFormField<String>(
//               decoration: const InputDecoration(labelText: 'Team 2 Player 1'),
//               items: players.map((String player) {
//                 return DropdownMenuItem<String>(
//                   value: player,
//                   child: Text(player),
//                 );
//               }).toList(),
//               onChanged: (String? newValue) {
//                 setState(() {
//                   team2Player1 = newValue!;
//                 });
//               },
//             ),
//             if (isDoubleMatch)
//               DropdownButtonFormField<String>(
//                 decoration: const InputDecoration(labelText: 'Team 2 Player 2'),
//                 items: players.map((String player) {
//                   return DropdownMenuItem<String>(
//                     value: player,
//                     child: Text(player),
//                   );
//                 }).toList(),
//                 onChanged: (String? newValue) {
//                   setState(() {
//                     team2Player2 = newValue!;
//                   });
//                 },
//               ),
//             ListTile(
//               title: Text("Match Date: ${matchDate.toLocal()}".split(' ')[0]),
//               trailing: const Icon(Icons.calendar_today),
//               onTap: () async {
//                 DateTime? picked = await showDatePicker(
//                   context: context,
//                   initialDate: matchDate,
//                   firstDate: DateTime(2000),
//                   lastDate: DateTime(2101),
//                 );
//                 if (picked != matchDate) {
//                   setState(() {
//                     matchDate = picked!;
//                   });
//                 }
//               },
//             ),
//             ...sets.asMap().entries.map((entry) {
//               int index = entry.key;
//               // Map<String, int> set = entry.value;
//               return Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text('Set ${index + 1}'),
//                   Expanded(
//                     child: TextFormField(
//                       decoration:
//                           const InputDecoration(labelText: 'Team 1 Score'),
//                       keyboardType: TextInputType.number,
//                       onChanged: (value) {
//                         setState(() {
//                           sets[index]['team1'] = int.tryParse(value) ?? 0;
//                         });
//                       },
//                     ),
//                   ),
//                   const SizedBox(width: 16.0),
//                   Expanded(
//                     child: TextFormField(
//                       decoration:
//                           const InputDecoration(labelText: 'Team 2 Score'),
//                       keyboardType: TextInputType.number,
//                       onChanged: (value) {
//                         setState(() {
//                           sets[index]['team2'] = int.tryParse(value) ?? 0;
//                         });
//                       },
//                     ),
//                   ),
//                 ],
//               );
//             }),
//             ElevatedButton(
//               onPressed: _addSet,
//               child: const Text('Add Set'),
//             ),
//             const SizedBox(height: 20.0),
//             ElevatedButton(
//               onPressed: _saveMatch,
//               child: const Text('Save Match'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
