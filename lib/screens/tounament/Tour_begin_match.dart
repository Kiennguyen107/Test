import 'package:flutter/material.dart';

class TourBeginMatch extends StatelessWidget {
  final List<String> players;

  TourBeginMatch({required this.players});

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
        matchups.add([validPlayers[i], '']);
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
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (index % 2 == 0) // Every two matchups, add the group stage label
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      'Vòng bảng ${index ~/ 2 + 1}',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                Card(
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
                            child:Text('Trận ${index + 1}'),
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
                                  SizedBox(width: 5),
                                  Expanded(
                                    child: Text(
                                      '${matchups[index][0]}',
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  Container(
                                    width: 15,
                                    height: 15,
                                    color: Colors.green,
                                  ),
                                  SizedBox(width: 5),
                                  Expanded(
                                    child: Text(
                                      '${matchups[index][1]}',
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
                                          child: Text('3',style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                                        )
                                    )
                                  ],
                                ),
                                SizedBox(height: 10,),
                                Row(
                                  children: [
                                    Expanded(
                                        child: Center(
                                          child: Text('0',style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                                        )
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        child: Container(
                          height: 80,
                          color: Colors.white54,
                          child: const Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Expanded(
                                      child: Center(
                                        child: Text('11', style: TextStyle(fontSize: 10)),
                                      ),
                                    ),
                                    Expanded(
                                      child: Center(
                                        child: Text('11', style: TextStyle(fontSize: 10)),
                                      ),
                                    ),
                                    Expanded(
                                      child: Center(
                                        child: Text('11', style: TextStyle(fontSize: 10)),
                                      ),
                                    ),
                                    Expanded(
                                      child: Center(
                                        child: Text('11', style: TextStyle(fontSize: 10)),
                                      ),
                                    ),
                                    Expanded(
                                      child: Center(
                                        child: Text('11', style: TextStyle(fontSize: 10)),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Expanded(
                                      child: Center(
                                        child: Text('1', style: TextStyle(fontSize: 10)),
                                      ),
                                    ),
                                    Expanded(
                                      child: Center(
                                        child: Text('6', style: TextStyle(fontSize: 10)),
                                      ),
                                    ),
                                    Expanded(
                                      child: Center(
                                        child: Text('8', style: TextStyle(fontSize: 10)),
                                      ),
                                    ),
                                    Expanded(
                                      child: Center(
                                        child: Text('9', style: TextStyle(fontSize: 10)),
                                      ),
                                    ),
                                    Expanded(
                                      child: Center(
                                        child: Text('1', style: TextStyle(fontSize: 10)),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                    // subtitle: Text(
                    //   matchups[index][1].isNotEmpty
                    //       ? '${matchups[index][0]} vs ${matchups[index][1]}'
                    //       : '${matchups[index][0]}',
                    // ),
              ],
            );
          },
        ),
      ),
    );
  }
}