import 'package:flutter/material.dart';
import 'package:test_project/screens/tounament/pick_cham_screen.dart';

import '../../widgets/components/consts/title_text.dart';
import '../single_match/match_screen.dart';


class PickCreateMatchScreen extends StatefulWidget {
  const PickCreateMatchScreen({super.key});

  @override
  State<PickCreateMatchScreen> createState() => _PickCreateMatchScreenState();
}

class _PickCreateMatchScreenState extends State<PickCreateMatchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(child: Text('Tạo Trận Đấu', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black, decoration: TextDecoration.none),)),
        // backgroundColor: Colors.green,
      ),
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              Future.delayed(Duration(milliseconds:3000));
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => MatchScreen()),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              padding: EdgeInsets.symmetric(vertical: 18.0),
                            ),
                            child: Text('Đấu đơn/đôi', style: TextStyle(fontSize: 20, color: Colors.black),),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ControlTourScreen()
                                    ),
                                  );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              padding: EdgeInsets.symmetric(vertical: 18.0),
                            ),
                            child: Text('Đấu giải', style: TextStyle(fontSize: 20, color: Colors.black),),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15,),
                  const Padding(
                    padding: EdgeInsets.only(left: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TitlesTextWidget(label: "Trận đấu gần đây"),
                      ],
                    ),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Flexible(
                          flex: 1,
                          child: Container(
                            height: 100,
                            color: Colors.white54,
                            child: const Center(
                              child: Text('23:00', style: TextStyle(fontSize: 15)),
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 2,
                          child: Container(
                            height: 100,
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
                                    const Expanded(
                                      child: Text(
                                        'Chodov',
                                        style: TextStyle(fontSize: 15),
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
                                    const Expanded(
                                      child: Text(
                                        'TTC Ostrava',
                                        style: TextStyle(fontSize: 15),
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
                          flex: 2,
                          child: Container(
                            height: 100,
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
                                          child: Text('11', style: TextStyle(fontSize: 15)),
                                        ),
                                      ),
                                      Expanded(
                                        child: Center(
                                          child: Text('11', style: TextStyle(fontSize: 15)),
                                        ),
                                      ),
                                      Expanded(
                                        child: Center(
                                          child: Text('11', style: TextStyle(fontSize: 15)),
                                        ),
                                      ),
                                      Expanded(
                                        child: Center(
                                          child: Text('11', style: TextStyle(fontSize: 15)),
                                        ),
                                      ),
                                      Expanded(
                                        child: Center(
                                          child: Text('11', style: TextStyle(fontSize: 15)),
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
                                          child: Text('1', style: TextStyle(fontSize: 15)),
                                        ),
                                      ),
                                      Expanded(
                                        child: Center(
                                          child: Text('6', style: TextStyle(fontSize: 15)),
                                        ),
                                      ),
                                      Expanded(
                                        child: Center(
                                          child: Text('8', style: TextStyle(fontSize: 15)),
                                        ),
                                      ),
                                      Expanded(
                                        child: Center(
                                          child: Text('9', style: TextStyle(fontSize: 15)),
                                        ),
                                      ),
                                      Expanded(
                                        child: Center(
                                          child: Text('1', style: TextStyle(fontSize: 15)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                          child: Container(
                            height: 100,
                            color: Colors.white54,
                            child: const Center(
                              child: Icon(Icons.star),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 15.0, top: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TitlesTextWidget(label: "Trận đấu giải"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
