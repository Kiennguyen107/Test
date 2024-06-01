import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_project/screens/home_screen.dart';
import '../widgets/components/ranking/custom_ranking.dart';
import '../widgets/components/ranking/list_ranking.dart';

class RankingScreen extends StatefulWidget {
  const RankingScreen({super.key});

  @override
  State<RankingScreen> createState() => _RankingScreenState();
}

class _RankingScreenState extends State<RankingScreen> {
  int selectedIndex = 0;
  final List<SampleItem> items = [
    SampleItem(id: '1', name: 'Item 1'),
    SampleItem(id: '2', name: 'Item 2'),
    SampleItem(id: '1', name: 'Item 3'),
    SampleItem(id: '2', name: 'Item 3'),
    SampleItem(id: '1', name: 'Item 3'),
    SampleItem(id: '2', name: 'Item 3'),
    SampleItem(id: '3', name: 'Item 3'),
    SampleItem(id: '1', name: 'Item 3'),
    SampleItem(id: '1', name: 'Item 3'),
    SampleItem(id: '1', name: 'Item 3'),
    SampleItem(id: '1', name: 'Item 3'),
    SampleItem(id: '1', name: 'Item 3'),
    SampleItem(id: '1', name: 'Item 3'),
    SampleItem(id: '2', name: 'Item 3'),
    SampleItem(id: '1', name: 'Item 3'),
    SampleItem(id: '3', name: 'Item 3'),
    SampleItem(id: '3', name: 'Item 2'),
  ];


  Widget buildSelectedContent(int index) {
    switch (index) {
      case 0:
        return ListView.builder(
                shrinkWrap: true,
                physics: ScrollPhysics(),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return SampleItemWidget(
                    item: items[index],
                    onTap: (item) {
                      print(item.id); // In ra ID của mục được nhấn
                    },
                    );
                  },
                );
      case 1:
        return Container();
      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Center(
              child: Text(
                'Bảng Xếp Hạng',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black, decoration: TextDecoration.none),
              ),
            ),
      ),
      body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Row(
                    children:
                      <Widget>[
                        TransparentButton(
                          onPressed: () {
                            setState(() {
                              selectedIndex = 0;
                            });
                          }, // set text color to white
                          isSelected: selectedIndex == 0,
                          child: const Text('MEN',
                              style: TextStyle(color: Colors.black, fontSize: 18)),
                        ),
                        const SizedBox(height: 20),
                        TransparentButton(
                          onPressed: () {
                            setState(() {
                              selectedIndex = 1;
                            });
                          }, // set text color to white
                          isSelected: selectedIndex == 1,
                          child: const Text('WOMEN',
                              style: TextStyle(color: Colors.black, fontSize: 18)),
                        ),
                      ],
                  ),
                ),
                SizedBox(height: 18),
                const Padding(
                  padding: EdgeInsets.only(left: 35.0),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                          child: Text('Tuyển thủ',style: TextStyle(fontSize: 18),)
                      ),
                      SizedBox(width: 70,),
                      Expanded(
                        flex: 2,
                          child: Text('Xếp hạng',style: TextStyle(fontSize: 18))
                      ),
                      SizedBox(width: 12,),
                      Expanded(
                        flex: 2,
                          child: Text('Trận thắng',style: TextStyle(fontSize: 18))
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 5,),
                Container(
                  margin: EdgeInsets.only(bottom: 2,left: 10,right: 10),
                  height: 4,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade600,
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                ),
                Expanded(
                    child: buildSelectedContent(selectedIndex)
                ),
              ],
            ),
    );
  }
}
