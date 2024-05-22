import 'package:flutter/material.dart';
import 'package:test_project/screens/pick_cham_screen.dart';

import 'match_screen.dart';


class CreateMatchScreen extends StatefulWidget {
  const CreateMatchScreen({super.key});

  @override
  State<CreateMatchScreen> createState() => _CreateMatchScreenState();
}

class _CreateMatchScreenState extends State<CreateMatchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(child: Text('Tạo Trận Đấu', style: TextStyle(fontSize: 30),)),
        // backgroundColor: Colors.green,
      ),
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 25,),
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
                                      builder: (context) => SelectionScreen()
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
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
